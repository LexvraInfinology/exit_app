class UserAuthModel {
  int? id;
  String? mobileNumber;
  String? role;
  bool? is_existing;
  bool? has_profile;

  UserAuthModel(
      {this.id,
      this.mobileNumber,
      this.role,
      this.is_existing,
      this.has_profile});

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobileNumber = json['mobile_number'];
    role = json['role'];
    is_existing = json['is_existing'];
    has_profile = json['has_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile_number'] = this.mobileNumber;
    data['role'] = this.role;
    data['is_existing'] = this.is_existing;
    data['has_profile'] = this.has_profile;
    return data;
  }
}
