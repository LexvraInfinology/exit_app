import 'package:exit_app/controller/startUp_dashboard_controller.dart';
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
            child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      onTap: () {
                        startUpController.clickNotification();
                      },
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
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
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    startUpController.clickPlanDetails();
                  },
                  child: Container(
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
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Launch Plan',
                              style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Renew on 12 May 2025',
                              style: GoogleFonts.montserrat(
                                color: AppColors.darkGreyColor,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                'View details',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.whiteColor,
                                  fontSize: 12,
                                ),
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
                Text(
                  'What would you like to do today?',
                  style: GoogleFonts.montserrat(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 220,
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
                const SizedBox(height: 25),
                Text('Your Activity',
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor)),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColors.darkGreyColor, width: 1)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Equity Request',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: AppColors.whiteColor),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF063D27),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text(
                                      'Published',
                                      style: TextStyle(
                                        color: Color(0xFF32D583),
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'NovaNest · ₹75L · Seed',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.whiteColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '32 Views · 4 Interested',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.darkGreyColor),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              startUpController.InvestorDetails();
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.darkGreyColor,
                              size: 24,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColors.darkGreyColor,
                        thickness: 1,
                        height: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'For Sale Listing',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: AppColors.whiteColor),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF063D27),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text(
                                      'Live',
                                      style: TextStyle(
                                        color: Color(0xFF32D583),
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'NovaNest · Fintech',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.whiteColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '32 Views · 4 Inquiries',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.darkGreyColor),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              startUpController.InvestorDetails();
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.darkGreyColor,
                              size: 24,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Investors Looking for Startups',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        startUpController.selectedIndex.value = 1;
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 270,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            startUpController.InvestorDetails();
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width / 1.5,
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              color: const Color(0xFF111111),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFF292929),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF202020),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.trending_up_rounded,
                                        color: Color(0xFFAAAAAA),
                                        size: 18,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.bookmark_border,
                                      color: Color(0xFF777777),
                                      size: 17,
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 13),

                                // NAME
                                const Row(
                                  children: [
                                    Text(
                                      'Northstar Ventures',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.verified,
                                      color: Color(0xFF2196F3),
                                      size: 11,
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 5),

                                const Text(
                                  'VC Fund',
                                  style: TextStyle(
                                    color: AppColors.darkGreyColor,
                                    fontSize: 10,
                                  ),
                                ),

                                const SizedBox(height: 15),

                                // RANGE + STAGE
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Range',
                                          style: TextStyle(
                                            color: AppColors.darkGreyColor,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          '₹25L – ₹2Cr',
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Stage',
                                          style: TextStyle(
                                            color: AppColors.darkGreyColor,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          'Seed – Series A',
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                SizedBox(
                                  height: 30,
                                  child: ListView.builder(
                                      itemCount: 2,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.blackColor,
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            border: Border.all(
                                                color: const Color(0xFF292929),
                                                width: 1),
                                          ),
                                          child: const Text(
                                            'Fintech',
                                            style: TextStyle(
                                                color: AppColors.darkGreyColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        );
                                      }),
                                ),
                                const SizedBox(height: 10),

                                Divider(
                                  height: 1,
                                  color: const Color(0xFF292929),
                                ),

                                const SizedBox(height: 10),

                                // LOCATION
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xFF555555),
                                      size: 11,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      'Bengaluru',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 9,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'View Profile ›',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}
