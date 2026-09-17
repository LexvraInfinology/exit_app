class BuyPlanModel {
  int? statusCode;
  String? message;
  Data? data;

  BuyPlanModel({this.statusCode, this.message, this.data});

  BuyPlanModel.fromJson(Map<String, dynamic> json) {
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
  Purchase? purchase;
  Credits? credits;

  Data({this.purchase, this.credits});

  Data.fromJson(Map<String, dynamic> json) {
    purchase = json['purchase'] != null
        ? new Purchase.fromJson(json['purchase'])
        : null;
    credits =
        json['credits'] != null ? new Credits.fromJson(json['credits']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.purchase != null) {
      data['purchase'] = this.purchase!.toJson();
    }
    if (this.credits != null) {
      data['credits'] = this.credits!.toJson();
    }
    return data;
  }
}

class Purchase {
  int? id;
  int? plan;
  String? planName;
  String? amount;
  int? credits;
  String? currency;
  String? status;
  String? provider;
  String? providerPaymentId;
  String? createdAt;
  String? updatedAt;

  Purchase(
      {this.id,
      this.plan,
      this.planName,
      this.amount,
      this.credits,
      this.currency,
      this.status,
      this.provider,
      this.providerPaymentId,
      this.createdAt,
      this.updatedAt});

  Purchase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plan = json['plan'];
    planName = json['plan_name'];
    amount = json['amount'];
    credits = json['credits'];
    currency = json['currency'];
    status = json['status'];
    provider = json['provider'];
    providerPaymentId = json['provider_payment_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan'] = this.plan;
    data['plan_name'] = this.planName;
    data['amount'] = this.amount;
    data['credits'] = this.credits;
    data['currency'] = this.currency;
    data['status'] = this.status;
    data['provider'] = this.provider;
    data['provider_payment_id'] = this.providerPaymentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Credits {
  int? totalCredits;
  int? remainingCredits;

  Credits({this.totalCredits, this.remainingCredits});

  Credits.fromJson(Map<String, dynamic> json) {
    totalCredits = json['total_credits'];
    remainingCredits = json['remaining_credits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_credits'] = this.totalCredits;
    data['remaining_credits'] = this.remainingCredits;
    return data;
  }
}
