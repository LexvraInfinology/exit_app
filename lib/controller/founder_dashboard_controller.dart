import 'package:exit_app/models/create_fund_model_class.dart';
import 'package:exit_app/models/get_investor_list_model.dart';
import 'package:exit_app/screens/boost_profile_screen.dart';
import 'package:exit_app/screens/chat_details_screen.dart';
import 'package:exit_app/screens/edit_profile_screen.dart';
import 'package:exit_app/screens/phone_number_screen.dart';
import 'package:exit_app/screens/post_details_screen.dart';
import 'package:exit_app/screens/raise_funds_screen/create_funds_request_screen.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/funding_request_list_screen.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/investor_details_screen.dart';
import 'package:exit_app/screens/raise_funds_screen/sell_your_company_screen.dart';
import 'package:exit_app/screens/view_investor_activity_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_utils/api_services.dart';
import '../constants/app_color.dart';
import '../constants/app_images.dart';
import '../models/conversation_response.dart';
import '../models/profile_model.dart';
import '../screens/choose_user_screen.dart';
import '../screens/help_and_support_screen.dart';
import '../screens/notification_list_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/plan_details_screen.dart';
import '../screens/privacy_policy_screen.dart';

class FounderDashboardController extends GetxController {
  final selectedBottomIndex = 0.obs;

  RxInt selectedIndex = 0.obs;
  final RxBool isPublic = true.obs;
  int selectedFilter = 0;
  int selectedBottomNav = 1;
  RxInt selectedPostIndex = (-1).obs;
  var isLoading = false.obs;
  int? currentUserId;

  final ApiServices apiServices = ApiServices();
  final SharedPreferences prefs = Get.find<SharedPreferences>();

  var savedItems = <int, bool>{}.obs;

  ResultsProfile resultsProfile = new ResultsProfile();
  final RxList<Results> investorList = <Results>[].obs;
  final RxList<ResultsProfile> resultProfile = <ResultsProfile>[].obs;
  final RxList<ConversationItem> chats = <ConversationItem>[].obs;
  final RxList<CreateFundsRaiseData> createFundsList = <CreateFundsRaiseData>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadHomePage();
  }

  Future<void> loadHomePage() async {
    isLoading.value = true;
    update();
    await getChatListApi();
    await getInvestorListApi();
    await getuserProfileApi(prefs.getString('id').toString());
    await getCreateFundsRaiseListApi();
    isLoading.value = false;
    update();
  }

  void onItemSelected(int index) {
    selectedIndex.value = index;
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void clickSaved(int index) {
    if (savedItems.containsKey(index)) {
      savedItems[index] = !savedItems[index]!;
    } else {
      savedItems[index] = true;
    }
    update();
    print(' object ${savedItems[index]}');
  }

  void openPostMenu(int index) {
    selectedPostIndex.value = index;
  }

  void editPostOrDeletePost(int index, String ScreenType, String type) {
    selectedPostIndex.value = -1;
    if (type == 'delete') {
      showDeletePostDialog(Get.context!, index);
    } else {
      if (ScreenType == '') {
        Get.to(() => CreateFundsRequestScreen());
      } else {
        Get.to(() => SellYourCompanyScreen());
      }
    }
  }

  void toggleVisibility() {
    isPublic.value = !isPublic.value;
  }

  void onRaiseCapital() {}

  void onListBusiness() {}

  void onViewPlan() {}

  void InvestorDetails(Results result) {
    if(currentUserId != null){
      Get.to(() => InvestorDetailsScreen(result,currentUserId));
    }
  }

  void clickPlanDetails() {
    Get.to(() => PlanDetailsScreen());
  }

  void clickEditProfile(ResultsProfile result) {
    Get.to(() => EditProfileScreen(isFounder: true, profile: result));
  }

  void clickPostDetails() {
    Get.to(() => PostDetailsScreen());
  }

  void clickChatItem() {
    Get.to(() => ChatDetailsScreen());
  }

  void clickFundsRaise() {
    Get.to(() => CreateFundsRequestScreen());
  }

  void clickSellYourCompany() {
    Get.to(() => SellYourCompanyScreen());
  }

  void clickNotification() {
    Get.to(() => NotificationListScreen());
  }

  void clickManagePlan() {
    // Get.to(() => ());
  }

  void clickPrivacyPolicy() {
    Get.to(() => PrivacyPolicyScreen());
  }

  void clickHelpAndSupport() {
    Get.to(() => HelpAndSupportScreen());
  }

  void clickSavedApi(String investor_id) {
    savedInvestorApi(investor_id);
  }

  void clickRemoveApi(String investor_id) {
    removedInvestorApi(investor_id);
  }

  void clickViewInterestInvestors() {
    Get.to(() => ViewInvestorActivityListScreen());
  }

  void clickBoostProfile() {
    Get.to(() => BoostProfileScreen());
  }

  void clickFundingRequestButton(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF111111),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What would you like to create?',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Choose an option to get started.',
                  style: GoogleFonts.montserrat(
                      color: AppColors.darkGreyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 18),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      clickFundsRaise();
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.containerBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.containerBorderColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.blackColor,
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(
                                color: AppColors.containerBorderColor,
                              ),
                            ),
                            child: const Icon(
                              Icons.trending_up_rounded,
                              size: 24,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Raise Funds',
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.whiteColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Find investors and raise capital',
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.darkGreyColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(
                              Icons.chevron_right,
                              color: AppColors.darkGreyColor,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      clickSellYourCompany();
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.containerBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.containerBorderColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.blackColor,
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(
                                color: AppColors.containerBorderColor,
                              ),
                            ),
                            child: const Icon(
                              Icons.account_balance_outlined,
                              size: 26,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sell Your Company',
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.whiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Find buyers or acquirers',
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.darkGreyColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(
                              Icons.chevron_right,
                              color: AppColors.darkGreyColor,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF888888),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
                              Get.offAll(
                                () => const OnboardingScreen(),
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

  void showDeletePostDialog(BuildContext context, int index) {
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
                    "Delete Post?",
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Are you sure you want to delete this post.",
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
                                fontSize: 16,
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
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Yes",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.w600),
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

  Future<void> getInvestorListApi() async {
    try {
      isLoading.value = true;
      final response = await apiServices.getInvestorListApi();
      print("Status Code: ${response?.statusCode}");
      print("Message: ${response?.message}");
      if (response?.statusCode == 200) {
        isLoading.value = false;
        investorList.assignAll(response?.data?.results ?? []);

        Get.snackbar(
          'Success',
          response?.message ?? 'Investor fetch successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Investor fetch Failed',
          response?.message ?? 'Investor failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      }
    } catch (e) {
      print('object ${e}');
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.blackColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> savedInvestorApi(String investor_id) async {
    try {
      isLoading.value = true;
      final response = await apiServices.savedInvestorApi(investor_id);
      print("Status Code: ${response?.statusCode}");
      print("Message: ${response?.message}");
      if (response?.statusCode == 201) {
        isLoading.value = false;
        getInvestorListApi();
        Get.snackbar(
          'Success',
          response?.message ?? 'Saved successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Saved Failed',
          response?.message ?? 'Saved failed',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      }
    } catch (e) {
      print('object ${e}');
      isLoading.value = false;
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

  Future<void> removedInvestorApi(String investor_id) async {
    try {
      isLoading.value = true;
      final response = await apiServices.removeInvestorApi(investor_id);
      print("Status Code: ${response?.statusCode}");
      print("Message: ${response?.message}");
      if (response?.statusCode == 200) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          response?.message ?? 'Remove successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Remove successfully',
          response?.message ?? 'Remove successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      }
      getInvestorListApi();
      update();
    } catch (e) {
      isLoading.value = false;
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

  Future<void> getuserProfileApi(String id) async {
    try {
      isLoading.value = true;
      final response = await apiServices.getUserProfileApi(id);
      print("Status Code: ${response?.statusCode}");
      print("Message: ${response?.message}");
      if (response?.statusCode == 200) {
        isLoading.value = false;
        // Get.snackbar(
        //   'Success',
        //   response?.message ?? 'Profile fetch successfully',
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: AppColors.blackColor,
        //   colorText: AppColors.whiteColor,
        // );
      } else {
        isLoading.value = false;
        // Get.snackbar(
        //   'Error ',
        //   response?.message ?? 'Profile fetch failed',
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: AppColors.blackColor,
        //   colorText: AppColors.whiteColor,
        // );
      }

      resultProfile.value = response?.data!.results ?? [];
      currentUserId = resultProfile.first.id;
      print('click dat ${resultProfile.single.firstName}');
    } catch (e) {
      print('object ${e}');
      isLoading.value = false;
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

  Future<void> getChatListApi() async {
    try {
      isLoading.value = true;
      final ConversationResponse? response = await apiServices.getChatListApi();

      if (response?.statusCode == 200) {
        chats.value.assignAll(response?.data ?? []);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }
  Future<void> getCreateFundsRaiseListApi() async {
    try {
      isLoading.value = true;
      final CreateFundRaiseModel? response = await apiServices.getCreateFundsRaiseApi();

      if (response?.statusCode == 200) {
        if(response?.data!=null){
          createFundsList.value=response?.data?.results??[];

        }
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
