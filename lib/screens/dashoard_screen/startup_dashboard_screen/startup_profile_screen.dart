import 'package:exit_app/controller/startUp_dashboard_controller.dart';
import 'package:exit_app/screens/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_images.dart';
import '../founder_dashboard/widgets/settings_row_widget.dart';

class StartUpProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartUpDashBoardController>(builder: (controller) {
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
                      controller.selectedIndex.value = 0;
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
                                  Text(
                                    'Aarav Mehta',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.whiteColor),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Founder & CEO',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: AppColors.darkGreyColor,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 14,
                                        color: AppColors.darkGreyColor,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        'Mohali',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: AppColors.darkGreyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
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
                            controller.clickEditProfile();
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
                      const SizedBox(
                        height: 10,
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
                                    color: Colors.white,
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
                                    SizedBox(height: 4),
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
                              'Building smarter financial tools for small\nbusinesses.',
                              style: GoogleFonts.montserrat(
                                color: AppColors.darkGreyColor,
                                fontSize: 14,
                                height: 1.55,
                              ),
                            ),
                            const SizedBox(height: 22),
                            GestureDetector(
                              onTap: () {},
                              child:  Row(
                                children: [
                                  Text(
                                    'View Company Profile',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
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
                                color: const Color(0xFF181818),
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
                                    fontSize: 13, color: AppColors.whiteColor),
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: controller.toggleVisibility,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1A1A1A),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xFF303030),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        controller.isPublic.value
                                            ? 'Public'
                                            : 'Private',
                                        style:  GoogleFonts.montserrat(
                                          fontSize: 12,
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
                        height: 10,
                      ),
                       Text(
                        'About You',
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       Text(
                        'Founder and product builder focused on building technology that solves real business problems.',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: AppColors.darkGreyColor,
                          height: 1.7,
                        ),
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
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: const Color(0xFF292929), width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      '6+ years',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                     Text(
                                      'Experience',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 8,
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
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: const Color(0xFF292929), width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      'Bengalutu',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                     Text(
                                      'Location',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 8,
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
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: const Color(0xFF292929), width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      'Seed Satge',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                     Text(
                                      'Current Stage',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 8,
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
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: const Color(0xFF292929), width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      '2-10',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                     Text(
                                      'Team Size',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 8,
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
                                          fontSize: 12,
                                          color: Color(0xFF777777),
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
                                            fontSize: 9,
                                            color: Color(0xFFCCCCCC),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                   Text(
                                    '100 credits remaining',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: Color(0xFFCCCCCC),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.clickManageProfile();
                              },
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Text(
                                  'Manage Plan',
                                  style:  GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 12,
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
                                controller.clickNotification();
                              },
                              child: SettingsRowWidget(
                                  icon: Icons.notifications_none_rounded,
                                  title: 'Notifications',
                                  showArrow: true),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
                                controller.clickPrivacyPolicy();
                              },
                              child: SettingsRowWidget(
                                  icon: Icons.lock_outline_rounded,
                                  title: 'Privacy & Security',
                                  showArrow: true),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
                                controller.clickHelpAndSupport();
                              },
                              child: SettingsRowWidget(
                                  icon: Icons.help_outline_rounded,
                                  title: 'Help & Support',
                                  showArrow: true),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: (){
                                controller.showLogoutDialog(Get.context!);
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
