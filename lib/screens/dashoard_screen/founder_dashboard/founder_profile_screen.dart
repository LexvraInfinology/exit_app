import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/founder_dashboard_controller.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/widgets/settings_row_widget.dart';
import 'package:exit_app/screens/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';

class FounderProfileScreen extends StatelessWidget {
  const FounderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FounderDashboardController>(builder: (profileController) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      profileController.selectedIndex.value = 0;
                      // Get.back();
                    },
                    child: Image.asset(
                      AppImages.backIcon,
                      width: 42,
                      height: 42,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Profile',
                    style: GoogleFonts.montserrat(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.to(const NotificationScreen());
                    },
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
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
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
                                      color: AppColors.whiteColor,
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
                                  Obx(
                                    () => Text(
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
                                      fontWeight: FontWeight.w400,
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
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: GestureDetector(
                          onTap: () {
                            profileController.clickEditProfile(profileController.resultProfile.first);
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Text(
                              'Edit Profile',
                              style: GoogleFonts.montserrat(
                                color: AppColors.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Your Startup',
                        style: GoogleFonts.montserrat(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: AppColors.lightGreyColor,
                            border: Border.all(
                                color: AppColors.darkGreyColor, width: 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF292929),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.layers_rounded,
                                    color: AppColors.whiteColor,
                                    size: 25,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lexvra Infinology',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.whiteColor),
                                    ),
                                    const SizedBox(height: 4),
                                    // Text(
                                    //   controller.startupCategory,
                                    //   style: const TextStyle(
                                    //     color: Color(0xFF777777),
                                    //     fontSize: 12,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 22),
                            Text(
                              'Building smarter financial tools for small businesses.',
                              style: GoogleFonts.montserrat(
                                color: AppColors.darkGreyColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 1.55,
                              ),
                            ),
                            const SizedBox(height: 22),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'View Company Profile',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 17,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 72,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: AppColors.lightGreyColor,
                            border: Border.all(
                                color: AppColors.darkGreyColor, width: 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.containerBorderColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.shield_outlined,
                                size: 18,
                                color: Color(0xFF999999),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Profile visible to investors',
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: profileController.toggleVisibility,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.containerBackgroundColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: AppColors.containerBorderColor,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        profileController.isPublic.value
                                            ? 'Public'
                                            : 'Private',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 16,
                                        color: Color(0xFF888888),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'About You',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3.5,
                              height: 70,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.containerBackgroundColor,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: AppColors.containerBorderColor,
                                      width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Obx(()=> Text(
                                     profileController.resultProfile.isNotEmpty?
                                     '${profileController.resultProfile.first.experience}+ Years' ??
                                         '':'',
                                     style: GoogleFonts.montserrat(
                                         color: AppColors.whiteColor,
                                         fontSize: 14,
                                         fontWeight: FontWeight.w500),
                                   )),
                                    const Text(
                                      'Experience',
                                      style: TextStyle(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3.5,
                              height: 70,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.containerBackgroundColor,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: AppColors.containerBorderColor,
                                      width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Obx(()=> Text(
                                     profileController.resultProfile.isNotEmpty?
                                     '${profileController.resultProfile.first.preferredLocation}' ??
                                         '':'',
                                     style: GoogleFonts.montserrat(
                                         color: AppColors.whiteColor,
                                         fontSize: 14,
                                         fontWeight: FontWeight.w500),
                                   )),
                                    Text(
                                      'Location',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3.5,
                              height: 70,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.containerBackgroundColor,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: AppColors.containerBorderColor,
                                      width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(()=>Text(
                                      profileController.resultProfile.isNotEmpty?
                                      '${profileController.resultProfile.first.preferredStage}' ??
                                          '':'',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    Text(
                                      'Current Stage',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3.5,
                              height: 70,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.containerBackgroundColor,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: AppColors.containerBorderColor,
                                      width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(()=>Text(
                                      profileController.resultProfile.isNotEmpty?
                                      '${profileController.resultProfile.first.teamSize}' ??
                                          '':'',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    Text(
                                      'Team Size',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 15, 18, 15),
                        decoration: BoxDecoration(
                            color: AppColors.lightGreyColor,
                            border: Border.all(
                                color: AppColors.darkGreyColor, width: 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Current Plan',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.darkGreyColor,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 7,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF3A3A3A),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          'SCALE',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '100 credits remaining',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                profileController.clickManagePlan();
                              },
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Text(
                                  'Manage Plan',
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.lightGreyColor,
                            border: Border.all(
                                color: AppColors.darkGreyColor, width: 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(const NotificationScreen());
                              },
                              child: SettingsRowWidget(
                                  icon: Icons.notifications_none_rounded,
                                  title: 'Notifications',
                                  showArrow: true),
                            ),
                            const Divider(),
                            GestureDetector(
                              onTap: () {
                                profileController.clickPrivacyPolicy();
                              },
                              child: SettingsRowWidget(
                                  icon: Icons.lock_outline_rounded,
                                  title: 'Privacy & Security',
                                  showArrow: true),
                            ),
                            const Divider(),
                            GestureDetector(
                              onTap: () {
                                profileController.clickHelpAndSupport();
                              },
                              child: SettingsRowWidget(
                                  icon: Icons.help_outline_rounded,
                                  title: 'Help & Support',
                                  showArrow: true),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
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
                ),
              ),
            ),
          ],
        )),
      );
    });
  }
}
