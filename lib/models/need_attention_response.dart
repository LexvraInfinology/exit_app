class NeedsAttentionResponse {
  final int statusCode;
  final String message;
  final List<NeedsAttentionItem> data;

  NeedsAttentionResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory NeedsAttentionResponse.fromJson(dynamic json) {
    if (json is List) {
      return NeedsAttentionResponse(
        statusCode: 200,
        message: '',
        data: json
            .map((e) => NeedsAttentionItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    final Map<String, dynamic> map = json as Map<String, dynamic>;
    return NeedsAttentionResponse(
      statusCode: map['status_code'] as int? ?? 0,
      message: map['message']?.toString() ?? '',
      data: (map['data'] as List<dynamic>? ?? [])
          .map((e) => NeedsAttentionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class NeedsAttentionAllResponse {
  final int statusCode;
  final String message;
  final List<NeedsAttentionItem> data;

  NeedsAttentionAllResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory NeedsAttentionAllResponse.fromJson(Map<String, dynamic> json) {
    return NeedsAttentionAllResponse(
      statusCode: json['status_code'] as int? ?? 0,
      message: json['message']?.toString() ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => NeedsAttentionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class NeedsAttentionItem {
  final String conversationId;
  final int founderId;
  final String founderName;
  final String founderProfilePhoto;
  final String latestMessage;
  final String latestMessageTime;
  final int unreadCount;
  final bool isRead;
  final String openConversationUrl;

  NeedsAttentionItem({
    required this.conversationId,
    required this.founderId,
    required this.founderName,
    required this.founderProfilePhoto,
    required this.latestMessage,
    required this.latestMessageTime,
    required this.unreadCount,
    required this.isRead,
    required this.openConversationUrl,
  });

  factory NeedsAttentionItem.fromJson(Map<String, dynamic> json) {
    return NeedsAttentionItem(
      conversationId: json['conversation_id']?.toString() ?? '',
      founderId: json['founder_id'] is int
          ? json['founder_id'] as int
          : int.tryParse(json['founder_id']?.toString() ?? '') ?? 0,
      founderName: json['founder_name']?.toString() ?? '',
      founderProfilePhoto: json['founder_profile_photo']?.toString() ?? '',
      latestMessage: json['latest_message']?.toString() ?? '',
      latestMessageTime: json['latest_message_time']?.toString() ?? '',
      unreadCount: json['unread_count'] is int
          ? json['unread_count'] as int
          : int.tryParse(json['unread_count']?.toString() ?? '') ?? 0,
      isRead: json['is_read'] as bool? ?? false,
      openConversationUrl: json['open_conversation_url']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversation_id': conversationId,
      'founder_id': founderId,
      'founder_name': founderName,
      'founder_profile_photo': founderProfilePhoto,
      'latest_message': latestMessage,
      'latest_message_time': latestMessageTime,
      'unread_count': unreadCount,
      'is_read': isRead,
      'open_conversation_url': openConversationUrl,
    };
  }
}