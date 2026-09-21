
class ConversationResponse {
  final int statusCode;
  final String message;
  final List<ConversationItem> data;

  ConversationResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ConversationResponse.fromJson(Map<String, dynamic> json) {
    return ConversationResponse(
      statusCode: json['status_code'] as int? ?? 0,
      message: json['message']?.toString() ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => ConversationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status_code': statusCode,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class ConversationItem {
  final int userId;
  final String name;
  final String role;
  final String? profilePhoto;
  final String latestMessage;
  final String latestMessageTime;
  final int unreadCount;
  final bool isConnected;
  final String conversationId;
  final String openConversationUrl;

  ConversationItem({
    required this.userId,
    required this.name,
    required this.role,
    this.profilePhoto,
    required this.latestMessage,
    required this.latestMessageTime,
    required this.unreadCount,
    required this.isConnected,
    required this.conversationId,
    required this.openConversationUrl,
  });

  factory ConversationItem.fromJson(Map<String, dynamic> json) {
    return ConversationItem(
      userId: json['user_id'] is int
          ? json['user_id'] as int
          : int.tryParse(json['user_id']?.toString() ?? '') ?? 0,
      name: json['name']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      profilePhoto: json['profile_photo']?.toString(),
      latestMessage: json['latest_message']?.toString() ?? '',
      latestMessageTime: json['latest_message_time']?.toString() ?? '',
      unreadCount: json['unread_count'] is int
          ? json['unread_count'] as int
          : int.tryParse(json['unread_count']?.toString() ?? '') ?? 0,
      isConnected: json['is_connected'] as bool? ?? false,
      conversationId: json['conversation_id']?.toString() ?? '',
      openConversationUrl: json['open_conversation_url']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'role': role,
      'profile_photo': profilePhoto,
      'latest_message': latestMessage,
      'latest_message_time': latestMessageTime,
      'unread_count': unreadCount,
      'is_connected': isConnected,
      'conversation_id': conversationId,
      'open_conversation_url': openConversationUrl,
    };
  }
}