class SearchSuggestionListModel {
  int? statusCode;
  String? message;
  List<SearchSuggestionListData>? data;

  SearchSuggestionListModel({this.statusCode, this.message, this.data});

  SearchSuggestionListModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SearchSuggestionListData>[];
      json['data'].forEach((v) {
        data!.add(new SearchSuggestionListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchSuggestionListData {
  int? id;
  String? name;
  String? type;

  SearchSuggestionListData({this.id, this.name, this.type});

  SearchSuggestionListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}