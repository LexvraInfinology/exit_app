class FundingRequestListResponse {
  final int statusCode;
  final String message;
  final FundingRequestListData data;

  FundingRequestListResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory FundingRequestListResponse.fromJson(Map<String, dynamic> json) {
    return FundingRequestListResponse(
      statusCode: json['status_code'] as int? ?? 0,
      message: json['message']?.toString() ?? '',
      data: FundingRequestListData.fromJson(
        json['data'] as Map<String, dynamic>? ?? {},
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

class FundingRequestListData {
  final int count;
  final String? next;
  final String? previous;
  final List<FundingRequest> results;

  FundingRequestListData({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory FundingRequestListData.fromJson(Map<String, dynamic> json) {
    return FundingRequestListData(
      count: json['count'] as int? ?? 0,
      next: json['next']?.toString(),
      previous: json['previous']?.toString(),
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => FundingRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((e) => e.toJson()).toList(),
    };
  }
}

class FundingRequest {
  final int id;
  final String owner;
  final String fundingGoal; // API returns "15000000.00" as string
  final String currency;
  final String stage; // e.g. "seed"
  final String purpose; // e.g. "product_development"
  final String companyName;
  final String? companyLogo;
  final String industry;
  final String location;
  final String companyWebsite;
  final String companyDescription;
  final String raiseDescription;
  final String fundingTimeline; // e.g. "3_6_months"
  final String? pitchDeck;
  final String status; // e.g. "published"
  final DateTime? publishedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final FounderProfile profile;
   bool isSaved;
  bool isLoading;
  final String connectionStatus; // top-level (also duplicated inside profile)

  FundingRequest({
    required this.id,
    required this.owner,
    required this.fundingGoal,
    required this.currency,
    required this.stage,
    required this.purpose,
    required this.companyName,
    this.companyLogo,
    required this.industry,
    required this.location,
    required this.companyWebsite,
    required this.companyDescription,
    required this.raiseDescription,
    required this.fundingTimeline,
    this.pitchDeck,
    required this.status,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    required this.profile,
    required this.connectionStatus,
    required this.isSaved,
    this.isLoading = false
  });

  /// Parsed numeric funding goal, e.g. 15000000.00
  double get fundingGoalAmount => double.tryParse(fundingGoal) ?? 0.0;

  factory FundingRequest.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(dynamic value) {
      if (value == null) return null;
      return DateTime.tryParse(value.toString());
    }

    return FundingRequest(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id']?.toString() ?? '') ?? 0,
      owner: json['owner']?.toString() ?? '',
      fundingGoal: json['funding_goal']?.toString() ?? '0',
      currency: json['currency']?.toString() ?? '',
      stage: json['stage']?.toString() ?? '',
      purpose: json['purpose']?.toString() ?? '',
      companyName: json['company_name']?.toString() ?? '',
      companyLogo: json['company_logo']?.toString(),
      industry: json['industry']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      companyWebsite: json['company_website']?.toString() ?? '',
      companyDescription: json['company_description']?.toString() ?? '',
      raiseDescription: json['raise_description']?.toString() ?? '',
      fundingTimeline: json['funding_timeline']?.toString() ?? '',
      pitchDeck: json['pitch_deck']?.toString(),
      status: json['status']?.toString() ?? '',
      publishedAt: parseDate(json['published_at']),
      createdAt: parseDate(json['created_at']),
      updatedAt: parseDate(json['updated_at']),
      profile: FounderProfile.fromJson(
        json['profile'] as Map<String, dynamic>? ?? {},
      ),
      connectionStatus: json['connection_status']?.toString() ?? '',
      isSaved: json['isSaved'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner': owner,
      'funding_goal': fundingGoal,
      'currency': currency,
      'stage': stage,
      'purpose': purpose,
      'company_name': companyName,
      'company_logo': companyLogo,
      'industry': industry,
      'location': location,
      'company_website': companyWebsite,
      'company_description': companyDescription,
      'raise_description': raiseDescription,
      'funding_timeline': fundingTimeline,
      'pitch_deck': pitchDeck,
      'status': status,
      'published_at': publishedAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'profile': profile.toJson(),
      'connection_status': connectionStatus,
      "isSaved": isSaved,
    };
  }
}

class FounderProfile {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String currentLocation;
  final String role;
  final String userRole;
  final bool isVerified;
  final String connectionStatus;
  final bool isSaved;
  final String? profilePhoto;
  final String bio;
  final String experience; // e.g. "3-5"
  final String currentStage; // e.g. "seed"
  final String teamSize; // e.g. "2-10"
  final String preferredInvestment;
  final String founded; // e.g. "2021"
  final String fundType; // e.g. "Seed Fund"
  final List<dynamic> investmentHistory;
  final String preferredStage; // e.g. "Seed"
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
    required this.userRole,
    required this.isVerified,
    required this.connectionStatus,
    required this.isSaved,
    this.profilePhoto,
    required this.bio,
    required this.experience,
    required this.currentStage,
    required this.teamSize,
    required this.preferredInvestment,
    required this.founded,
    required this.fundType,
    required this.investmentHistory,
    required this.preferredStage,
    required this.preferredIndustries,
    required this.preferredLocation,
    required this.founderId,
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
      userRole: json['user_role']?.toString() ?? '',
      isVerified: json['is_verified'] as bool? ?? false,
      connectionStatus: json['connection_status']?.toString() ?? '',
      isSaved: json['isSaved'] as bool? ?? false,
      profilePhoto: json['profile_photo']?.toString(),
      bio: json['bio']?.toString() ?? '',
      experience: json['experience']?.toString() ?? '',
      currentStage: json['current_stage']?.toString() ?? '',
      teamSize: json['team_size']?.toString() ?? '',
      preferredInvestment: json['preferred_investment']?.toString() ?? '',
      founded: json['founded']?.toString() ?? '',
      fundType: json['fund_type']?.toString() ?? '',
      investmentHistory:
      (json['investment_history'] as List<dynamic>?) ?? const [],
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
      'user_role': userRole,
      'is_verified': isVerified,
      'connection_status': connectionStatus,
      'isSaved': isSaved,
      'profile_photo': profilePhoto,
      'bio': bio,
      'experience': experience,
      'current_stage': currentStage,
      'team_size': teamSize,
      'preferred_investment': preferredInvestment,
      'founded': founded,
      'fund_type': fundType,
      'investment_history': investmentHistory,
      'preferred_stage': preferredStage,
      'preferred_industries': preferredIndustries,
      'preferred_location': preferredLocation,
      'founder_id': founderId,
    };
  }
}