import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/plan_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';

class PlanDetailsScreen extends StatelessWidget {
  const PlanDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PlanDetailsController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Back button
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

                        const SizedBox(width: 15),

                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                'Plan Details',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.containerBackgroundColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.containerBorderColor,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Plan activated',
                                        style: GoogleFonts.montserrat(
                                            color: AppColors.darkGreyColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 7,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors
                                              .containerBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color:
                                                AppColors.containerBorderColor,
                                          ),
                                        ),
                                        child: Text(
                                          'Active',
                                          style: GoogleFonts.montserrat(
                                            color: Color(0xFF43D3A5),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 7),
                                  const Text(
                                    'Launch Plan',
                                    style: TextStyle(
                                      color: Color(0xFFE6E6E8),
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    'Renews on 12 May 2025',
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 20),
                                  const Divider(
                                    height: 1,
                                    color: Color(0xFF2A2C2E),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Container(
                                        width: 34,
                                        height: 34,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF211A37),
                                        ),
                                        child: const Icon(
                                          Icons.rocket_launch,
                                          color: Color(0xFF8B6AF7),
                                          size: 18,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          'You’re getting the most out of EXIT with Launch Plan.',
                                          style: GoogleFonts.montserrat(
                                              color: Color(0xFFD6D6D9),
                                              fontSize: 14,
                                              height: 1.55,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Plan Benefits',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkGreyColor),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: AppColors.containerBackgroundColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.containerBorderColor,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      // ListView.builder(
                                      //   shrinkWrap: true,
                                      //   physics: NeverScrollableScrollPhysics(),
                                      //   itemCount: 10,
                                      //   itemBuilder: (context, index) {
                                      //     return
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 17,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 24,
                                              child: Icon(
                                                Icons.search,
                                                size: 20,
                                                color: const Color(0xFF9EA1A8),
                                              ),
                                            ),
                                            const SizedBox(width: 17),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Investor Discovery',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: Color(0xFFDCDDE0),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    'Discover investors that match your startup.',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: AppColors
                                                          .darkGreyColor,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Icon(
                                              Icons.check,
                                              size: 20,
                                              color: Color(0xFFE0E1E4),
                                            ),
                                          ],
                                        ),
                                      )
                                      // },
                                      // )

                                      // if (showDivider)
                                      //   const Divider(
                                      //     height: 1,
                                      //     color: Color(0xFF292B2E),
                                      //   ),
                                    ],
                                  )

                                  // PlanBenefitItem(
                                  //   icon: Icons.near_me_outlined,
                                  //   title: 'Funding Requests',
                                  //   subtitle: 'Create and manage funding requests.',
                                  // ),
                                  //
                                  // PlanBenefitItem(
                                  //   icon: Icons.format_list_bulleted,
                                  //   title: 'Company Listing',
                                  //   subtitle: 'List your startup for investors and buyers.',
                                  // ),
                                  //
                                  // PlanBenefitItem(
                                  //   icon: Icons.visibility_outlined,
                                  //   title: 'Profile Visibility',
                                  //   subtitle: 'Get discovered by relevant investors.',
                                  // ),
                                  //
                                  // PlanBenefitItem(
                                  //   icon: Icons.bolt,
                                  //   title: 'Boost Your Profile',
                                  //   subtitle: 'Increase visibility when you need reach.',
                                  // ),
                                  //
                                  // PlanBenefitItem(
                                  //   icon: Icons.headset_mic_outlined,
                                  //   title: 'Priority Support',
                                  //   subtitle: 'Get help from the EXIT support team.',
                                  //   showDivider: false,
                                  // ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Billing Details',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkGreyColor),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.containerBackgroundColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.containerBorderColor,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Plan',
                                          style: GoogleFonts.montserrat(
                                              color: Color(0xFF96989E),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        'Launch Plan',
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 22),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Billing Cycle',
                                          style: GoogleFonts.montserrat(
                                              color: Color(0xFF96989E),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        'Yearly',
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 22),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Amount',
                                          style: GoogleFonts.montserrat(
                                              color: Color(0xFF96989E),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        '₹9,999 / year',
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 22),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Payment Method',
                                          style: GoogleFonts.montserrat(
                                              color: Color(0xFF96989E),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        '•••• 4242',
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFFD9D9DC),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 22),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Next Renewal',
                                          style: GoogleFonts.montserrat(
                                              color: Color(0xFF96989E),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        '12 May 2025',
                                        style: GoogleFonts.montserrat(
                                          color:AppColors.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.clickManagePlan();
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.containerBackgroundColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color:AppColors.containerBorderColor,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Manage Plan',
                                            style: GoogleFonts.montserrat(
                                              color: Color(0xFFE0E0E3),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 7),
                                          Text(
                                            'Update payment method or manage your subscription',
                                            style: GoogleFonts.montserrat(
                                              color: Color(0xFF888A90),
                                              fontSize: 12,
                                              height: 1.45,
                                              fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.chevron_right,
                                      color: Color(0xFF9C9EA4),
                                      size: 22,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
