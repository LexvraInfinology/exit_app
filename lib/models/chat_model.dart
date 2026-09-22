
class ChatMessage {
  final String type;
  final String messageId;
  final int senderId;
  final String sender; // phone number / identifier string
  final int recipientId;
  final String body;
  final DateTime createdAt;
  final bool isMe;
  final MessageStatus status;

  ChatMessage({
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

  factory ChatMessage.fromJson(Map<String, dynamic> json, {required int currentUserId}) {
    final senderId = json['sender_id'] is int
        ? json['sender_id'] as int
        : int.tryParse(json['sender_id']?.toString() ?? '') ?? 0;

    return ChatMessage(
      type: json['type']?.toString() ?? 'message',
      messageId: json['message_id']?.toString() ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: senderId,
      sender: json['sender']?.toString() ?? '',
      recipientId: json['recipient_id'] is int
          ? json['recipient_id'] as int
          : int.tryParse(json['recipient_id']?.toString() ?? '') ?? 0,
      body: json['body']?.toString() ?? '',
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ?? DateTime.now(),
      isMe: senderId == currentUserId,
      status: MessageStatus.sent,
    );
  }

  ChatMessage copyWith({MessageStatus? status}) {
    return ChatMessage(
      type: type,
      messageId: messageId,
      senderId: senderId,
      sender: sender,
      recipientId: recipientId,
      body: body,
      createdAt: createdAt,
      isMe: isMe,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toSendJson() {
    return {
      'body': body,
    };
  }
}

enum MessageStatus { sending, sent, failed }