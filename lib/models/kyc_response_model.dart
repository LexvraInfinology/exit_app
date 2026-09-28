class KycVerificationResponse {
  final int statusCode;
  final String message;
  final PanVerificationData data;

  KycVerificationResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory KycVerificationResponse.fromJson(Map<String, dynamic> json) {
    return KycVerificationResponse(
      statusCode: json['status_code'] as int? ?? 0,
      message: json['message']?.toString() ?? '',
      data: PanVerificationData.fromJson(
        json['data'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'status_code': statusCode,
    'message': message,
    'data': data.toJson(),
  };
}

class PanVerificationData {
  final String? panImage;
  final String? panNumber;
  final String fullName; 
  final String? dateOfBirth; 
  final bool isVerified;

  PanVerificationData({
    this.panImage,
    this.panNumber,
    required this.fullName,
    this.dateOfBirth,
    required this.isVerified,
  });

  factory PanVerificationData.fromJson(Map<String, dynamic> json) {
    return PanVerificationData(
      panImage: json['pan_image']?.toString(),
      panNumber: json['pan_number']?.toString(),
      fullName: json['full_name']?.toString() ?? '',
      dateOfBirth: json['date_of_birth']?.toString(),
      isVerified: json['is_verified'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'pan_image': panImage,
    'pan_number': panNumber,
    'full_name': fullName,
    'date_of_birth': dateOfBirth,
    'is_verified': isVerified,
  };
}
 
