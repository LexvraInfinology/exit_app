class BoostRequestModel {
  int? statusCode;
  String? message;
  Data? data;

  BoostRequestModel({this.statusCode, this.message, this.data});

  BoostRequestModel.fromJson(Map<String, dynamic> json) {
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
  int? profileId;
  String? profileType;
  String? goal;
  String? targetAudience;
  String? amount;
  String? boostStartAt;
  int? durationDays;
  int? estimatedReach;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.profileId,
      this.profileType,
      this.goal,
      this.targetAudience,
      this.amount,
      this.boostStartAt,
      this.durationDays,
      this.estimatedReach,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileId = json['profile_id'];
    profileType = json['profile_type'];
    goal = json['goal'];
    targetAudience = json['target_audience'];
    amount = json['amount'];
    boostStartAt = json['boost_start_at'];
    durationDays = json['duration_days'];
    estimatedReach = json['estimated_reach'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profile_id'] = this.profileId;
    data['profile_type'] = this.profileType;
    data['goal'] = this.goal;
    data['target_audience'] = this.targetAudience;
    data['amount'] = this.amount;
    data['boost_start_at'] = this.boostStartAt;
    data['duration_days'] = this.durationDays;
    data['estimated_reach'] = this.estimatedReach;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
