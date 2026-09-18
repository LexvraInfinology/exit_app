import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiUtils{
  static const String baseUrl = 'https://e1c3-2401-4900-1c6f-8f83-bd1c-30e-393-8c86.ngrok-free.app/api';

  static const String sendOTPApi = '$baseUrl/accounts/send-otp/';
  static const String verifyOTPApi = '$baseUrl/accounts/verify-otp/';
  static const String createProfileApi = '$baseUrl/profiles/';
  static const String getPlanApi = '$baseUrl/subscriptions/plans/';
  static const String payPlanApi = '$baseUrl/subscriptions/subscribe/';
  static const String getInvestorListApi = '$baseUrl/profiles/';
  static const String savedInvestorApi = '$baseUrl/profiles/saved-investors/';
  static const String removeInvestorApi = '$baseUrl/profiles/saved-investors';
  // static const String getUserProfile = '$baseUrl/profiles';
  static const String getUserProfile = '$baseUrl/accounts/users/';
  static const String getAllPurposeApi = '$baseUrl/marketplace/purposes/';
  static const String logoutApi = '$baseUrl/auth/logout/';


}