class CompanyDetails {
  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  CompanyDetails(
      {this.additionalProp1, this.additionalProp2, this.additionalProp3});

  CompanyDetails.fromJson(Map<String, dynamic> json) {
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalProp1'] = this.additionalProp1;
    data['additionalProp2'] = this.additionalProp2;
    data['additionalProp3'] = this.additionalProp3;
    return data;
  }
}
