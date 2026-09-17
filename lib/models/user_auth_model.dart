class UserAuthModel {
  int? id;
  String? mobileNumber;
  String? role;

  UserAuthModel({this.id, this.mobileNumber, this.role});

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobileNumber = json['mobile_number'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile_number'] = this.mobileNumber;
    data['role'] = this.role;
    return data;
  }
}
