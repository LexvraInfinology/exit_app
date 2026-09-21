import 'dart:convert';

import 'package:exit_app/models/conversation_response.dart';
import 'package:exit_app/models/create_fund_model_class.dart';
import 'package:exit_app/models/create_profile_model.dart';
import 'package:exit_app/models/founder_discovery_response.dart';
import 'package:exit_app/models/get_plan_model.dart';
import 'package:exit_app/models/profile_model.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
import 'package:exit_app/models/need_attention_response.dart';
import 'package:exit_app/models/saved_investor_model.dart';
import 'package:exit_app/models/update_profile_response.dart';
import 'package:exit_app/screens/raise_funds_screen/create_funds_request_screen.dart';
import 'package:flutter/material.dart';
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
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

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
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return AuthFlowResponseModelClass.fromJson(jsonResponse);
    }
  }

  Future<CreateProfileModel?> createProfileApi(String first_name,
      String last_name, String email, String current_location)
  async {
    final token = prefs.getString('token');
    debugPrint('object${token}');
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
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      getPlanApi();
      return CreateProfileModel.fromJson(jsonResponse);
    }
  }


  Future<CreateProfileModel?> setYourPreferencesApi(
      String firstName,
      String lastName,
      String email,
      String location,
      String preferredInvestment,
      String preferredStage,
      String preferredIndustries,
      String preferredLocation,
      ) async {
    final token = prefs.getString('token');
    debugPrint('object${token}');
    final Uri url = Uri.parse(ApiUtils.createProfileApi);
    var data = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "current_location": location,
      "preferred_investment": preferredInvestment,
      "preferred_stage": preferredStage,
      "preferred_industries": preferredIndustries,
      "preferred_location": preferredLocation
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
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      getPlanApi();
      return CreateProfileModel.fromJson(jsonResponse);
    }
  }

  Future<MarketplaceIndustriesResponse?> getMarketplaceIndustriesApi() async {
    final token = prefs.getString('token');

    final Uri url = Uri.parse(ApiUtils.marketplaceIndustriesApi);

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return MarketplaceIndustriesResponse.fromJson(jsonResponse);
    }
  }

  Future<MarketplaceIndustriesResponse?> getMarketplaceStagesApi() async {
    final token = prefs.getString('token');
    final Uri url = Uri.parse(ApiUtils.marketplaceStagesApi);
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return MarketplaceIndustriesResponse.fromJson(jsonResponse);
    }
    return null;
  }


  Future<MarketplaceIndustriesResponse?> getMarketplaceRangesApi() async {
    final token = prefs.getString('token');
    final Uri url = Uri.parse(ApiUtils.marketplaceRangesApi);
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return MarketplaceIndustriesResponse.fromJson(jsonResponse);
    }
    return null;
  }


  Future<MarketplaceIndustriesResponse?> getMarketplaceLocationsApi() async {
    final token = prefs.getString('token');
    final Uri url = Uri.parse(ApiUtils.marketplaceLocationsApi);
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return MarketplaceIndustriesResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<ConversationResponse?> getChatListApi() async {
    final token = prefs.getString('token');
    final Uri url = Uri.parse(ApiUtils.chatListApi);
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return ConversationResponse.fromJson(jsonResponse);
    }
    return null;
  }


  Future<MarketplaceIndustriesResponse?> getFundsRaisePurposeApi() async {
    final token = prefs.getString('token');

    final Uri url = Uri.parse(ApiUtils.getAllPurposeApi);

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return MarketplaceIndustriesResponse.fromJson(jsonResponse);
    }
    return null;
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
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return GetPlanModel.fromJson(jsonResponse);
    }
    return null;
  }

  Future<BuyPlanModel?> payPlanApi(String plan_id, String mock_payment_success,
      String payment_reference) async {
    final token = prefs.getString('token');
    debugPrint('object${token}');
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
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      getPlanApi();
      return BuyPlanModel.fromJson(jsonResponse);
    }
    return null;
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
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return GetInvestorListModel.fromJson(jsonResponse);
    }
    return null;
  }

  Future<SavedInvestorModel?> savedInvestorApi(
    String investor_id,
  )
  async {
    final token = prefs.getString('token');
    debugPrint('object${token}');
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
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return SavedInvestorModel.fromJson(jsonResponse);
    }
    return null;
  }

  Future<SavedInvestorModel?> removeInvestorApi(
    String investor_id,
  )
  async {
    final token = prefs.getString('token');
    debugPrint('object${token}');

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
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return SavedInvestorModel.fromJson(jsonResponse);
    }
  }

  Future<ProfileModel?> getUserProfileApi(
    String id,
  )
  async {
    final token = prefs.getString('token');
    print('object${token}');

    final Uri url = Uri.parse(
      '${ApiUtils.getUserProfile}',
    );

    final response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    print("API URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return ProfileModel.fromJson(jsonResponse);
    }
  }

  Future<CreateFundRaiseModel?> createFundsRaiseApi(String funding_goal,
      String currency,String stage, String purpose, String company_name, String industry,
      String location, String company_website, String company_description,
      String raise_description, String funding_timeline,String pitch_deck,)
  async {
    final token = prefs.getString('token');
    debugPrint('object${token}');
    final Uri url = Uri.parse(ApiUtils.createFundsRaiseApi);
    var data = {
      "funding_goal": funding_goal,
      "currency": currency,
      "stage": stage,
      "purpose": purpose,
      "company_name": company_name,
      "industry": industry,
      "location": location,
      "company_website": company_website,
      "company_description": company_description,
      "raise_description": raise_description,
      "funding_timeline": funding_timeline,
      "pitch_deck": pitch_deck,
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
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return CreateFundRaiseModel.fromJson(jsonResponse);
    }
  }

  // Investor Home Apis

  Future<NeedsAttentionResponse?> getNeedsAttentionApi({int? limit}) async {
    final token = prefs.getString('token');

    final Uri url = Uri.parse(ApiUtils.needsAttentionApi).replace(
      queryParameters: limit != null ? {'limit': '$limit'} : null,
    );

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final dynamic decoded = jsonDecode(response.body);
      return NeedsAttentionResponse.fromJson(decoded);
    }
    return null;
  }


  Future<NeedsAttentionAllResponse?> getNeedsAttentionAllApi() async {
    final token = prefs.getString('token');

    final Uri url = Uri.parse(ApiUtils.needsAttentionAllApi);

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return NeedsAttentionAllResponse.fromJson(jsonResponse);
    }
    return null;
  }


  Future<FounderDiscoveryResponse?> getFounderDiscoveryApi({
    int? limit,
    int? page,
    String? view, // pass 'all' for the full paginated list
  }) async {
    final token = prefs.getString('token');

    final Map<String, String> queryParams = {};
    if (limit != null) queryParams['limit'] = '$limit';
    if (page != null) queryParams['page'] = '$page';
    if (view != null) queryParams['view'] = view;

    final Uri url = Uri.parse(ApiUtils.founderDiscoveryApi).replace(
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "token $token",
      },
    );
    debugPrint("API URL: $url");
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return FounderDiscoveryResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<UpdateProfileResponse?> updateProfileApi({
    required String firstName,
    required String lastName,
    required String email,
    required String currentLocation,
    required String userRole,
    String? profileImagePath,
    required String bio,
    required String experience,
    required String currentStage,
    required String teamSize,
    required String preferredInvestment,
    required String preferredStage,
    required String preferredIndustries,
    required String preferredLocation,
  }) async {
    try {
      final token = prefs.getString('token');

      final Uri url = Uri.parse(ApiUtils.getUserProfile);

      final request = http.MultipartRequest(
        'PATCH',
        url,
      );

      // Headers
      request.headers.addAll({
        "Accept": "application/json",
        "Authorization": "token $token",
      });

      // Fields
      request.fields.addAll({
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "current_location": currentLocation,
        "user_role": userRole,
        "bio": bio,
        "experience": experience,
        "current_stage": currentStage,
        "team_size": teamSize,
        "preferred_investment": preferredInvestment,
        "preferred_stage": preferredStage,
        "preferred_industries": preferredIndustries,
        "preferred_location": preferredLocation,
      });

      // Profile Image
      if (profileImagePath != null &&
          profileImagePath.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath(
            "profile_photo",
            profileImagePath,
          ),
        );
      }

      debugPrint("API URL: $url");
      debugPrint("Request Fields: ${request.fields}");
      debugPrint("Profile Image: $profileImagePath");

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(
        streamedResponse,
      );

      debugPrint("Status Code: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        final Map<String, dynamic> jsonResponse =
        jsonDecode(response.body);

        await getPlanApi();

        return UpdateProfileResponse.fromJson(jsonResponse);
      }

      debugPrint(
        "Update Profile Failed: "
            "${response.statusCode} - ${response.body}",
      );

      return null;
    } catch (e, stackTrace) {
      debugPrint("Update Profile Error: $e");
      debugPrint("StackTrace: $stackTrace");

      return null;
    }
  }

}





