import 'dart:convert';

import 'package:exit_app/models/create_profile_model.dart';
import 'package:exit_app/models/get_plan_model.dart';
import 'package:exit_app/models/saved_investor_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_flow_response_model.dart';
import '../models/buy_plan_model.dart';
import '../models/get_investor_list_model.dart';
import 'api_utils.dart';

class ApiServices {
  final SharedPreferences prefs = Get.find<SharedPreferences>();

  Future<AuthFlowResponseModelClass?> sendOTP(
      String mobileNumber, String role) async {
    final Uri url = Uri.parse(ApiUtils.sendOTPApi);
    var data = {"mobile_number": mobileNumber, "role": role};
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(data),
    );
    print("API URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return AuthFlowResponseModelClass.fromJson(jsonResponse);
    }
  }

  Future<AuthFlowResponseModelClass?> verifyOTP(
      String mobileNumber, String role, String otp) async {
    final Uri url = Uri.parse(ApiUtils.verifyOTPApi);
    var data = {"mobile_number": mobileNumber, "role": role, "otp": otp};
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(data),
    );
    print("API URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return AuthFlowResponseModelClass.fromJson(jsonResponse);
    }
  }

  Future<CreateProfileModel?> createProfileApi(String first_name,
      String last_name, String email, String current_location) async {
    final token = prefs.getString('token');
    print('object${token}');
    final Uri url = Uri.parse(ApiUtils.createProfileApi);
    var data = {
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "current_location": current_location
    };

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
      body: jsonEncode(data),
    );
    print("API URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      getPlanApi();
      return CreateProfileModel.fromJson(jsonResponse);
    }
  }

  Future<GetPlanModel?> getPlanApi() async {
    final token = prefs.getString('token');

    final Uri url = Uri.parse(ApiUtils.getPlanApi);

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    print("API URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return GetPlanModel.fromJson(jsonResponse);
    }
  }

  Future<BuyPlanModel?> payPlanApi(String plan_id, String mock_payment_success,
      String payment_reference) async {
    final token = prefs.getString('token');
    print('object${token}');
    final Uri url = Uri.parse(ApiUtils.payPlanApi);
    var data = {
      "plan_id": plan_id,
      "mock_payment_success": mock_payment_success,
      "payment_reference": payment_reference
    };

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
      body: jsonEncode(data),
    );
    print("API URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      getPlanApi();
      return BuyPlanModel.fromJson(jsonResponse);
    }
  }

  Future<GetInvestorListModel?> getInvestorListApi() async {
    final token = prefs.getString('token');
    final Uri url = Uri.parse(ApiUtils.getInvestorListApi);
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    print("API URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return GetInvestorListModel.fromJson(jsonResponse);
    }
  }

  Future<SavedInvestorModel?> savedInvestorApi(
    String investor_id,
  )
  async {
    final token = prefs.getString('token');
    print('object${token}');
    final Uri url = Uri.parse(ApiUtils.savedInvestorApi);
    var data = {"investor_id": investor_id};

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
      body: jsonEncode(data),
    );
    print("API URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return SavedInvestorModel.fromJson(jsonResponse);
    }
  }

  Future<SavedInvestorModel?> removeInvestorApi(
    String investor_id,
  )
  async {
    final token = prefs.getString('token');
    print('object${token}');

    final Uri url = Uri.parse(
      '${ApiUtils.removeInvestorApi}/$investor_id/',
    );

    final response = await http.delete(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    print("API URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return SavedInvestorModel.fromJson(jsonResponse);
    }
  }
}
