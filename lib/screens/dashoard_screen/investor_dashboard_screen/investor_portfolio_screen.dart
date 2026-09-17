import 'package:exit_app/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';
import '../../../controller/investor_dashboard_controller.dart';

class InvestorPortfolioScreen extends StatelessWidget {
  const InvestorPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvestorDashboardController>(
        builder: (portfolioController) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        portfolioController.selectedIndex.value = 0;
                        // Get.back();
                      },
                      child: Image.asset(
                        AppImages.backIcon,
                        width: 42,
                        height: 42,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Portfolio',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.bookmark_border_rounded,
                      color: Colors.white,
                      size: 22,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 84,
                decoration: BoxDecoration(
                  color: AppColors.containerBackgroundColor,
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(
                    color: AppColors.containerBorderColor,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '3',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Active Investments',
                          style: GoogleFonts.montserrat(
                            fontSize: 9,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    )),
                    Container(
                      width: 1,
                      height: 34,
                      color: AppColors.whiteColor,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₹90L',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Total Invested',
                          style: GoogleFonts.montserrat(
                            fontSize: 9,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 21, 24, 18),
                child: Row(
                  children: [
                    Text(
                      'Your Investments',
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Sort by:',
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Relevance',
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.darkGreyColor,
                      size: 17,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return _investmentCard(
                          company: 'FinFlow',
                          category: 'FinTech · Seed · Mumbai',
                          invested: '₹15L',
                          ownership: '4%',
                          date: '05 May 2025',
                          updateTime: '1w ago',
                          update: '“Launched expense automation module.”',
                          icon: Icons.show_chart_rounded,
                          showDarkLogo: false,
                          context: context,
                          controller: portfolioController);
                    }),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _investmentCard(
      {required String company,
      required String category,
      required String invested,
      required String ownership,
      required String date,
      required String updateTime,
      required String update,
      required IconData icon,
      required bool showDarkLogo,
      required BuildContext context,
      required InvestorDashboardController controller}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.containerBackgroundColor,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: AppColors.containerBorderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 19),
        child: Column(
          children: [
            // Company header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: showDarkLogo
                        ? const Color(0xFF0B1015)
                        : const Color(0xFFE9E9E9),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColors.containerBorderColor,
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: 21,
                    color: showDarkLogo
                        ? AppColors.whiteColor
                        : const Color(0xFF8A8A8A),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            company,
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Color(0xFF9B5CFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 7,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        category,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.bookmark_border_rounded,
                  size: 21,
                  color: AppColors.darkGreyColor,
                ),
              ],
            ),

            const SizedBox(height: 21),

            Container(
              height: 1,
              color: AppColors.containerBorderColor,
            ),

            const SizedBox(height: 17),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Invested',
                        style: GoogleFonts.montserrat(
                          fontSize: 9,
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        '₹25L',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ownership',
                        style: GoogleFonts.montserrat(
                          fontSize: 9,
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        '5%',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Invested on',
                        style: GoogleFonts.montserrat(
                          fontSize: 9,
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        '12 Apr 2026',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 17),

            Container(
              height: 1,
              color: AppColors.containerBorderColor,
            ),

            const SizedBox(height: 20),

            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.fromLTRB(12, 11, 10, 12),
              decoration: BoxDecoration(
                color: AppColors.containerBackgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.containerBorderColor,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Color(0xFF9B5CFF),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Latest update · $updateTime',
                              style: GoogleFonts.montserrat(
                                fontSize: 9,
                                color: const Color(0xFF999999),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          update,
                          style: GoogleFonts.montserrat(
                              fontSize: 11,
                              color: const Color(0xFFC8C8C8),
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF8A8A8A),
                    size: 19,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                controller.clickInvestmentDetails();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View Investment',
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 16,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
