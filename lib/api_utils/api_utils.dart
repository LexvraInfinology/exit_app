import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiUtils{
  static const String baseUrl = 'https://e211-2401-4900-1c2a-4731-11dd-dc04-5701-169f.ngrok-free.app/api';

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
  static const String marketplaceRangesApi = '$baseUrl/marketplace/ranges/';
  static const String marketplaceLocationsApi = '$baseUrl/marketplace/locations/';
  static const String needsAttentionApi = '$baseUrl/investor/dashboard/needs-attention/';
  static const String needsAttentionAllApi = '$baseUrl/investor/dashboard/needs-attention/all/';
  static const String founderDiscoveryApi = '$baseUrl/profiles/founder-discovery/';
  static const String chatListApi = '$baseUrl/communication/conversations/';
}