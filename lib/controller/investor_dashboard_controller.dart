import 'dart:async';

import 'package:exit_app/api_utils/api_services.dart';
import 'package:exit_app/models/founder_discovery_response.dart';
import 'package:exit_app/models/need_attention_response.dart';
import 'package:exit_app/screens/choose_user_screen.dart';
import 'package:exit_app/screens/dashoard_screen/investor_dashboard_screen/founder_details_screen.dart';
import 'package:exit_app/screens/edit_profile_screen.dart';
import 'package:exit_app/screens/help_and_support_screen.dart';
import 'package:exit_app/screens/notification_list_screen.dart';
import 'package:exit_app/screens/privacy_policy_screen.dart';
import 'package:exit_app/screens/view_investment_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_color.dart';
import '../constants/app_images.dart';
import '../screens/chat_details_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/phone_number_screen.dart';

class InvestorDashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;
  int selectedFilter = 0;

  final ApiServices apiServices = ApiServices();

  final RxBool isLoading = false.obs;
  final List<NeedsAttentionItem> needsAttentionList =
      <NeedsAttentionItem>[];
  final RxList<FounderProfile> founderList = <FounderProfile>[].obs;
  final RxList<NeedsAttentionItem> needsAttentionAllList =
      <NeedsAttentionItem>[].obs;

  final SharedPreferences prefs = Get.find<SharedPreferences>();


  final ScrollController scrollController = ScrollController();

  final RxDouble leftOpacity = 0.0.obs;
  final RxDouble rightOpacity = 0.0.obs;

  double _lastPixels = 0;
  Timer? _stopTimer;

  static const double normalOpacity = 0.0;
  static const double scrollingOpacity = 1.0;
  static const Duration stopDelay = Duration(milliseconds: 150);

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(_onScroll);
  }

  Future<void> loadHomePage() async {
   isLoading.value = true;
   await getNeedsAttentionApi();
   // await  getNeedsAttentionAllApi();
   await  getFounderDiscoveryApi();
   isLoading.value = false;
  }


  void _onScroll() {
    if (!scrollController.hasClients) return;
    final currentPixels = scrollController.position.pixels;
    if (currentPixels < _lastPixels) {
      rightOpacity.value = scrollingOpacity;
      leftOpacity.value = normalOpacity;
    } else if (currentPixels > _lastPixels) {
      leftOpacity.value = scrollingOpacity;
      rightOpacity.value = normalOpacity;
    }

    _lastPixels = currentPixels;

    _stopTimer?.cancel();
    _stopTimer = Timer(stopDelay, () {
      leftOpacity.value = normalOpacity;
      rightOpacity.value = normalOpacity;
    });
  }

  void onItemSelected(int index) {
    selectedIndex.value = index;
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void clickFounderDetails() {
    Get.to(() => FounderDetailsScreen());
  }

  void clickInvestmentDetails() {
    Get.to(() => ViewInvestmentDetailsScreen());
  }

  void clickChatItem() {
    Get.to(() => ChatDetailsScreen());
  }

  void clickEditProfile() {
    Get.to(() => EditProfileScreen());
  }

  void clickNotification() {
    Get.to(() => NotificationListScreen());
  }

  void clickPrivacyPolicy() {
    Get.to(() => PrivacyPolicyScreen());
  }

  void clickHelpAndSupport() {
    Get.to(() => HelpAndSupportScreen());
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            color: AppColors.blackColor,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.logoutIcon,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Logout of EXIT?",
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Are you sure you want to log out? \nYou can sign back in anytime.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.whiteColor,
                            foregroundColor: AppColors.blackColor,
                          ),
                          onPressed: () {
                            prefs.clear();
                            Get.offAll(() =>  OnboardingScreen(),);
                          },
                          child: Text(
                            "Log Out",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> getNeedsAttentionApi() async {
    try {
      isLoading.value = true;
      final response = await apiServices.getNeedsAttentionApi();
      if (response != null) {
        needsAttentionList.assignAll(response.data);
        update();
        debugPrint(
            "Needs Attention All List Length: ${needsAttentionList.length}");
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getNeedsAttentionAllApi() async {
    try {
      isLoading.value = true;

      final NeedsAttentionAllResponse? response =
          await apiServices.getNeedsAttentionAllApi();

      debugPrint("Status Code: ${response?.statusCode}");
      debugPrint("Message: ${response?.message}");

      if (response?.statusCode == 200) {
        needsAttentionAllList.assignAll(response?.data ?? []);
        debugPrint(
            "Needs Attention All List Length: ${needsAttentionAllList.length}");

      } else {
        Get.snackbar(
          'Fetch Failed',
          response?.message ?? 'Failed to fetch conversations',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.blackColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getFounderDiscoveryApi({bool viewAll = false}) async {
    try {
      isLoading.value = true;
      final response = await apiServices.getFounderDiscoveryApi();
      if (response?.statusCode == 200) {
        founderList.assignAll(response!.data.results);
      } else {
        Get.snackbar('Failed', response?.message ?? 'Something went wrong');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _stopTimer?.cancel();
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }
}
