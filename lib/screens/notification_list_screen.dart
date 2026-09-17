import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/notification_controller.dart';
import 'package:exit_app/controller/notification_list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotificationController(),
        builder: (controller) {
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
                                Get.back();
                              },
                              child: Image.asset(
                                AppImages.backIcon,
                                width: 42,
                                height: 42,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Notifications',
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteColor),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text(
                                'Notification Settings',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.darkGreyColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: AppColors.containerBackgroundColor,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: AppColors.containerBorderColor,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Obx(()=>Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 21,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'New Funding Requests',
                                                style: const TextStyle(
                                                  color: Color(0xFFE0E0E3),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Requests matching your investment preferences',
                                                style: const TextStyle(
                                                  color: Color(0xFF8A8B90),
                                                  fontSize: 12,
                                                  height: 1.45,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Switch(
                                          value: controller.newFundingRequests.value,
                                          onChanged: controller.toggleNewFundingRequests,
                                          activeColor: const Color(0xFFF1F1F1),
                                          activeTrackColor:
                                          const Color(0xFF5A5B5E),
                                          inactiveThumbColor:
                                          const Color(0xFF8B8C90),
                                          inactiveTrackColor:
                                          const Color(0xFF303134),
                                          materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      ],
                                    ),
                                  )),
                                  Divider(color: AppColors.darkGreyColor,),
                                  Obx(()=>Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 21,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Founder Interest',
                                                style: const TextStyle(
                                                  color: Color(0xFFE0E0E3),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'When a founder responds or connects with you ',
                                                style:  GoogleFonts.montserrat(
                                                  color:AppColors.darkGreyColor,
                                                  fontSize: 12,
                                                  height: 1.45,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Switch(
                                          value: controller.founderInterest.value,
                                          onChanged: controller.founderInterest,
                                          activeColor: const Color(0xFFF1F1F1),
                                          activeTrackColor:
                                          const Color(0xFF5A5B5E),
                                          inactiveThumbColor:
                                          const Color(0xFF8B8C90),
                                          inactiveTrackColor:
                                          const Color(0xFF303134),
                                          materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      ],
                                    ),
                                  )),
                                  Obx(()=>Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 21,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Messages & Connections',
                                                style:  GoogleFonts.montserrat(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'New messages and connection requests',
                                                style:  GoogleFonts.montserrat(
                                                  color: AppColors.darkGreyColor,
                                                  fontSize: 12,
                                                  height: 1.45,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Switch(
                                          value: controller.messagesConnections.value,
                                          onChanged: controller.messagesConnections,
                                          activeColor: const Color(0xFFF1F1F1),
                                          activeTrackColor:
                                          const Color(0xFF5A5B5E),
                                          inactiveThumbColor:
                                          const Color(0xFF8B8C90),
                                          inactiveTrackColor:
                                          const Color(0xFF303134),
                                          materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      ],
                                    ),
                                  )),
                                  Obx(()=>Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 21,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Portflio Updates',
                                                style: GoogleFonts.montserrat(
                                                  color:AppColors.whiteColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Updates from companies you’ve invested in',
                                                style: GoogleFonts.montserrat(
                                                  color: AppColors.darkGreyColor,
                                                  fontSize: 12,
                                                  height: 1.45,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Switch(
                                          value: controller.portfolioUpdates.value,
                                          onChanged: controller.portfolioUpdates,
                                          activeColor: const Color(0xFFF1F1F1),
                                          activeTrackColor:
                                          const Color(0xFF5A5B5E),
                                          inactiveThumbColor:
                                          const Color(0xFF8B8C90),
                                          inactiveTrackColor:
                                          const Color(0xFF303134),
                                          materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                                    SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 24),
                                      child: Text(
                                        'Preferences',
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: BoxDecoration(
                                        color: AppColors.containerBackgroundColor,
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                          color: AppColors.containerBorderColor,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Obx(()=>Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 21,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Push Notifications',
                                                        style: const TextStyle(
                                                          color: Color(0xFFE0E0E3),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        'Receive notifications on your device',
                                                        style: const TextStyle(
                                                          color: Color(0xFF8A8B90),
                                                          fontSize: 12,
                                                          height: 1.45,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Switch(
                                                  value: controller.pushNotifications.value,
                                                  onChanged: controller.pushNotifications,
                                                  activeColor: const Color(0xFFF1F1F1),
                                                  activeTrackColor:
                                                  const Color(0xFF5A5B5E),
                                                  inactiveThumbColor:
                                                  const Color(0xFF8B8C90),
                                                  inactiveTrackColor:
                                                  const Color(0xFF303134),
                                                  materialTapTargetSize:
                                                  MaterialTapTargetSize.shrinkWrap,
                                                ),
                                              ],
                                            ),
                                          )),
                                          Obx(()=>Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 21,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Email Notifications',
                                                        style: const TextStyle(
                                                          color: Color(0xFFE0E0E3),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        'Receive  important updates via email',
                                                        style:  GoogleFonts.montserrat(
                                                          color:AppColors.darkGreyColor,
                                                          fontSize: 12,
                                                          height: 1.45,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Switch(
                                                  value: controller.emailNotifications.value,
                                                  onChanged: controller.emailNotifications,
                                                  activeColor: const Color(0xFFF1F1F1),
                                                  activeTrackColor:
                                                  const Color(0xFF5A5B5E),
                                                  inactiveThumbColor:
                                                  const Color(0xFF8B8C90),
                                                  inactiveTrackColor:
                                                  const Color(0xFF303134),
                                                  materialTapTargetSize:
                                                  MaterialTapTargetSize.shrinkWrap,
                                                ),
                                              ],
                                            ),
                                          )),

                                        ],
                                      ),
                                    ),
                          ])))
                    ]),
              ));
        });
  }
}
