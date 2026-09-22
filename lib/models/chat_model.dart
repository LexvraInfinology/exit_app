enum MessageStatus {
  sending,
  sent,
  failed,
}


// ============================================================
// CHAT HISTORY RESPONSE
// ============================================================

class ChatHistoryResponse {
  final int statusCode;
  final String message;
  final ChatHistoryData data;

  const ChatHistoryResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ChatHistoryResponse.fromJson(
      Map<String, dynamic> json, {
        required int currentUserId,
      }) {
    return ChatHistoryResponse(
      statusCode: _parseInt(json['status_code']),
      message: json['message']?.toString() ?? '',
      data: ChatHistoryData.fromJson(
        json['data'] is Map<String, dynamic>
            ? json['data'] as Map<String, dynamic>
            : {},
        currentUserId: currentUserId,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status_code': statusCode,
      'message': message,
      'data': data.toJson(),
    };
  }
}


// ============================================================
// CHAT HISTORY DATA
// ============================================================

class ChatHistoryData {
  final int count;
  final String? next;
  final String? previous;
  final List<ChatMessage> results;

  const ChatHistoryData({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ChatHistoryData.fromJson(
      Map<String, dynamic> json, {
        required int currentUserId,
      }) {
    final rawResults = json['results'];

    return ChatHistoryData(
      count: _parseInt(json['count']),
      next: json['next']?.toString(),
      previous: json['previous']?.toString(),

      results: rawResults is List
          ? rawResults
          .whereType<Map<String, dynamic>>()
          .map(
            (item) => ChatMessage.fromJson(
          item,
          currentUserId: currentUserId,
        ),
      )
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results
          .map((message) => message.toJson())
          .toList(),
    };
  }
}


// ============================================================
// CHAT MESSAGE
// ============================================================

class ChatMessage {
  final String type;
  final String messageId;
  final int senderId;
  final String sender;
  final int recipientId;
  final String body;
  final DateTime createdAt;

  /// True when this message belongs to current logged-in user.
  final bool isMe;

  /// Local UI status.
  final MessageStatus status;

  const ChatMessage({
    required this.type,
    required this.messageId,
    required this.senderId,
    required this.sender,
    required this.recipientId,
    required this.body,
    required this.createdAt,
    required this.isMe,
    this.status = MessageStatus.sent,
  });

  factory ChatMessage.fromJson(
      Map<String, dynamic> json, {
        required int currentUserId,
      }) {
    final senderId = _parseInt(json['sender_id']);
    final recipientId = _parseInt(json['recipient_id']);

    return ChatMessage(
      type: json['type']?.toString() ?? 'message',

      messageId: json['message_id']?.toString() ??
          DateTime.now().millisecondsSinceEpoch.toString(),

      senderId: senderId,

      sender: json['sender']?.toString() ?? '',

      recipientId: recipientId,

      body: json['body']?.toString() ?? '',

      createdAt: _parseDateTime(
        json['created_at'],
      ),

      isMe: senderId == currentUserId,

      // API/WebSocket se received message
      // already sent hota hai.
      status: MessageStatus.sent,
    );
  }

  /// JSON representation of the complete message.
  ///
  /// Useful when storing/serializing the message locally.
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'message_id': messageId,
      'sender_id': senderId,
      'sender': sender,
      'recipient_id': recipientId,
      'body': body,
      'created_at': createdAt.toIso8601String(),
    };
  }

  /// JSON used ONLY for sending a message through WebSocket.
  ///
  /// Backend ko sirf body bhejni hai.
  Map<String, dynamic> toSendJson() {
    return {
      'body': body,
    };
  }

  /// Create a copy with changed local UI properties.
  ChatMessage copyWith({
    String? type,
    String? messageId,
    int? senderId,
    String? sender,
    int? recipientId,
    String? body,
    DateTime? createdAt,
    bool? isMe,
    MessageStatus? status,
  }) {
    return ChatMessage(
      type: type ?? this.type,
      messageId: messageId ?? this.messageId,
      senderId: senderId ?? this.senderId,
      sender: sender ?? this.sender,
      recipientId: recipientId ?? this.recipientId,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      isMe: isMe ?? this.isMe,
      status: status ?? this.status,
    );
  }
}


// ============================================================
// HELPERS
// ============================================================

int _parseInt(dynamic value) {
  if (value is int) {
    return value;
  }

  return int.tryParse(
    value?.toString() ?? '',
  ) ??
      0;
}


DateTime _parseDateTime(dynamic value) {
  final date = DateTime.tryParse(
    value?.toString() ?? '',
  );

  return date ?? DateTime.now();
}