import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiUtils{
  static const String baseUrl = 'https://90e0-2404-7c80-5e-f1d6-4d80-72e6-5bd9-31c9.ngrok-free.app/api';

  static const String sendOTPApi = '$baseUrl/accounts/send-otp/';
  static const String verifyOTPApi = '$baseUrl/accounts/verify-otp/';
  static const String createProfileApi = '$baseUrl/profiles/';
  static const String getPlanApi = '$baseUrl/subscriptions/plans/';
  static const String payPlanApi = '$baseUrl/subscriptions/subscribe/';
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
  static const String needsAttentionApi = '$baseUrl/investor/dashboard/needs-attention/';
  static const String needsAttentionAllApi = '$baseUrl/investor/dashboard/needs-attention/all/';
  static const String founderDiscoveryApi = '$baseUrl/profiles/founder-discovery/';
}