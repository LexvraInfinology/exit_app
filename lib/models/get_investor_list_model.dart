class GetInvestorListModel {
  int? statusCode;
  String? message;
  Data? data;

  GetInvestorListModel({this.statusCode, this.message, this.data});

  GetInvestorListModel.fromJson(Map<String, dynamic> json) {
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
  Null? next;
  Null? previous;
  List<Results>? results;

  Data({this.count, this.next, this.previous, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
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

class Results {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? currentLocation;
  String? role;
  bool? isVerified;
  bool? isSaved;
  String? connectionStatus;
  Null? profilePhoto;
  String? bio;
  String? experience;
  String? currentStage;
  String? teamSize;

  Results(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.currentLocation,
        this.role,
        this.isVerified,
        this.isSaved,
        this.connectionStatus,
        this.profilePhoto,
        this.bio,
        this.experience,
        this.currentStage,
        this.teamSize});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    currentLocation = json['current_location'];
    role = json['role'];
    isVerified = json['is_verified'];
    isSaved = json['isSaved'];
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
    data['isSaved'] = this.isSaved;
    data['connection_status'] = this.connectionStatus;
    data['profile_photo'] = this.profilePhoto;
    data['bio'] = this.bio;
    data['experience'] = this.experience;
    data['current_stage'] = this.currentStage;
    data['team_size'] = this.teamSize;
    return data;
  }
}