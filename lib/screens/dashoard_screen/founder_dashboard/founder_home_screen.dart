import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/founder_dashboard_controller.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/widgets/create_post_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/founder_dashboard_header_widget.dart';

class FounderHomeScreen extends StatelessWidget {
  const FounderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FounderDashboardController>(builder: (homeController) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
            child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FounderHeaderWidget(homeController),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          homeController.clickPlanDetails();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 14),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 13,
                          ),
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFF151515),
                            borderRadius: BorderRadius.circular(23),
                            border: Border.all(
                              color: const Color(0xFF6A6A6A),
                              width: 0.8,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 43,
                                height: 43,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFF202020),
                                  border: Border.all(
                                    color: const Color(0xFF303030),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.white70,
                                  size: 21,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Plan activated',
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Launch Plan',
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.whiteColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '50 Credits pending',
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  homeController.clickPlanDetails();
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'View details',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.chevron_right,
                                      color: AppColors.whiteColor,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'What would you like to do today?',
                          style: GoogleFonts.montserrat(
                            color: AppColors.whiteColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          height: 230,
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CreatePostWidget(
                                    icon: Icons.trending_up_rounded,
                                    title: 'Raise Capital',
                                    description:
                                        'Connect with the right investors and raise funding.',
                                    buttonText: 'Raise now',
                                    onTap: () {
                                      homeController.clickFundsRaise();
                                    },
                                    context: context),
                                const SizedBox(width: 14),
                                CreatePostWidget(
                                    icon: Icons.business_center_outlined,
                                    title: 'List Your Business',
                                    description:
                                        'List your business and connect with serious buyers and acquirers.',
                                    buttonText: 'List Now',
                                    onTap: () {
                                      homeController.clickSellYourCompany();
                                    },
                                    context: context),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Investors Looking for Startups',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                homeController.selectedIndex.value = 1;
                              },
                              child: Text(
                                'View all',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Obx(() => SizedBox(
                            height: 290,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.investorList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      homeController.InvestorDetails(
                                          homeController.investorList[index]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 10),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                1.5,
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        padding: const EdgeInsets.all(13),
                                        decoration: BoxDecoration(
                                          color: AppColors
                                              .containerBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border: Border.all(
                                            color:
                                                AppColors.containerBorderColor,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF202020),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Icon(
                                                    Icons.trending_up_rounded,
                                                    color: Color(0xFFAAAAAA),
                                                    size: 22,
                                                  ),
                                                ),
                                                const Spacer(),
                                                homeController
                                                            .investorList[index]
                                                            .isSaved ??
                                                        false
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          homeController
                                                              .clickRemoveApi(
                                                            homeController
                                                                .investorList[
                                                                    index]
                                                                .id
                                                                .toString(),
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.bookmark,
                                                          color: AppColors
                                                              .whiteColor,
                                                          size: 22,
                                                        ),
                                                      )
                                                    : GestureDetector(
                                                        onTap: () {
                                                          homeController
                                                              .clickSavedApi(
                                                            homeController
                                                                .investorList[
                                                                    index]
                                                                .id
                                                                .toString(),
                                                          );
                                                        },
                                                        child: const Icon(
                                                          Icons.bookmark_border,
                                                          color:
                                                              Color(0xFF777777),
                                                          size: 22,
                                                        ),
                                                      ),
                                              ],
                                            ),
                                            const SizedBox(height: 13),
                                            Row(
                                              children: [
                                                Text(
                                                  '${homeController.investorList[index].firstName.toString()} ${homeController.investorList[index].lastName.toString()}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.montserrat(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                const Icon(
                                                  Icons.verified,
                                                  color:
                                                      AppColors.verifiedColor,
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              '${homeController.investorList[index].fund_type.toString()}',
                                              style: GoogleFonts.montserrat(
                                                  color:
                                                      AppColors.darkGreyColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Range',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color: AppColors
                                                                  .darkGreyColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    Text(
                                                      '₹ ${homeController.investorList[index].preferred_investment.toString()}/-',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Stage',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color: AppColors
                                                                  .darkGreyColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    Text(
                                                      homeController
                                                          .investorList[index]
                                                          .preferred_stage
                                                          .toString(),
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            // SizedBox(
                                            //   height: 30,
                                            //   child: ListView.builder(
                                            //       itemCount: 2,
                                            //       scrollDirection:
                                            //           Axis.horizontal,
                                            //       itemBuilder:
                                            //           (context, index) {
                                            //         return ;
                                            //       }),
                                            // ),

                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                color: AppColors
                                                    .containerBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(11),
                                                border: Border.all(
                                                    color: AppColors
                                                        .containerBorderColor,
                                                    width: 1),
                                              ),
                                              child: Text(
                                                homeController
                                                    .investorList[index]
                                                    .preferred_industries
                                                    .toString(),
                                                style: GoogleFonts.montserrat(
                                                    color:
                                                        AppColors.darkGreyColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),

                                            const SizedBox(height: 10),
                                            const Divider(
                                              height: 2,
                                              color: AppColors
                                                  .containerBorderColor,
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on_outlined,
                                                  color:
                                                      AppColors.darkGreyColor,
                                                  size: 22,
                                                ),
                                                const SizedBox(width: 2),
                                                Text(
                                                  homeController
                                                      .investorList[index]
                                                      .currentLocation
                                                      .toString(),
                                                  style: GoogleFonts.montserrat(
                                                      color: AppColors
                                                          .darkGreyColor,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  'View Profile ›',
                                                  style: GoogleFonts.montserrat(
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
