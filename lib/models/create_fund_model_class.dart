class CreateFundRaiseModel {
  int? statusCode;
  String? message;
  Data? data;

  CreateFundRaiseModel({this.statusCode, this.message, this.data});

  CreateFundRaiseModel.fromJson(Map<String, dynamic> json) {
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
  int? count;
  String? next;
  String? previous;
  List<CreateFundsRaiseData>? results;

  Data({this.count, this.next, this.previous, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <CreateFundsRaiseData>[];
      json['results'].forEach((v) {
        results!.add(new CreateFundsRaiseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
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
  int? viewsCount;
  int? interestedCount;
  int? connectionsCount;
  String? useOfFunds;
  String? founded;
  String? teamSize;
  CompanyDetails? companyDetails;
  List<InvestorActivity>? investorActivity;

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
      this.updatedAt,
      this.viewsCount,
      this.interestedCount,
      this.connectionsCount,
      this.useOfFunds,
      this.founded,
      this.teamSize,
      this.companyDetails,
      this.investorActivity});

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
    viewsCount = json['views_count'];
    interestedCount = json['interested_count'];
    connectionsCount = json['connections_count'];
    useOfFunds = json['use_of_funds'];
    founded = json['founded'];
    teamSize = json['team_size'];
    companyDetails = json['company_details'] != null
        ? new CompanyDetails.fromJson(json['company_details'])
        : null;
    if (json['investor_activity'] != null) {
      investorActivity = <InvestorActivity>[];
      json['investor_activity'].forEach((v) {
        investorActivity!.add(new InvestorActivity.fromJson(v));
      });
    }
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
    data['views_count'] = this.viewsCount;
    data['interested_count'] = this.interestedCount;
    data['connections_count'] = this.connectionsCount;
    data['use_of_funds'] = this.useOfFunds;
    data['founded'] = this.founded;
    data['team_size'] = this.teamSize;
    if (this.companyDetails != null) {
      data['company_details'] = this.companyDetails!.toJson();
    }
    if (this.investorActivity != null) {
      data['investor_activity'] =
          this.investorActivity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyDetails {
  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  CompanyDetails(
      {this.additionalProp1, this.additionalProp2, this.additionalProp3});

  CompanyDetails.fromJson(Map<String, dynamic> json) {
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalProp1'] = this.additionalProp1;
    data['additionalProp2'] = this.additionalProp2;
    data['additionalProp3'] = this.additionalProp3;
    return data;
  }
}

class InvestorActivity {
  int? investorId;
  int? investorProfileId;
  String? investorName;
  String? profilePhoto;
  String? investorRole;
  String? viewedAt;

  InvestorActivity(
      {this.investorId,
      this.investorProfileId,
      this.investorName,
      this.profilePhoto,
      this.investorRole,
      this.viewedAt});

  InvestorActivity.fromJson(Map<String, dynamic> json) {
    investorId = json['investor_id'];
    investorProfileId = json['investor_profile_id'];
    investorName = json['investor_name'];
    profilePhoto = json['profile_photo'];
    investorRole = json['investor_role'];
    viewedAt = json['viewed_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['investor_id'] = this.investorId;
    data['investor_profile_id'] = this.investorProfileId;
    data['investor_name'] = this.investorName;
    data['profile_photo'] = this.profilePhoto;
    data['investor_role'] = this.investorRole;
    data['viewed_at'] = this.viewedAt;
    return data;
  }
}
