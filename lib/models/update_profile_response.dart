class UpdateProfileResponse {
  final int statusCode;
  final String message;
  final UserProfile data;

  UpdateProfileResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      statusCode: json['status_code'] as int? ?? 0,
      message: json['message']?.toString() ?? '',
      data: UserProfile.fromJson(json['data'] as Map<String, dynamic>? ?? {}),
    );
  }
}

class UserProfile {
  final int id;
  final String email;
  final String dateJoined;
  final String firstName;
  final String lastName;
  final String currentLocation;
  final bool isVerified;
  final String connectionStatus;
  final bool isSaved;
  final String profilePhoto;
  final String bio;
  final String experience;
  final String currentStage;
  final String teamSize;
  final String preferredInvestment;
  final String preferredStage;
  final List<String> preferredIndustries; // NOTE: list in response, unlike request (string)
  final String preferredLocation;
  final Map<String, dynamic> planDetails;

  UserProfile({
    required this.id,
    required this.email,
    required this.dateJoined,
    required this.firstName,
    required this.lastName,
    required this.currentLocation,
    required this.isVerified,
    required this.connectionStatus,
    required this.isSaved,
    required this.profilePhoto,
    required this.bio,
    required this.experience,
    required this.currentStage,
    required this.teamSize,
    required this.preferredInvestment,
    required this.preferredStage,
    required this.preferredIndustries,
    required this.preferredLocation,
    required this.planDetails,
  });

  String get fullName => '$firstName $lastName'.trim();

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id']?.toString() ?? '') ?? 0,
      email: json['email']?.toString() ?? '',
      dateJoined: json['date_joined']?.toString() ?? '',
      firstName: json['first_name']?.toString() ?? '',
      lastName: json['last_name']?.toString() ?? '',
      currentLocation: json['current_location']?.toString() ?? '',
      isVerified: json['is_verified'] as bool? ?? false,
      connectionStatus: json['connection_status']?.toString() ?? '',
      isSaved: json['isSaved'] as bool? ?? false,
      profilePhoto: json['profile_photo']?.toString() ?? '',
      bio: json['bio']?.toString() ?? '',
      experience: json['experience']?.toString() ?? '',
      currentStage: json['current_stage']?.toString() ?? '',
      teamSize: json['team_size']?.toString() ?? '',
      preferredInvestment: json['preferred_investment']?.toString() ?? '',
      preferredStage: json['preferred_stage']?.toString() ?? '',
      preferredIndustries: (json['preferred_industries'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      preferredLocation: json['preferred_location']?.toString() ?? '',
      planDetails: json['plan_details'] as Map<String, dynamic>? ?? {},
    );
  }
}
