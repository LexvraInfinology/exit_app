

class FounderDiscoveryResponse {
  final int statusCode;
  final String message;
  final FounderDiscoveryData data;

  FounderDiscoveryResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory FounderDiscoveryResponse.fromJson(Map<String, dynamic> json) {
    return FounderDiscoveryResponse(
      statusCode: json['status_code'] as int? ?? 0,
      message: json['message']?.toString() ?? '',
      data: FounderDiscoveryData.fromJson(
        json['data'] as Map<String, dynamic>? ?? {},
      ),
    );
  }
}

class FounderProfile {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String currentLocation;
  final String role;
  final bool isVerified;
  final String connectionStatus;
  final bool isSaved;
  final String profilePhoto;
  final String bio;
  final String experience; // e.g. "0-2"
  final String currentStage; // e.g. "idea"
  final String teamSize; // e.g. "1"
  final String preferredInvestment;
  final String preferredStage; // e.g. "pre_seed"
  final String preferredIndustries;
  final String preferredLocation;
  final int founderId;

  FounderProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.currentLocation,
    required this.role,
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
    required this.founderId
  });

  String get fullName => '$firstName $lastName'.trim();

  factory FounderProfile.fromJson(Map<String, dynamic> json) {
    return FounderProfile(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id']?.toString() ?? '') ?? 0,
      firstName: json['first_name']?.toString() ?? '',
      lastName: json['last_name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      currentLocation: json['current_location']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
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
      preferredIndustries: json['preferred_industries']?.toString() ?? '',
      preferredLocation: json['preferred_location']?.toString() ?? '',
      founderId: json['founder_id'] is int
          ? json['founder_id'] as int
          : int.tryParse(json['founder_id']?.toString() ?? '') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'current_location': currentLocation,
      'role': role,
      'is_verified': isVerified,
      'connection_status': connectionStatus,
      'isSaved': isSaved,
      'profile_photo': profilePhoto,
      'bio': bio,
      'experience': experience,
      'current_stage': currentStage,
      'team_size': teamSize,
      'preferred_investment': preferredInvestment,
      'preferred_stage': preferredStage,
      'preferred_industries': preferredIndustries,
      'preferred_location': preferredLocation,
      'founder_id': founderId
    };
  }
}

class FounderDiscoveryData {
  final int count;
  final String? next;
  final String? previous;
  final List<FounderProfile> results;

  FounderDiscoveryData({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory FounderDiscoveryData.fromJson(Map<String, dynamic> json) {
    return FounderDiscoveryData(
      count: json['count'] as int? ?? 0,
      next: json['next']?.toString(),
      previous: json['previous']?.toString(),
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => FounderProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

