import 'dart:ui';

import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/constants/app_images.dart';
import 'package:exit_app/screens/edit_profile_screen.dart';
import 'package:exit_app/screens/plan_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/boost_profile_screen.dart';
import '../screens/chat_details_screen.dart';
import '../screens/dashoard_screen/founder_dashboard/investor_details_screen.dart';
import '../screens/help_and_support_screen.dart';
import '../screens/notification_list_screen.dart';
import '../screens/post_details_screen.dart';
import '../screens/privacy_policy_screen.dart';
import '../screens/raise_funds_screen/create_funds_request_screen.dart';
import '../screens/raise_funds_screen/sell_your_company_screen.dart';
import '../screens/view_investor_activity_list_screen.dart';

class StartUpDashBoardController extends GetxController {
  final selectedBottomIndex = 0.obs;

  RxInt selectedIndex = 0.obs;
  final RxBool isPublic = true.obs;
  int selectedFilter = 0;
  int selectedBottomNav = 1;

  void onItemSelected(int index) {
    selectedIndex.value = index;
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void toggleVisibility() {
    isPublic.value = !isPublic.value;
  }

  void InvestorDetails() {
    Get.to(() => InvestorDetailsScreen());
  }

  void clickEditProfile() {
    Get.to(() => EditProfileScreen());
  }

  void clickPostDetails() {
    Get.to(() => PostDetailsScreen());
  }

  void clickPlanDetails() {
    Get.to(() => PlanDetailsScreen());
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

  void clickPrivacyPolicy() {
    Get.to(() => PrivacyPolicyScreen());
  }

  void clickHelpAndSupport() {
    Get.to(() => HelpAndSupportScreen());
  }

  void clickViewInterestInvestors() {
    Get.to(() => ViewInvestorActivityListScreen());
  }

  void clickBoostProfile() {
    Get.to(() => BoostProfileScreen());
  }

  void clickManageProfile() {
    Get.to(() => PlanDetailsScreen());
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
                // Title
                Text(
                  'What would you like to create?',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                // Subtitle
                Text(
                  'Choose an option to get started.',
                  style: GoogleFonts.montserrat(
                    color: Color(0xFF858585),
                    fontSize: 12,
                  ),
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
                      height: 65,
                      decoration: BoxDecoration(
                        color: const Color(0xFF111111),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF292929),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),

                          // Icon box
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color(0xFF151515),
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(
                                color: const Color(0xFF292929),
                              ),
                            ),
                            child: Icon(
                              Icons.trending_up_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Text
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Raise Funds',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'Find investors and raise capital',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF777777),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Chevron
                          const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(
                              Icons.chevron_right,
                              color: Color(0xFF777777),
                              size: 18,
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
                      height: 65,
                      decoration: BoxDecoration(
                        color: const Color(0xFF111111),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF292929),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),

                          // Icon box
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color(0xFF151515),
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(
                                color: const Color(0xFF292929),
                              ),
                            ),
                            child: Icon(
                              Icons.account_balance_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Text
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sell Your Company',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'Find buyers or acquirers',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF777777),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Chevron
                          const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(
                              Icons.chevron_right,
                              color: Color(0xFF777777),
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Cancel
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
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:  Text("Log Out",
                         style: GoogleFonts.montserrat(fontWeight: FontWeight.w600), ),
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
}
