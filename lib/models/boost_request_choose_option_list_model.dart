class BoostProfileChooseOptionListModel {
  int? statusCode;
  String? message;
  Data? data;

  BoostProfileChooseOptionListModel({this.statusCode, this.message, this.data});

  BoostProfileChooseOptionListModel.fromJson(Map<String, dynamic> json) {
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
  List<Goals>? goals;
  List<Goals>? targetAudiences;

  Data({this.goals, this.targetAudiences});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['goals'] != null) {
      goals = <Goals>[];
      json['goals'].forEach((v) {
        goals!.add(new Goals.fromJson(v));
      });
    }
    if (json['target_audiences'] != null) {
      targetAudiences = <Goals>[];
      json['target_audiences'].forEach((v) {
        targetAudiences!.add(new Goals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.goals != null) {
      data['goals'] = this.goals!.map((v) => v.toJson()).toList();
    }
    if (this.targetAudiences != null) {
      data['target_audiences'] =
          this.targetAudiences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Goals {
  int? id;
  String? name;

  Goals({this.id, this.name});

  Goals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}