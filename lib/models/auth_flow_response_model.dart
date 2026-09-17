import 'package:exit_app/models/user_auth_model.dart';

class AuthFlowResponseModelClass {
  String? message;
  int? status_code;
  String? token;
  DataAuth? data;


  AuthFlowResponseModelClass({this.message});

  AuthFlowResponseModelClass.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status_code = json['status_code'];
    token = json['token'];
    data = json['data'] != null ? new DataAuth.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.status_code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataAuth {
  String? token;
  UserAuthModel? user;

  DataAuth({this.token, this.user});

  DataAuth.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user =
        json['user'] != null ? new UserAuthModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
