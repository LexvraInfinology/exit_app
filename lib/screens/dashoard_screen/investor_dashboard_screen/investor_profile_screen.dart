import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/investor_dashboard_controller.dart';
import 'package:exit_app/screens/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';
import '../founder_dashboard/widgets/settings_row_widget.dart';

class InvestorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvestorDashboardController>(
        builder: (profileController) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
            child:  profileController.isLoading.value
                ? const Center(
                child: CupertinoActivityIndicator(
                  radius: 15,
                  color: Colors.white,
                ))
                : Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      profileController.selectedIndex.value = 0;

                    },
                    child: Image.asset(
                      AppImages.backIcon,
                      width: 42,
                      height: 42,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: (){Get.to(const NotificationScreen());},
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      size: 32,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.darkGreyColor,
                                    width: 2,
                                  ),
                                  // image: const DecorationImage(
                                  //   image: AssetImage('assets/profile.jpg'),
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                              Positioned(
                                right: -2,
                                bottom: -1,
                                child: Container(
                                  width: 19,
                                  height: 19,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF050505),
                                      width: 2,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    size: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                           Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(() => Text(
                                    profileController.resultProfile.isNotEmpty
                                        ? '${profileController.resultProfile.first.firstName} ${profileController.resultProfile.first.lastName}'
                                        : '',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'Founder & CEO',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: AppColors.darkGreyColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 14,
                                      color: AppColors.darkGreyColor,
                                    ),
                                    const SizedBox(width: 3),
                                    Obx(() => Text(
                                      profileController
                                          .resultProfile.isNotEmpty
                                          ? profileController
                                          .resultProfile
                                          .first
                                          .currentLocation ??
                                          ''
                                          : '',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.darkGreyColor,
                                      ),
                                    )),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                // Row(
                                //   children: [
                                //     _Tag(text: 'FinTech'),
                                //     const SizedBox(width: 6),
                                //     _Tag(text: 'SaaS'),
                                //     const SizedBox(width: 6),
                                //     _Tag(text: 'B2B'),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
                      child: GestureDetector(
                        onTap: () {
                          profileController.clickEditProfile();
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child:  Text(
                            'Edit Profile',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About You',
                            style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                                () => Text(
                              profileController.resultProfile.isNotEmpty
                                  ? profileController.resultProfile.first.bio ?? ''
                                  : '',
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGreyColor,
                                height: 1.7,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Investment Preferences',
                            style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                color: const Color(0xFF111111),
                                border: Border.all(
                                    color: const Color(0xFF292929), width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Typical Investment',
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    profileController.resultProfile.isNotEmpty
                                        ? profileController.resultProfile.first.preferredInvestment ?? "":"",
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 1,
                                    color: AppColors.darkGreyColor,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Preferred Stage',
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Color(0xFF272727))),
                                      child: Text(
                                        profileController.resultProfile.isNotEmpty
                                            ? profileController.resultProfile.first.preferredStage ?? "":"",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.whiteColor),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 1,
                                    color: AppColors.darkGreyColor,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Industries',
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color(0xFF272727))),
                                      child: Text(
                                        profileController.resultProfile.isNotEmpty
                                            ? profileController.resultProfile.first.preferredIndustries ?? "":"",
                                          style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.whiteColor),
                                    ),
                                  )),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 1,
                                    color: AppColors.darkGreyColor,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Preferred Location',
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    profileController.resultProfile.isNotEmpty
                                        ?  profileController.resultProfile.first.preferredLocation ?? "":"",
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 16,)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.lightGreyColor,
                                border: Border.all(
                                    color: AppColors.darkGreyColor, width: 1),
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    profileController.clickNotification();
                                  },
                                  child: SettingsRowWidget(
                                      icon: Icons.notifications_none_rounded,
                                      title: 'Notifications',
                                      showArrow: true),
                                ),
                                const Divider(),
                                GestureDetector(
                                  onTap:(){
                                    profileController.clickPrivacyPolicy();
                                  },
                                  child: SettingsRowWidget(
                                      icon: Icons.lock_outline_rounded,
                                      title: 'Privacy & Security',
                                      showArrow: true),
                                ),
                                const Divider(),
                                GestureDetector(
                                  onTap:(){
                                    profileController.clickHelpAndSupport();
                                  },
                                  child: SettingsRowWidget(
                                      icon: Icons.help_outline_rounded,
                                      title: 'Help & Support',
                                      showArrow: true),
                                ),
                                Divider(),
                                GestureDetector(
                                  onTap: (){
                                    profileController.showLogoutDialog(context);
                                  },
                                  child: SettingsRowWidget(
                                    icon: Icons.logout_rounded,
                                    title: 'Logout',
                                    showArrow: false,
                                    iconColor: const Color(0xFFFF6B6B),
                                    titleColor: const Color(0xFFFF6B6B),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      );
    });
  }
}
