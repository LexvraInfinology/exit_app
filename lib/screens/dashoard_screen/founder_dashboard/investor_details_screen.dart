import 'package:exit_app/common_widgets/founder_dashboard_header_widget.dart';
import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/founder_dashboard_controller.dart';
import 'package:exit_app/controller/investor_details_controller.dart';
import 'package:exit_app/screens/chat_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';
import '../../../models/get_investor_list_model.dart';

class InvestorDetailsScreen extends StatelessWidget {
  Results? result;

  InvestorDetailsScreen(this.result, {super.key});

  static const tags = ['SaaS', 'FinTech', 'B2B', 'AI / ML'];

  List companyList = [
    {
      'company_name': 'Northstar Ventures',
      'company_type': 'FinTech',
      'company_logo': 'FC',
    },
    {
      'company_name': 'FlowWorks',
      'company_type': 'B2B SaaS',
      'company_logo': 'FW',
    },
    {
      'company_name': 'Kredity',
      'company_type': 'SaaS',
      'company_logo': 'K',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvestorDetailsController>(
        init: InvestorDetailsController(),
        builder: (detailsController) {
          return Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SafeArea(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0,right: 24.0,bottom: 10.0),
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
                      const Spacer(),

                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: AppColors.blackColor,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                        color: AppColors.lightGreyColor),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'V',
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.whiteColor,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              '${result?.firstName.toString()} ${result?.lastName.toString()}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                color: AppColors.whiteColor,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          const Icon(
                                            Icons.verified,
                                            color: AppColors.verifiedColor,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '₹ ${result?.preferred_investment.toString()}/- · ${result?.currentLocation.toString()} · India',
                                        style: GoogleFonts.montserrat(
                                            color: AppColors.darkGreyColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${result?.preferred_industries.toString()}',
                                        style: GoogleFonts.montserrat(
                                            color: AppColors.darkGreyColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Text(
                            //   'Early-stage investor backing ambitious technology founders.',
                            //   maxLines: 3,
                            //   overflow: TextOverflow.ellipsis,
                            //   style: GoogleFonts.montserrat(
                            //     color: AppColors.darkGreyColor,
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: AppColors.containerBackgroundColor,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: AppColors.containerBorderColor),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '₹ ${result!.preferred_investment.toString()}/-',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.whiteColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Typical Investment',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                              color: AppColors.darkGreyColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${result?.preferred_stage.toString()}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.whiteColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Stage',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                              color: AppColors.darkGreyColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          result?.total_investment_count == 0 ||
                                                  result?.total_investment_count ==
                                                      null
                                              ? '0'
                                              : '${result?.total_investment_count.toString()}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.whiteColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Investments',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                              color: AppColors.darkGreyColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 55,
                              width: MediaQuery.sizeOf(context).width,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(() => ChatDetailsScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                child: Text(
                                  'Connect',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'About',
                              style: GoogleFonts.montserrat(
                                  color: AppColors.darkGreyColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              result!.bio.toString(),
                              style: GoogleFonts.montserrat(
                                color: AppColors.darkGreyColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     Text(
                            //       'Read more',
                            //       style: GoogleFonts.montserrat(
                            //           color: AppColors.darkGreyColor,
                            //           fontSize: 14,
                            //           fontWeight: FontWeight.w500),
                            //     ),
                            //     const SizedBox(width: 5),
                            //     const Icon(
                            //       Icons.keyboard_arrow_down_rounded,
                            //       color: AppColors.darkGreyColor,
                            //       size: 22,
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(height: 20),
                            // Text(
                            //   'Investment Focus',
                            //   style: GoogleFonts.montserrat(
                            //     color: Color(0xFF969696),
                            //     fontSize: 13,
                            //     fontWeight: FontWeight.w600,
                            //     letterSpacing: .2,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 30,
                            //   child: ListView.builder(
                            //       itemCount: tags.length,
                            //       scrollDirection: Axis.horizontal,
                            //       itemBuilder: (context, index) {
                            //         return Container(
                            //           margin: const EdgeInsets.symmetric(
                            //               horizontal: 5),
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 6),
                            //           alignment: Alignment.center,
                            //           decoration: BoxDecoration(
                            //             color: AppColors.blackColor,
                            //             borderRadius: BorderRadius.circular(11),
                            //             border: Border.all(
                            //                 color: const Color(0xFF292929),
                            //                 width: 1),
                            //           ),
                            //           child: Text(
                            //             'Saas',
                            //             style: GoogleFonts.montserrat(
                            //                 color: AppColors.darkGreyColor,
                            //                 fontSize: 12,
                            //                 fontWeight: FontWeight.w500),
                            //           ),
                            //         );
                            //       }),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF1111),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0xFF272727)),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 56,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Fund Type',
                                            style: GoogleFonts.montserrat(
                                              color: Color(0xFF777777),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            result?.fund_type == null ||
                                                    result?.fund_type == ''
                                                ? '-'
                                                : '${result?.fund_type.toString()}',
                                            style: GoogleFonts.montserrat(
                                              color: Color(0xFFE0E0E0),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Color(0xFF272727),
                                  ),
                                  SizedBox(
                                    height: 56,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Founded',
                                            style: GoogleFonts.montserrat(
                                              color: Color(0xFF777777),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            result?.founded == null
                                                ? '-'
                                                : result!.founded.toString(),
                                            style: GoogleFonts.montserrat(
                                              color: Color(0xFFE0E0E0),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                Text(
                                  'Investment Portfolio',
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.darkGreyColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        'View All',
                                        style: GoogleFonts.montserrat(
                                            color: AppColors.darkGreyColor,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        Icons.arrow_forward_rounded,
                                        color: Color(0xFF777777),
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: companyList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      detailsController
                                          .clickInvestmentDetails();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Container(
                                        height: 66,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF11111),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          border: Border.all(
                                              color: Color(0xFF272727)),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xFF303030)),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                companyList[index]
                                                            ['company_logo']
                                                        ?.toString() ??
                                                    '',
                                                style: const TextStyle(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 13),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  companyList[index]
                                                              ['company_name']
                                                          ?.toString() ??
                                                      '',
                                                  style: const TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  companyList[index]
                                                              ['company_type']
                                                          .toString() ??
                                                      '',
                                                  style: const TextStyle(
                                                    color: Color(0xFF777777),
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ]),
                    ),
                  ),
                )
              ],
            )),
          );
        });
  }
}
