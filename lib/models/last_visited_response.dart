class NewSinceLastVisitResponse {
  final int statusCode;
  final String message;
  final NewSinceLastVisitData data;

  NewSinceLastVisitResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory NewSinceLastVisitResponse.fromJson(Map<String, dynamic> json) {
    return NewSinceLastVisitResponse(
      statusCode: json['status_code'] as int? ?? 0,
      message: json['message']?.toString() ?? '',
      data: NewSinceLastVisitData.fromJson(
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

class NewSinceLastVisitData {
  final int count;
  final String? next;
  final String? previous;
  final List<LastVisitFundingRequest> results;

  NewSinceLastVisitData({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory NewSinceLastVisitData.fromJson(Map<String, dynamic> json) {
    return NewSinceLastVisitData(
      count: json['count'] as int? ?? 0,
      next: json['next']?.toString(),
      previous: json['previous']?.toString(),
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) =>
          LastVisitFundingRequest.fromJson(e as Map<String, dynamic>))
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

class LastVisitFundingRequest {
  final int id;
  final String owner;
  final String fundingGoal; // e.g. "15000000.00"
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

  LastVisitFundingRequest({
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
  });

  /// Parsed numeric funding goal, e.g. 15000000.00
  double get fundingGoalAmount => double.tryParse(fundingGoal) ?? 0.0;

  factory LastVisitFundingRequest.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(dynamic value) {
      if (value == null) return null;
      return DateTime.tryParse(value.toString());
    }

    return LastVisitFundingRequest(
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
    };
  }
}