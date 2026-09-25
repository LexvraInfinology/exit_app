class CreateFundRaiseModel {
  int? statusCode;
  String? message;
  CreateFundsRaiseData? data;

  CreateFundRaiseModel({this.statusCode, this.message, this.data});

  CreateFundRaiseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new CreateFundsRaiseData.fromJson(json['data']) : null;
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

class CreateFundsRaiseData {
  int? id;
  String? owner;
  String? fundingGoal;
  String? currency;
  String? stage;
  String? purpose;
  String? companyName;
  String? companyLogo;
  String? industry;
  String? location;
  String? companyWebsite;
  String? companyDescription;
  String? raiseDescription;
  String? fundingTimeline;
  String? pitchDeck;
  String? status;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  CreateFundsRaiseData(
      {this.id,
        this.owner,
        this.fundingGoal,
        this.currency,
        this.stage,
        this.purpose,
        this.companyName,
        this.companyLogo,
        this.industry,
        this.location,
        this.companyWebsite,
        this.companyDescription,
        this.raiseDescription,
        this.fundingTimeline,
        this.pitchDeck,
        this.status,
        this.publishedAt,
        this.createdAt,
        this.updatedAt});

  CreateFundsRaiseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    fundingGoal = json['funding_goal'];
    currency = json['currency'];
    stage = json['stage'];
    purpose = json['purpose'];
    companyName = json['company_name'];
    companyLogo = json['company_logo'];
    industry = json['industry'];
    location = json['location'];
    companyWebsite = json['company_website'];
    companyDescription = json['company_description'];
    raiseDescription = json['raise_description'];
    fundingTimeline = json['funding_timeline'];
    pitchDeck = json['pitch_deck'];
    status = json['status'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner'] = this.owner;
    data['funding_goal'] = this.fundingGoal;
    data['currency'] = this.currency;
    data['stage'] = this.stage;
    data['purpose'] = this.purpose;
    data['company_name'] = this.companyName;
    data['company_logo'] = this.companyLogo;
    data['industry'] = this.industry;
    data['location'] = this.location;
    data['company_website'] = this.companyWebsite;
    data['company_description'] = this.companyDescription;
    data['raise_description'] = this.raiseDescription;
    data['funding_timeline'] = this.fundingTimeline;
    data['pitch_deck'] = this.pitchDeck;
    data['status'] = this.status;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}