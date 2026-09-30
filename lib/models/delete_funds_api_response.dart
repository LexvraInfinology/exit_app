class DeleteFundsApiResponse {
  int? statusCode;
  String? message;
  Data? data;

  DeleteFundsApiResponse({this.statusCode, this.message, this.data});

  DeleteFundsApiResponse.fromJson(Map<String, dynamic> json) {
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
  bool? deleted;
  int? id;

  Data({this.deleted, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    deleted = json['deleted'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deleted'] = this.deleted;
    data['id'] = this.id;
    return data;
  }
}