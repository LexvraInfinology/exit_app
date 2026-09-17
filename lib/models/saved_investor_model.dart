class SavedInvestorModel {
  int? statusCode;
  String? message;
  Data? data;

  SavedInvestorModel({this.statusCode, this.message, this.data});

  SavedInvestorModel.fromJson(Map<String, dynamic> json) {
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
  int? investorId;
  String? createdAt;

  Data({this.id, this.investorId, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    investorId = json['investor_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['investor_id'] = this.investorId;
    data['created_at'] = this.createdAt;
    return data;
  }
}