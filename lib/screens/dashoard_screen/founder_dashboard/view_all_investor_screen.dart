import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/widgets/filtter_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';
import '../../../controller/founder_dashboard_controller.dart';
import '../../../models/get_investor_list_model.dart';

class ViewAllInvestorScreen extends StatelessWidget {
  List investors = [
    {
      'name': 'Northstar Ventures',
      'type': 'VC Fund',
      'location': 'Bengaluru, India',
      'investment': '₹25L – ₹2Cr',
      'stage': 'Seed – Series A',
      'tags': ['SaaS', 'FinTech', 'B2B'],
      'logo': 'N',
    },
    {
      'name': 'Elevate Capital',
      'type': 'Venture Capital',
      'location': 'Mumbai, India',
      'investment': '₹50L – ₹3Cr',
      'stage': 'Seed – Series B',
      'tags': ['SaaS', 'AI / ML'],
      'logo': 'E',
    },
    {
      'name': 'Artha Ventures',
      'type': 'VC Fund',
      'location': 'Delhi, India',
      'investment': '₹25L – ₹1.5Cr',
      'stage': 'Pre-Seed – Series A',
      'tags': ['FinTech', 'Consumer'],
      'logo': 'A',
    },
    {
      'name': 'Momentum Capital',
      'type': 'Venture Capital',
      'location': 'Bengaluru, India',
      'investment': '₹1Cr – ₹5Cr',
      'stage': 'Series A – Series C',
      'tags': ['SaaS', 'Deep Tech'],
      'logo': 'M',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FounderDashboardController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.selectedIndex.value = 0;
                    },
                    child: Image.asset(
                      AppImages.backIcon,
                      width: 42,
                      height: 42,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Investors',
                      style: GoogleFonts.montserrat(
                        color: AppColors.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.bookmark_border,
                      color: AppColors.whiteColor,
                      size: 23,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 58,
                        decoration: BoxDecoration(
                          color: AppColors.containerBackgroundColor,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: AppColors.containerBorderColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Icon(
                              Icons.search,
                              color: AppColors.whiteColor,
                              size: 20,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextField(
                                style: GoogleFonts.montserrat(
                                  color: AppColors.whiteColor,
                                  fontSize: 14,
                                ),
                                cursorColor: AppColors.whiteColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      'Search by investor name, fund, or industry',
                                  hintStyle: GoogleFonts.montserrat(
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(
                            right: 24,
                            top: 20,
                          ),
                          children: [
                            FilterButtonWidget(
                              context: context,
                              text: 'Stage',
                              showArrow: true,
                              options: [
                                'Pre-Seed',
                                'Seed',
                                'Series A',
                                'Series B',
                              ],
                            ),
                            const SizedBox(width: 8),
                            FilterButtonWidget(
                              context: context,
                              text: 'Sector',
                              showArrow: true,
                              options: [
                                'SaaS',
                                'FinTech',
                                'AI / ML',
                                'HealthTech',
                              ],
                            ),
                            const SizedBox(width: 8),
                            FilterButtonWidget(
                              context: context,
                              text: 'Under ₹25L',
                              showArrow: true,
                              options: [
                                'Under ₹25L',
                                '₹25L–₹50L',
                                '₹50L–₹1Cr',
                                '₹1Cr–₹5Cr',
                              ],
                            ),
                            const SizedBox(width: 8),
                            FilterButtonWidget(
                              context: context,
                              text: 'India',
                              showArrow: true,
                              options: [
                                'India',
                                'Delhi NCR',
                                'Mumbai',
                                'Bengaluru',
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '132 investors found',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                                color: AppColors.darkGreyColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Text(
                            'Sort by:',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                                color: AppColors.darkGreyColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Relevance',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.darkGreyColor,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.investorList.length,
                            itemBuilder: (context, index) {
                              final investor = controller.investorList[index];
                              return GestureDetector(
                                onTap: () {
                                  controller?.InvestorDetails();
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: AppColors.blackColor,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                        color: const Color(0xFF292929),
                                        width: 1),
                                  ),
                                  child: InvestorWidget(
                                      name:
                                          '${investor.firstName} ${investor.lastName}' ??
                                              '',
                                      type: investor.role ?? '',
                                      location: investor.currentLocation ?? '',
                                      investment: '' ?? '',
                                      stage: investor.currentStage ?? '',
                                      logo: '' ?? '',
                                      controller: controller),
                                ),
                              );
                            },
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      );
    });
  }

  Widget InvestorWidget(
      {required String name,
      required String type,
      required String location,
      required String investment,
      required String stage,
      required String logo,
      int? index,
      FounderDashboardController? controller}) {

    Results? investor;

      if (controller != null &&
          index != null &&
          index! >= 0 &&
          index! < controller.investorList.length) {
        investor = controller.investorList[index!];
      }

      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ... your existing UI

              const SizedBox(width: 8),

              if (investor != null)
                GestureDetector(
                  onTap: () {
                    controller!.clickSavedApi(
                      investor!.id.toString(),
                    );
                  },
                  child: Icon(
                    Icons.bookmark_border,
                    color: investor!.isSaved == true
                        ? AppColors.whiteColor
                        : AppColors.darkGreyColor,
                    size: 22,
                  ),
                ),
            ],
          ),

          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.circular(11),
                      border:
                          Border.all(color: const Color(0xFF292929), width: 1),
                    ),
                    child: Center(
                      child: Text(
                        logo,
                        style: GoogleFonts.montserrat(
                          color: AppColors.whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                  color: AppColors.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.verified,
                              color: AppColors.verifiedColor,
                              size: 18,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          ' $location',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Obx(() {
                    if (controller == null) {
                      return const SizedBox.shrink();
                    }

                    if (index == null) {
                      return const SizedBox.shrink();
                    }

                    if (index! < 0 ||
                        index! >= controller!.investorList.length) {
                      return const SizedBox.shrink();
                    }

                    final investor = controller!.investorList[index!];

                    return GestureDetector(
                      onTap: () {
                        controller!.clickSavedApi(
                          investor.id.toString(),
                        );
                      },
                      child: Icon(
                        Icons.bookmark_border,
                        color: investor.isSaved == true
                            ? AppColors.whiteColor
                            : AppColors.darkGreyColor,
                        size: 22,
                      ),
                    );
                  })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Range',
                        style: GoogleFonts.montserrat(
                          color: AppColors.darkGreyColor,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '₹25L – ₹2Cr',
                        style: GoogleFonts.montserrat(
                            color: AppColors.whiteColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stage',
                        style: GoogleFonts.montserrat(
                          color: AppColors.darkGreyColor,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'Seed – Series A',
                        style: GoogleFonts.montserrat(
                            color: AppColors.whiteColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.blackColor,
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(
                                    color: const Color(0xFF292929), width: 1),
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
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      controller?.InvestorDetails();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View Profile',
                          style: GoogleFonts.montserrat(
                            color: AppColors.whiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.whiteColor,
                          size: 18,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
          // ... rest of your existing UI
        ],
      );
    }
}
