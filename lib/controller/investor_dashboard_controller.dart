import 'dart:async';

import 'package:exit_app/api_utils/api_services.dart';
import 'package:exit_app/models/conversation_response.dart';
import 'package:exit_app/models/founder_discovery_response.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
import 'package:exit_app/models/need_attention_response.dart';
import 'package:exit_app/models/profile_model.dart';
import 'package:exit_app/screens/choose_user_screen.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/widgets/filtter_button_widget.dart';
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

class InvestorDashboardController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int selectedFilter = 0;

  final ApiServices apiServices = ApiServices();

  final RxBool isLoading = false.obs;
  final SharedPreferences prefs = Get.find<SharedPreferences>();

  final RxList<ResultsProfile> resultProfile = <ResultsProfile>[].obs;
  final List<NeedsAttentionItem> needsAttentionList =
      <NeedsAttentionItem>[];
  final RxList<FounderProfile> founderList = <FounderProfile>[].obs;
  final RxList<NeedsAttentionItem> needsAttentionAllList =
      <NeedsAttentionItem>[].obs;

  final List<MarketplaceIndustry> industriesList = <MarketplaceIndustry>[];
  final List<MarketplaceIndustry> stagesList = <MarketplaceIndustry>[];
  final List<MarketplaceIndustry> rangesList = <MarketplaceIndustry>[];
  final List<MarketplaceIndustry> locationsList = <MarketplaceIndustry>[];
  final List<ConversationItem> chats = <ConversationItem>[];



  List<FilterListModel> filterListItems =  [
    FilterListModel(title: "Stage", options: []),
    FilterListModel(title: "Sector", options: []),
    FilterListModel(title: "Under ₹25L", options: []),
    FilterListModel(title: "Location", options: []),
  ];

  final Rxn<MarketplaceIndustry> selectedStage = Rxn<MarketplaceIndustry>();
  final Rxn<MarketplaceIndustry> selectedIndustry = Rxn<MarketplaceIndustry>();
  final Rxn<MarketplaceIndustry> selectedRange = Rxn<MarketplaceIndustry>();
  final Rxn<MarketplaceIndustry> selectedLocation = Rxn<MarketplaceIndustry>();



  @override
  void onInit() {
    super.onInit();
    loadHomePage();
  }

  void _replaceItemOptions(String title, List<MarketplaceIndustry> newOptions) {
    if (newOptions.isEmpty) return;
    final index = filterListItems.indexWhere((e) => e.title == title);
    if (index != -1) {
      filterListItems[index] = FilterListModel(title: title, options: newOptions);
    }
  }


MarketplaceIndustry? selectedFor(String title) {
    debugPrint("Checking ===> $title");
    switch (title) {
      case 'Stage':
        return selectedStage.value;
      case 'Sector':
        return selectedIndustry.value;
      case 'Under ₹25L':
        return selectedRange.value;
      case 'Location':
        return selectedLocation.value;
      default:
        return null;
    }
  }

  void onFilterSelected(String title, MarketplaceIndustry? value) {
    debugPrint("Checking ===> ${value?.name}");
    switch (title) {
      case 'Stage':
        selectedStage.value = value;
        break;
      case 'Sector':
        selectedIndustry.value = value;
        break;
      case 'Under ₹25L':
        selectedRange.value = value;
        break;
      case 'Location':
        selectedLocation.value = value;
        break;
    }
    update();
  }


Future<void> loadHomePage() async {
    isLoading.value = true;
    update();

    try {
      final results = await Future.wait([
        _safeCall(getNeedsAttentionApi),
        _safeCall(getFounderDiscoveryApi),
        _safeCall(getMarketplaceStagesApi),
        _safeCall(getMarketplaceIndustriesApi),
        _safeCall(getMarketplaceRangesApi),
        _safeCall(getMarketplaceLocationsApi),
        _safeCall(getuserProfileApi),
        _safeCall(getChatListApi),
        // _safeCall(getNeedsAttentionAllApi),
      ]);

      final allFailed = results.every((success) => success == false);
      if (allFailed) {
        Get.snackbar(
          'Error',
          'Unable to load dashboard. Please check your connection.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      }
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<bool> _safeCall(Future<void> Function() apiCall) async {
    try {
      await apiCall();
      return true;
    } catch (e) {
      debugPrint('object $e');
      return false;
    }
  }


  void onItemSelected(int index) {
    selectedIndex.value = index;
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void clickFounderDetails(FounderProfile? founderDetail) {
  if(founderDetail != null){
    Get.to(() => FounderDetailsScreen(founderProfile: founderDetail,));
  }
  }

  void clickInvestmentDetails() {
    Get.to(() => ViewInvestmentDetailsScreen());
  }

  void clickChatItem() {
    Get.to(() => ChatDetailsScreen());
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
                          onPressed: () async {
                            final success = await apiServices.logoutApi();

                            if (success) {
                              await prefs.clear();
                              Get.offAll(() => const OnboardingScreen(),
                              );
                            } else {
                              Get.snackbar(
                                'Logout Failed',
                                'Unable to logout. Please try again.',
                              );
                            }
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
    }
  }

  Future<void> getNeedsAttentionAllApi() async {
    try {

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
    }
  }

  Future<void> getFounderDiscoveryApi({bool viewAll = false}) async {
    try {
      final response = await apiServices.getFounderDiscoveryApi();
      if (response?.statusCode == 200) {
        founderList.assignAll(response!.data.results);
      } else {
        Get.snackbar('Failed', response?.message ?? 'Something went wrong');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }

  Future<void> getMarketplaceIndustriesApi() async {
    try {

      final MarketplaceIndustriesResponse? response =
      await apiServices.getMarketplaceIndustriesApi();

      if (response?.statusCode == 200) {
        industriesList.assignAll(response?.data ?? []);
        final options = industriesList.map((e) => e.name).toList();
        _replaceItemOptions("Sector",industriesList);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }

  Future<void> getMarketplaceStagesApi() async {
    try {
      isLoading.value = true;
      final MarketplaceIndustriesResponse? response =
      await apiServices.getMarketplaceStagesApi();

      if (response?.statusCode == 200) {
        stagesList.assignAll(response?.data ?? []);
        _replaceItemOptions("Stage",stagesList);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }

  Future<void> getMarketplaceRangesApi() async {
    try {
      isLoading.value = true;
      final MarketplaceIndustriesResponse? response =
      await apiServices.getMarketplaceRangesApi();

      if (response?.statusCode == 200) {
        rangesList.assignAll(response?.data ?? []);
        _replaceItemOptions("Under ₹25L",rangesList);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }

  Future<void> getMarketplaceLocationsApi() async {
    try {
      isLoading.value = true;
      final MarketplaceIndustriesResponse? response =
      await apiServices.getMarketplaceLocationsApi();

      if (response?.statusCode == 200) {
        locationsList.assignAll(response?.data ?? []);
        _replaceItemOptions("Location",locationsList);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }

  Future<void> getuserProfileApi() async {
    try {
      final response = await apiServices.getUserProfileApi(prefs.getString('id').toString());
      debugPrint("Status Code: ${response?.statusCode}");
      debugPrint("Message: ${response?.message}");
      resultProfile.value = response?.data!.results ?? [];
      debugPrint('click dat ${resultProfile.single.firstName}');
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.blackColor,
        colorText: AppColors.whiteColor,
      );
    }
  }

  Future<void> getChatListApi() async {
    try {
      isLoading.value = true;
      final ConversationResponse? response =
      await apiServices.getChatListApi();

      if (response?.statusCode == 200) {
        chats.assignAll(response?.data ?? []);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }

}
