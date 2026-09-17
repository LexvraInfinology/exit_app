class CreateProfileModel {
  int? statusCode;
  String? message;
  Data? data;

  CreateProfileModel({this.statusCode, this.message, this.data});

  CreateProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? email;
  String? currentLocation;
  String? role;
  bool? isVerified;
  String? connectionStatus;
  Null? profilePhoto;
  String? bio;
  String? experience;
  String? currentStage;
  String? teamSize;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.currentLocation,
      this.role,
      this.isVerified,
      this.connectionStatus,
      this.profilePhoto,
      this.bio,
      this.experience,
      this.currentStage,
      this.teamSize});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    currentLocation = json['current_location'];
    role = json['role'];
    isVerified = json['is_verified'];
    connectionStatus = json['connection_status'];
    profilePhoto = json['profile_photo'];
    bio = json['bio'];
    experience = json['experience'];
    currentStage = json['current_stage'];
    teamSize = json['team_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['current_location'] = this.currentLocation;
    data['role'] = this.role;
    data['is_verified'] = this.isVerified;
    data['connection_status'] = this.connectionStatus;
    data['profile_photo'] = this.profilePhoto;
    data['bio'] = this.bio;
    data['experience'] = this.experience;
    data['current_stage'] = this.currentStage;
    data['team_size'] = this.teamSize;
    return data;
  }
}
