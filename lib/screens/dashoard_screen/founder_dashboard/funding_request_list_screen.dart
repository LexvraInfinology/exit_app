import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/founder_dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FundingRequestListScreen extends StatelessWidget {
  const FundingRequestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FounderDashboardController>(builder: (fundingController) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 25, 24, 0),
              child: Column(
                children: [
                  Text(
                    'Funding Requests',
                    style: GoogleFonts.montserrat(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      fundingController.clickFundingRequestButton(context);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: const BoxDecoration(
                              color: AppColors.blackColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create Funding Request',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.blackColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Start a new raise and connect with investors.',
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.darkGreyColor,
                                      fontSize: 14,
                                      height: 1.3,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Funding Requests',
                        style: GoogleFonts.montserrat(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'All Requests',
                            style: GoogleFonts.montserrat(
                                color: AppColors.darkGreyColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF8A8A8A),
                            size: 22,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: fundingController.createFundsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.containerBackgroundColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.containerBorderColor,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.25),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDCE9ED),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.business_center_outlined,
                                    size: 22,
                                    color: AppColors.darkGreyColor,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10),

                              // Company info
                              Expanded(
                                child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          fundingController
                                              .createFundsList[index]
                                              .companyName
                                              .toString(),
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.whiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 7,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.greenColor
                                                .withOpacity(0.30),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            'Published',
                                            style: GoogleFonts.montserrat(
                                              color: AppColors.greenColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      '${fundingController.createFundsList[index].stage} . ${fundingController.createFundsList[index].location}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              PopupMenuButton<String>(
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: AppColors.darkGreyColor,
                                  size: 24,
                                ),
                                color: AppColors.containerBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                onSelected: (value) {
                                  if (value == 'edit') {
                                    fundingController.editPostOrDeletePost(
                                        index, 'FundRaise', 'edit');
                                  } else if (value == 'delete') {
                                    fundingController.editPostOrDeletePost(
                                        index, 'SellCompany', 'delete');
                                  }
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem<String>(
                                    value: 'edit',
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.edit_outlined,
                                          size: 24,
                                          color: AppColors.whiteColor,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Edit',
                                          style: GoogleFonts.montserrat(
                                              color: AppColors.whiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'delete',
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.delete_outline,
                                          size: 24,
                                          color: AppColors.whiteColor,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Delete',
                                          style: GoogleFonts.montserrat(
                                              color: AppColors.whiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '₹${fundingController.createFundsList[index].fundingGoal}',
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.whiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Funding Goal',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.darkGreyColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fundingController.createFundsList[index].stage.toString(),
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.whiteColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Stage',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.darkGreyColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                          const SizedBox(height: 16),
                          Container(
                            height: 1.5,
                            color: AppColors.containerBorderColor,
                          ),
                          const SizedBox(height: 11),
                          Row(
                            children: [
                              const Icon(
                                Icons.visibility_outlined,
                                size: 22,
                                color: AppColors.darkGreyColor,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                fundingController.createFundsList[index].viewsCount.toString(),
                                style: GoogleFonts.montserrat(
                                    color: AppColors.whiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Views',
                                style: GoogleFonts.montserrat(
                                    color: AppColors.darkGreyColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 12),
                              const Icon(
                                Icons.person_outline,
                                size: 24,
                                color: AppColors.darkGreyColor,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                fundingController.createFundsList[index].interestedCount.toString(),
                                style: GoogleFonts.montserrat(
                                    color: AppColors.whiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                'Interested',
                                style: GoogleFonts.montserrat(
                                    color: AppColors.darkGreyColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  fundingController.clickPostDetails();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'View Request',
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      const Icon(
                                        Icons.arrow_forward,
                                        size: 22,
                                        color: AppColors.whiteColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ]),
        ),
      );
    });
  }
}
