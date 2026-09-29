import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/founder_dashboard_controller.dart';
import 'package:exit_app/models/create_fund_model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';

class ViewInvestorActivityListScreen extends StatelessWidget {
  List<InvestorActivity> investorActivity = <InvestorActivity>[];

  ViewInvestorActivityListScreen(this.investorActivity, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FounderDashboardController>(builder: (controller) {
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
                      Get.back();
                    },
                    child: Image.asset(
                      AppImages.backIcon,
                      width: 42,
                      height: 42,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Investor Visitor',
                      style: GoogleFonts.montserrat(
                        color: AppColors.whiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                ],
              ),
            ),
            ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: investorActivity.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: AppColors.darkGreyColor)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child:
                                    Image.asset(AppImages.createProfileImage)),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    investorActivity![index]
                                        .investorName
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor),
                                  ),

                                  Text(
                                    '${investorActivity[index].fundType} . ${investorActivity[index].location}',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.darkGreyColor),
                                  ),
                                ],
                              ),
                            ),
                            // Spacer(),
                            Column(
                              children: [
                                Text(
                                  'Interested',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.whiteColor),
                                ),
                                Text(
                                  '2h ago',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.darkGreyColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                })
          ],
        )),
      );
    });
  }
}
