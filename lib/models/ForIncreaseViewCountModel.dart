import 'CompanyDetails.dart';
import 'InvestorActivity.dart';

class ForIncreaseViewCountModel {
  int? statusCode;
  String? message;
  Data? data;

  ForIncreaseViewCountModel({this.statusCode, this.message, this.data});

  ForIncreaseViewCountModel.fromJson(Map<String, dynamic> json) {
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
  String? fundingGoal;
  String? currency;
  String? equity;
  String? acquisitionType;
  String? companyStage;
  String? purpose;
  String? companyName;
  String? companyLogo;
  String? industry;
  String? location;
  String? companyWebsite;
  String? companyDescription;
  String? raiseDescription;
  String? buyerInformation;
  String? annualRevenue;
  String? monthlyRevenue;
  String? profitability;
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

  Data(
      {this.id,
        this.owner,
        this.fundingGoal,
        this.currency,
        this.equity,
        this.acquisitionType,
        this.companyStage,
        this.purpose,
        this.companyName,
        this.companyLogo,
        this.industry,
        this.location,
        this.companyWebsite,
        this.companyDescription,
        this.raiseDescription,
        this.buyerInformation,
        this.annualRevenue,
        this.monthlyRevenue,
        this.profitability,
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    fundingGoal = json['funding_goal'];
    currency = json['currency'];
    equity = json['equity'];
    acquisitionType = json['acquisition_type'];
    companyStage = json['company_stage'];
    purpose = json['purpose'];
    companyName = json['company_name'];
    companyLogo = json['company_logo'];
    industry = json['industry'];
    location = json['location'];
    companyWebsite = json['company_website'];
    companyDescription = json['company_description'];
    raiseDescription = json['raise_description'];
    buyerInformation = json['buyer_information'];
    annualRevenue = json['annual_revenue'];
    monthlyRevenue = json['monthly_revenue'];
    profitability = json['profitability'];
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
    data['equity'] = this.equity;
    data['acquisition_type'] = this.acquisitionType;
    data['company_stage'] = this.companyStage;
    data['purpose'] = this.purpose;
    data['company_name'] = this.companyName;
    data['company_logo'] = this.companyLogo;
    data['industry'] = this.industry;
    data['location'] = this.location;
    data['company_website'] = this.companyWebsite;
    data['company_description'] = this.companyDescription;
    data['raise_description'] = this.raiseDescription;
    data['buyer_information'] = this.buyerInformation;
    data['annual_revenue'] = this.annualRevenue;
    data['monthly_revenue'] = this.monthlyRevenue;
    data['profitability'] = this.profitability;
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

