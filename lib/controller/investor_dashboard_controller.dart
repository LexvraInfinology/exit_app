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

import '../constants/app_color.dart';
import '../constants/app_images.dart';
import '../screens/chat_details_screen.dart';

class InvestorDashboardController extends GetxController{


  RxInt selectedIndex = 0.obs;
  int selectedFilter = 0;


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