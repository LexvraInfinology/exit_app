class InvestorActivity {
  int? investorId;
  int? investorProfileId;
  String? investorName;
  String? profilePhoto;
  String? investorRole;
  String? location;
  String? fundType;
  String? viewedAt;

  InvestorActivity(
      {this.investorId,
        this.investorProfileId,
        this.investorName,
        this.profilePhoto,
        this.investorRole,
        this.location,
        this.fundType,
        this.viewedAt});

  InvestorActivity.fromJson(Map<String, dynamic> json) {
    investorId = json['investor_id'];
    investorProfileId = json['investor_profile_id'];
    investorName = json['investor_name'];
    profilePhoto = json['profile_photo'];
    investorRole = json['investor_role'];
    location = json['location'];
    fundType = json['fund_type'];
    viewedAt = json['viewed_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['investor_id'] = this.investorId;
    data['investor_profile_id'] = this.investorProfileId;
    data['investor_name'] = this.investorName;
    data['profile_photo'] = this.profilePhoto;
    data['investor_role'] = this.investorRole;
    data['location'] = this.location;
    data['fund_type'] = this.fundType;
    data['viewed_at'] = this.viewedAt;
    return data;
  }
}