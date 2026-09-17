import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/founder_dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';

class PostDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FounderDashboardController>(builder: (controller) {
      final cardDecoration = BoxDecoration(
        color: AppColors.containerBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.containerBorderColor),
      );
      final sectionTitleStyle = GoogleFonts.montserrat(
        fontSize: 16,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
      );
      final labelStyle = GoogleFonts.montserrat(
        fontSize: 12,
        color: AppColors.darkGreyColor,
        fontWeight: FontWeight.w400,
      );
      final valueStyle = GoogleFonts.montserrat(
        fontSize: 16,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
      );

      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
            child: Column(
              children: [
                Row(
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
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Funding Details',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 16, bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipOval(
                              child: Image.asset(
                                AppImages.createProfileImage,
                                width: 88,
                                height: 88,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'NovaNest',
                                style: GoogleFonts.montserrat(
                                    color: AppColors.whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.verified,
                                color: AppColors.verifiedColor,
                                size: 16,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.lightGreenColor,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: AppColors.greenColor, width: 1)),
                              child: Text(
                                'Published',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.greenColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              'FinTech · Seed · Bengaluru',
                              style: GoogleFonts.montserrat(
                                  color: AppColors.darkGreyColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
                            decoration: cardDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Your request is live',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.clickBoostProfile();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                width: 1,
                                                color: AppColors.whiteColor)),
                                        child: Text(
                                          'Boost Request',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Published on 24 Aug 2026',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: labelStyle,
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text('32', style: valueStyle),
                                          const SizedBox(height: 4),
                                          Text('Views', style: labelStyle),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 28,
                                      width: 1,
                                      color: AppColors.containerBorderColor,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text('4', style: valueStyle),
                                          const SizedBox(height: 4),
                                          Text('Interested', style: labelStyle),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 28,
                                      width: 1,
                                      color: AppColors.containerBorderColor,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text('2', style: valueStyle),
                                          const SizedBox(height: 4),
                                          Text('Connections',
                                              style: labelStyle),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Funding Details',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: sectionTitleStyle,
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                            decoration: cardDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('₹75L', style: valueStyle),
                                          const SizedBox(height: 6),
                                          Text('Funding Goal',
                                              style: labelStyle),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('1–3 Mo', style: valueStyle),
                                          const SizedBox(height: 6),
                                          Text('Timeline', style: labelStyle),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 22),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Seed', style: valueStyle),
                                          const SizedBox(height: 6),
                                          Text('Stage', style: labelStyle),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Equity', style: valueStyle),
                                          const SizedBox(height: 6),
                                          Text('Funding Type',
                                              style: labelStyle),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 18),
                                Container(
                                  height: 1,
                                  color: AppColors.containerBorderColor,
                                ),
                                const SizedBox(height: 16),
                                Text('Use of Funds', style: labelStyle),
                                const SizedBox(height: 8),
                                Text(
                                  'Product development · Hiring · Marketing',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.whiteColor,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Investor Activity',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: sectionTitleStyle,
                              ),
                              Text(
                                '4 investors interested',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: AppColors.darkGreyColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            decoration: cardDecoration,
                            child: Column(
                              children: [
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12),
                                            child: Row(
                                              children: [
                                                ClipOval(
                                                    child: Image.asset(
                                                  AppImages.createProfileImage,
                                                  width: 36,
                                                  height: 36,
                                                  fit: BoxFit.cover,
                                                )),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Northstar Ventures',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppColors
                                                                    .whiteColor),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        'VC Fund · Bengaluru',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .darkGreyColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'Interested',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .whiteColor),
                                                    ),
                                                    const SizedBox(height: 2),
                                                    Text(
                                                      '2h ago',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .darkGreyColor),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          if (index != 2)
                                            Container(
                                              height: 1,
                                              color: AppColors
                                                  .containerBorderColor,
                                            ),
                                        ],
                                      );
                                    }),
                                const SizedBox(height: 8),
                                Container(
                                  height: 1,
                                  color: AppColors.containerBorderColor,
                                ),
                                const SizedBox(height: 14),
                                InkWell(
                                  onTap: () {
                                    controller.clickViewInterestInvestors();
                                  },
                                  child: Text(
                                    'View all interested investors →',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: AppColors.whiteColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'About the Company',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: sectionTitleStyle,
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                            decoration: cardDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    'FinTech',
                                    'Saas',
                                    'Seed',
                                  ].map((tag) {
                                    return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: AppColors.darkGreyColor1),
                                        child: Text(
                                          tag,
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.whiteColor,
                                              fontSize: 11),
                                        ));
                                  }).toList(),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  '“Building smarter financial tools for small businesses.”',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.whiteColor,
                                      fontSize: 15,
                                      height: 1.45),
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Location', style: labelStyle),
                                    Text(
                                      'Bengaluru, India',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 13,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Founded', style: labelStyle),
                                    Text(
                                      '2024',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 13,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Team Size', style: labelStyle),
                                    Text(
                                      '2-10',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 13,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  height: 1,
                                  color: AppColors.containerBorderColor,
                                ),
                                const SizedBox(height: 14),
                                Center(
                                  child: Text(
                                    'View Company Profile →',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: AppColors.whiteColor),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
