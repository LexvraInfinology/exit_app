class ConnectionResponse {
  final int statusCode;
  final String message;
  final ConnectionData data;

  ConnectionResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ConnectionResponse.fromJson(Map<String, dynamic> json) {
    return ConnectionResponse(
      statusCode: json['status_code'] ?? 0,
      message: json['message'] ?? '',
      data: ConnectionData.fromJson(json['data'] ?? {}),
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

class ConnectionData {
  final int id;
  final int founderId;
  final int investorId;
  final String connectionStatus;
  final bool canMessage;
  final DateTime createdAt;
  final int creditsRemaining;

  ConnectionData({
    required this.id,
    required this.founderId,
    required this.investorId,
    required this.connectionStatus,
    required this.canMessage,
    required this.createdAt,
    required this.creditsRemaining,
  });

  factory ConnectionData.fromJson(Map<String, dynamic> json) {
    return ConnectionData(
      id: json['id'] ?? 0,
      founderId: json['founder_id'] ?? 0,
      investorId: json['investor_id'] ?? 0,
      connectionStatus: json['connection_status'] ?? '',
      canMessage: json['can_message'] ?? false,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      creditsRemaining: json['credits_remaining'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'founder_id': founderId,
      'investor_id': investorId,
      'connection_status': connectionStatus,
      'can_message': canMessage,
      'created_at': createdAt.toIso8601String(),
      'credits_remaining': creditsRemaining,
    };
  }
}