class ProfileModel {
  int? statusCode;
  String? message;
  DataProfileModel? data;

  ProfileModel({this.statusCode, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new DataProfileModel.fromJson(json['data']) : null;
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

class DataProfileModel {
  int? count;
  Null? next;
  Null? previous;
  List<ResultsProfile>? results;

  DataProfileModel({this.count, this.next, this.previous, this.results});

  DataProfileModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <ResultsProfile>[];
      json['results'].forEach((v) {
        results!.add(new ResultsProfile.fromJson(v));
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

class ResultsProfile {
  int? id;
  String? email;
  String? dateJoined;
  String? firstName;
  String? lastName;
  String? currentLocation;
  bool? isVerified;
  String? connectionStatus;
  bool? isSaved;
  Null? profilePhoto;
  String? bio;
  String? experience;
  String? currentStage;
  String? teamSize;
  String? preferredInvestment;
  String? preferredStage;
  String? preferredIndustries;
  String? preferredLocation;
  String? role;
  String? mobile;

  ResultsProfile(
      {this.id,
        this.email,
        this.dateJoined,
        this.firstName,
        this.lastName,
        this.currentLocation,
        this.isVerified,
        this.connectionStatus,
        this.isSaved,
        this.profilePhoto,
        this.bio,
        this.experience,
        this.currentStage,
        this.teamSize,
        this.preferredInvestment,
        this.preferredStage,
        this.preferredIndustries,
        this.preferredLocation,
        this.role,
        this.mobile});

  ResultsProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    dateJoined = json['date_joined'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    currentLocation = json['current_location'];
    isVerified = json['is_verified'];
    connectionStatus = json['connection_status'];
    isSaved = json['isSaved'];
    profilePhoto = json['profile_photo'];
    bio = json['bio'];
    experience = json['experience'];
    currentStage = json['current_stage'];
    teamSize = json['team_size'];
    preferredInvestment = json['preferred_investment'];
    preferredStage = json['preferred_stage'];
    preferredIndustries = json['preferred_industries'];
    preferredLocation = json['preferred_location'];
    role = json['role'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['date_joined'] = this.dateJoined;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['current_location'] = this.currentLocation;
    data['is_verified'] = this.isVerified;
    data['connection_status'] = this.connectionStatus;
    data['isSaved'] = this.isSaved;
    data['profile_photo'] = this.profilePhoto;
    data['bio'] = this.bio;
    data['experience'] = this.experience;
    data['current_stage'] = this.currentStage;
    data['team_size'] = this.teamSize;
    data['preferred_investment'] = this.preferredInvestment;
    data['preferred_stage'] = this.preferredStage;
    data['preferred_industries'] = this.preferredIndustries;
    data['preferred_location'] = this.preferredLocation;
    data['role'] = this.role;
    data['mobile'] = this.mobile;
    return data;
  }
}