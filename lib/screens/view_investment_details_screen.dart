import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/view_investment_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';

class ViewInvestmentDetailsScreen extends StatelessWidget {
  const ViewInvestmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ViewInvestmentDetailsController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: AppColors.blackColor,
              body: SafeArea(
                  child: Column(children: [
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
                      const SizedBox(width: 12),
                      const Text(
                        'Investment Details',
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(
                        24,
                        10,
                        24,
                        30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(
                              19,
                              19,
                              19,
                              20,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF111111),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFF252525),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Logo
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'N',
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 13),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              controller.companyName,
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            const Icon(
                                              Icons.verified,
                                              color: Color(0xFF4A9FFF),
                                              size: 14,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '${controller.industry} · ${controller.stage} · ${controller.location}',
                                          style: GoogleFonts.montserrat(
                                            color: const Color(0xFF858585),
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 17),
                                Container(
                                  height: 1,
                                  color: const Color(0xFF252525),
                                ),
                                const SizedBox(height: 17),
                                Text(
                                  controller.description,
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xFFD0D0D0),
                                    fontSize: 13,
                                    height: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(
                              19,
                              19,
                              19,
                              20,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF111111),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFF252525),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Investment Overview',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _overviewValue(
                                        'INVESTED',
                                        controller.invested,
                                      ),
                                    ),
                                    Expanded(
                                      child: _overviewValue(
                                        'OWNERSHIP',
                                        controller.ownership,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  height: 1,
                                  color: const Color(0xFF252525),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _overviewValue(
                                        'CURRENT VALUATION',
                                        controller.currentValuation,
                                      ),
                                    ),
                                    Expanded(
                                      child: _overviewValue(
                                        'RETURNS (UNREALISED)',
                                        controller.returns,
                                        valueColor: Colors.white,
                                        bottomText: controller.returnPercentage,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  height: 1,
                                  color: const Color(0xFF252525),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _overviewValue(
                                        'INVESTED ON',
                                        controller.investedOn,
                                      ),
                                    ),
                                    Expanded(
                                      child: _overviewValue(
                                        'ROUND',
                                        controller.round,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(
                              19,
                              19,
                              19,
                              18,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF111111),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFF252525),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Valuation Trend',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 9,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF09291F),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Text(
                                        '↗ +20.8%',
                                        style: GoogleFonts.montserrat(
                                          color: const Color(0xFF1DD39D),
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // SizedBox(
                                //   height: 130,
                                //   width: double.infinity,
                                //   child: CustomPaint(
                                //     painter: ValuationChartPainter(),
                                //   ),
                                // ),

                                const SizedBox(height: 8),

                                Container(
                                  height: 34,
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: controller.periods.map(
                                      (period) {
                                        return Expanded(
                                          child: Obx(
                                            () {
                                              final selected = controller
                                                      .selectedPeriod.value ==
                                                  period;

                                              return GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .changePeriod(period);
                                                },
                                                child: AnimatedContainer(
                                                  duration: const Duration(
                                                    milliseconds: 150,
                                                  ),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: selected
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18),
                                                  ),
                                                  child: Text(
                                                    period,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: selected
                                                          ? Colors.black
                                                          : const Color(
                                                              0xFF777777),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Latest Updates',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 13),
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                padding: const EdgeInsets.fromLTRB(
                                  19,
                                  12,
                                  19,
                                  12,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF111111),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: const Color(0xFF252525),
                                  ),
                                ),
                                child: Column(
                                  children: List.generate(
                                    controller.updates.length,
                                    (index) {
                                      final update = controller.updates[index];

                                      return Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Icon(
                                                  Icons.circle,
                                                  color: AppColors.whiteColor,
                                                  size: 5,
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      update.date,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color: const Color(
                                                            0xFF686868),
                                                        fontSize: 9,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      update.text,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color: const Color(
                                                            0xFFD0D0D0),
                                                        fontSize: 11,
                                                        height: 1.4,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (index !=
                                              controller.updates.length - 1)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 11,
                                              ),
                                              child: Container(
                                                height: 1,
                                                color: const Color(0xFF252525),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Documents',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 13),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF111111),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: const Color(0xFF252525),
                                  ),
                                ),
                                child: Column(
                                  children: List.generate(
                                    controller.documents.length,
                                    (index) {
                                      final document =
                                          controller.documents[index];

                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: 66,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 34,
                                                  height: 34,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .containerBackgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    border: Border.all(
                                                      color: AppColors
                                                          .containerBorderColor,
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    Icons.description_outlined,
                                                    color: AppColors.whiteColor,
                                                    size: 17,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        document.title,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        document.details,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: const Color(
                                                              0xFF666666),
                                                          fontSize: 8,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.downloadDocument(
                                                        document);
                                                  },
                                                  child: Icon(
                                                    Icons.download,
                                                    color: AppColors.whiteColor,
                                                    size: 22,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (index !=
                                              controller.documents.length - 1)
                                            Container(
                                              height: 1,
                                              color: const Color(0xFF252525),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      )),
                )
              ])));
        });
  }
}

Widget _overviewValue(
  String title,
  String value, {
  Color valueColor = Colors.white,
  String? bottomText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.montserrat(
          color: const Color(0xFF777777),
          fontSize: 8,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        value,
        style: GoogleFonts.montserrat(
          color: valueColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      if (bottomText != null) ...[
        const SizedBox(height: 4),
        Text(
          bottomText,
          style: GoogleFonts.montserrat(
            color: const Color(0xFF19C996),
            fontSize: 9,
          ),
        ),
      ],
    ],
  );
}
