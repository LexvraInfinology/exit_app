import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
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
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                MarketplaceIndustry(id: "1", name: "Pre-Seed"),
                                MarketplaceIndustry(id: "2", name: "Seed"),
                                MarketplaceIndustry(id: "3", name: "Series A"),
                                MarketplaceIndustry(id: "4", name: "Series B")
                              ],
                            ),
                            const SizedBox(width: 8),
                            FilterButtonWidget(
                              context: context,
                              text: 'Sector',
                              showArrow: true,
                              options: [
                                MarketplaceIndustry(id: "1", name: "SaaS"),
                                MarketplaceIndustry(id: "2", name: "FinTech"),
                                MarketplaceIndustry(id: "3", name: "AI / ML"),
                                MarketplaceIndustry(id: "4", name: "HealthTech")
                              ],
                            ),
                            const SizedBox(width: 8),
                            FilterButtonWidget(
                              context: context,
                              text: 'Under ₹25L',
                              showArrow: true,
                              options: [
                                MarketplaceIndustry(
                                    id: "1", name: "Under ₹25L"),
                                MarketplaceIndustry(id: "2", name: "₹25L–₹50L"),
                                MarketplaceIndustry(id: "3", name: "₹50L–₹1Cr"),
                                MarketplaceIndustry(id: "4", name: "₹1Cr–₹5Cr")
                              ],
                            ),
                            const SizedBox(width: 8),
                            FilterButtonWidget(
                              context: context,
                              text: 'India',
                              showArrow: true,
                              options: [
                                MarketplaceIndustry(id: "1", name: "India"),
                                MarketplaceIndustry(id: "2", name: "Delhi NCR"),
                                MarketplaceIndustry(id: "3", name: "Mumbai"),
                                MarketplaceIndustry(id: "4", name: "Bengaluru")
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
                                  controller.InvestorDetails(controller.investorList[index]);
                                },
                                child: Container(
                                  width: double.infinity,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: AppColors.blackColor,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: const Color(0xFF292929),
                                      width: 1,
                                    ),
                                  ),
                                  child: InvestorWidget(
                                    name:
                                        '${investor.firstName ?? ''} ${investor.lastName ?? ''}'
                                            .trim(),
                                    type: investor.preferred_industries ?? '',
                                    location: investor.currentLocation ?? '',
                                    investment: investor.preferred_investment
                                        .toString(),
                                    // replace with your API field
                                    stage: investor.preferred_stage ?? '',
                                    logo: investor.firstName?.isNotEmpty == true
                                        ? investor.firstName![0].toUpperCase()
                                        : '',
                                    investor: investor,
                                    controller: controller,
                                  ),
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

  Widget InvestorWidget({
    required String name,
    required String type,
    required String location,
    required String investment,
    required String stage,
    required String logo,
    required Results investor,
    required FounderDashboardController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                border: Border.all(
                  color: const Color(0xFF292929),
                  width: 1,
                ),
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
                    location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            investor.isSaved ?? false
                ? GestureDetector(
                    onTap: () {
                      controller.clickRemoveApi(
                        investor.id.toString(),
                      );
                    },
                    child: const Icon(
                      Icons.bookmark,
                      color: AppColors.whiteColor,
                      size: 22,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      controller.clickSavedApi(
                        investor.id.toString(),
                      );
                    },
                    child: const Icon(
                      Icons.bookmark_border,
                      color: Color(0xFF777777),
                      size: 22,
                    ),
                  ),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Typical Investment',
                    style: GoogleFonts.montserrat(
                        color: AppColors.darkGreyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    investment.isEmpty ? '-' : '₹ ${investment}/-',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      color: AppColors.whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stage',
                    style: GoogleFonts.montserrat(
                      color: AppColors.darkGreyColor,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    stage.isEmpty ? '-' : stage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      color: AppColors.whiteColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(
                          color: const Color(0xFF292929),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        type.isEmpty ? '-' : type,
                        style: const TextStyle(
                          color: AppColors.darkGreyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),

            InkWell(
              onTap: () {
                controller.InvestorDetails(investor);
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
            ),
          ],
        ),
      ],
    );
  }
}
