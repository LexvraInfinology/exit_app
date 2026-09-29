class CreateSellCompanyModel {
  int? statusCode;
  String? message;
  Data? data;

  CreateSellCompanyModel({this.statusCode, this.message, this.data});

  CreateSellCompanyModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? owner;
  String? title;
  String? description;
  String? price;
  String? currency;
  String? acquisitionType;
  String? expectedTimeline;
  String? industry;
  String? companyStage;
  String? location;
  String? companyWebsite;
  String? annualRevenue;
  String? profitability;
  String? buyerInformation;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.owner,
        this.title,
        this.description,
        this.price,
        this.currency,
        this.acquisitionType,
        this.expectedTimeline,
        this.industry,
        this.companyStage,
        this.location,
        this.companyWebsite,
        this.annualRevenue,
        this.profitability,
        this.buyerInformation,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    currency = json['currency'];
    acquisitionType = json['acquisition_type'];
    expectedTimeline = json['expected_timeline'];
    industry = json['industry'];
    companyStage = json['company_stage'];
    location = json['location'];
    companyWebsite = json['company_website'];
    annualRevenue = json['annual_revenue'];
    profitability = json['profitability'];
    buyerInformation = json['buyer_information'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner'] = this.owner;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['acquisition_type'] = this.acquisitionType;
    data['expected_timeline'] = this.expectedTimeline;
    data['industry'] = this.industry;
    data['company_stage'] = this.companyStage;
    data['location'] = this.location;
    data['company_website'] = this.companyWebsite;
    data['annual_revenue'] = this.annualRevenue;
    data['profitability'] = this.profitability;
    data['buyer_information'] = this.buyerInformation;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}