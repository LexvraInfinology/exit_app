
class MarketplaceIndustriesResponse {
  final int statusCode;
  final String message;
  final List<MarketplaceIndustry> data;

  MarketplaceIndustriesResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MarketplaceIndustriesResponse.fromJson(Map<String, dynamic> json) {
    return MarketplaceIndustriesResponse(
      statusCode: json['status_code'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => MarketplaceIndustry.fromJson(e as Map<String, dynamic>))
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

class  MarketplaceIndustry {
  final String id;
  final String name;

  MarketplaceIndustry({
    required this.id,
    required this.name,
  });

  factory MarketplaceIndustry.fromJson(Map<String, dynamic> json) {
    return MarketplaceIndustry(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is MarketplaceIndustry && other.id == id);

  @override
  int get hashCode => id.hashCode;
}

