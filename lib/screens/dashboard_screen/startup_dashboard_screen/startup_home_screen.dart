import 'package:exit_app/controller/startUp_dashboard_controller.dart';
import 'package:exit_app/screens/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/founder_dashboard_header_widget.dart';
import '../../../constants/app_color.dart';
import '../../../constants/app_images.dart';
import '../founder_dashboard/widgets/create_post_widgets.dart';

class StartUpHomeScreen extends StatelessWidget {
  const StartUpHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartUpDashBoardController>(builder: (startUpController) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
            child: SafeArea(
              child: Column(
                children: [
                            Row(
                              children: [
                          Image.asset(
                            AppImages.dashboardIcon,
                            width: 32,
                            height: 32,
                          ),
                          const SizedBox(width: 2),
                          const Text(
                            'EXIT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (){Get.to(const NotificationScreen());},
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: const Icon(
                                Icons.notifications_none_rounded,
                                color: Colors.white,
                                size: 29,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              startUpController.selectedIndex.value = 4;
                            },
                            child: Container(
                              width: 38,
                              height: 38,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF292929),
                              ),
                              child: const Text(
                                'AM',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 0),
                        ],
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
                              startUpController.clickPlanDetails();
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
                                      startUpController.clickPlanDetails();
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
                                        title: 'Raise Capital for Equity',
                                        description:
                                        'Connect with the right investors and raise funding.',
                                        buttonText: 'Raise now',
                                        onTap: () {
                                          startUpController.clickFundsRaise();
                                        },
                                        context: context),
                                    const SizedBox(width: 14),
                                    CreatePostWidget(
                                        icon: Icons.business_center_outlined,
                                        title: 'Sell your Startup',
                                        description:
                                        'List your business and connect with serious buyers and acquirers.',
                                        buttonText: 'List Now',
                                        onTap: () {
                                          startUpController.clickSellYourCompany();
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
                                    startUpController.selectedIndex.value = 1;
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
                                itemCount: startUpController.investorList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      startUpController.InvestorDetails(
                                          startUpController.investorList[index]);
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
                                                startUpController
                                                    .investorList[index]
                                                    .isSaved ??
                                                    false
                                                    ? GestureDetector(
                                                  onTap: () {
                                                    startUpController
                                                        .clickRemoveApi(
                                                      startUpController
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
                                                    startUpController
                                                        .clickSavedApi(
                                                      startUpController
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
                                                  '${startUpController.investorList[index].firstName.toString()} ${startUpController.investorList[index].lastName.toString()}',
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
                                              '${startUpController.investorList[index].fund_type.toString()}',
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
                                                      '₹ ${startUpController.investorList[index].preferred_investment.toString()}/-',
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
                                                      startUpController
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
                                                startUpController
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
                                                  startUpController
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
