import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiUtils{
  static const String baseUrl = 'https://2a1b-2404-7c80-5d-97dc-d1d1-2b3a-57bf-72eb.ngrok-free.app/api';

  static const String sendOTPApi = '$baseUrl/accounts/send-otp/';
  static const String verifyOTPApi = '$baseUrl/accounts/verify-otp/';
  static const String createProfileApi = '$baseUrl/profiles/';
  static const String getPlanApi = '$baseUrl/subscriptions/plans/';
  static const String payPlanApi = '$baseUrl/subscriptions/subscribe/';

  //Get Investor List
  static const String getInvestorListApi = '$baseUrl/profiles/';
  static const String savedInvestorApi = '$baseUrl/profiles/saved-investors/';
  static const String removeInvestorApi = '$baseUrl/profiles/saved-investors';
  static const String createFundsRaiseApi = '$baseUrl/marketplace/funding-requests/';
  // static const String getUserProfile = '$baseUrl/profiles';
  static const String getUserProfile = '$baseUrl/accounts/users/';
  static const String getAllPurposeApi = '$baseUrl/marketplace/purposes/';
  static const String logoutApi = '$baseUrl/auth/logout/';
  static const String marketplaceIndustriesApi = '$baseUrl/marketplace/industries/';
  static const String marketplaceStagesApi = '$baseUrl/marketplace/stages/';
  static const String marketplaceFundingTypesApi = '$baseUrl/marketplace/funding-types/';
  static const String marketplaceRangesApi = '$baseUrl/marketplace/ranges/';
  static const String marketplaceLocationsApi = '$baseUrl/marketplace/locations/';
  static const String needsAttentionApi = '$baseUrl/investor/dashboard/needs-attention/';
  static const String needsAttentionAllApi = '$baseUrl/investor/dashboard/needs-attention/all/';
  static const String founderDiscoveryApi = '$baseUrl/profiles/founder-discovery/';
  static const String lastVisitedApi = '$baseUrl/investor/dashboard/new-since-last-visit/all/';
  static const String chatListApi = '$baseUrl/communication/conversations/';
  static const String connectionsCheck = '$baseUrl/connections/';
  static const String portfolio = '$baseUrl/investor/portfolio/';
}