class PortfolioResponse {
  final int statusCode;
  final String message;
  final PortfolioData data;

  PortfolioResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory PortfolioResponse.fromJson(Map<String, dynamic> json) {
    return PortfolioResponse(
      statusCode: json['status_code'] as int? ?? 0,
      message: json['message']?.toString() ?? '',
      data: PortfolioData.fromJson(
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

class PortfolioData {
  final PortfolioSummary summary;
  final List<Investment> investments;

  PortfolioData({
    required this.summary,
    required this.investments,
  });

  factory PortfolioData.fromJson(Map<String, dynamic> json) {
    return PortfolioData(
      summary: PortfolioSummary.fromJson(
        json['summary'] as Map<String, dynamic>? ?? {},
      ),
      investments: (json['investments'] as List<dynamic>? ?? [])
          .map((e) => Investment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'summary': summary.toJson(),
      'investments': investments.map((e) => e.toJson()).toList(),
    };
  }
}

class PortfolioSummary {
  final String totalInvestment; // e.g. "6500000.00"
  final String activeInvestment; // e.g. "6500000.00"

  PortfolioSummary({
    required this.totalInvestment,
    required this.activeInvestment,
  });

  /// Parsed numeric values for calculations / formatting.
  double get totalInvestmentAmount => double.tryParse(totalInvestment) ?? 0.0;
  double get activeInvestmentAmount =>
      double.tryParse(activeInvestment) ?? 0.0;

  factory PortfolioSummary.fromJson(Map<String, dynamic> json) {
    return PortfolioSummary(
      totalInvestment: json['total_investment']?.toString() ?? '0.00',
      activeInvestment: json['active_investment']?.toString() ?? '0.00',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_investment': totalInvestment,
      'active_investment': activeInvestment,
    };
  }
}

class Investment {
  final int id;
  final String companyName;
  final String industry;
  final String location;
  final String investmentType; // e.g. "Partial Acquisition"
  final String investedAmount; // e.g. "6500000.00"
  final String? ownership; // nullable — not always known
  final DateTime? investedOn;
  final String round; // e.g. "seed"
  final String? currentValuation; // nullable
  final String? unrealisedReturns; // nullable
  final DateTime? latestUpdate;
  final String latestMessage;
  final DateTime? latestMessageTime;
  final String relativeTime; // e.g. "14m ago" (server-computed)
  final String currency; // e.g. "INR"
  final String status; // e.g. "completed"

  Investment({
    required this.id,
    required this.companyName,
    required this.industry,
    required this.location,
    required this.investmentType,
    required this.investedAmount,
    this.ownership,
    this.investedOn,
    required this.round,
    this.currentValuation,
    this.unrealisedReturns,
    this.latestUpdate,
    required this.latestMessage,
    this.latestMessageTime,
    required this.relativeTime,
    required this.currency,
    required this.status,
  });

  /// Parsed numeric invested amount, e.g. 6500000.00
  double get investedAmountValue => double.tryParse(investedAmount) ?? 0.0;

  /// Parsed numeric current valuation, null if not available.
  double? get currentValuationValue =>
      currentValuation != null ? double.tryParse(currentValuation!) : null;

  /// Parsed numeric unrealised returns, null if not available.
  double? get unrealisedReturnsValue => unrealisedReturns != null
      ? double.tryParse(unrealisedReturns!)
      : null;

  factory Investment.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(dynamic value) {
      if (value == null) return null;
      return DateTime.tryParse(value.toString());
    }

    return Investment(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id']?.toString() ?? '') ?? 0,
      companyName: json['company_name']?.toString() ?? '',
      industry: json['industry']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      investmentType: json['investment_type']?.toString() ?? '',
      investedAmount: json['invested_amount']?.toString() ?? '0.00',
      ownership: json['ownership']?.toString(),
      investedOn: parseDate(json['invested_on']),
      round: json['round']?.toString() ?? '',
      currentValuation: json['current_valuation']?.toString(),
      unrealisedReturns: json['unrealised_returns']?.toString(),
      latestUpdate: parseDate(json['latest_update']),
      latestMessage: json['latest_message']?.toString() ?? '',
      latestMessageTime: parseDate(json['latest_message_time']),
      relativeTime: json['relative_time']?.toString() ?? '',
      currency: json['currency']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_name': companyName,
      'industry': industry,
      'location': location,
      'investment_type': investmentType,
      'invested_amount': investedAmount,
      'ownership': ownership,
      'invested_on': investedOn?.toIso8601String(),
      'round': round,
      'current_valuation': currentValuation,
      'unrealised_returns': unrealisedReturns,
      'latest_update': latestUpdate?.toIso8601String(),
      'latest_message': latestMessage,
      'latest_message_time': latestMessageTime?.toIso8601String(),
      'relative_time': relativeTime,
      'currency': currency,
      'status': status,
    };
  }
}