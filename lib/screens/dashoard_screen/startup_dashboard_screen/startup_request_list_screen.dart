import 'package:exit_app/controller/startUp_dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_color.dart';

class StartUpRequestListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartUpDashBoardController>(builder: (controller){
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
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      controller.clickFundingRequestButton(context);
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
                                  'Create Funding\nRequest',
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.blackColor,
                                    fontSize: 19,
                                    height: 1.05,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Start a new raise and connect with\ninvestors.',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF888888),
                                    fontSize: 12,
                                    height: 1.3,
                                  ),
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
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'All Requests',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF8A8A8A),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF8A8A8A),
                            size: 18,
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
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF111111),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF292929),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
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
                              // Logo
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDCE9ED),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.business_center_outlined,
                                    size: 17,
                                    color: Color(0xFF87999E),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 9),

                              // Company info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'NovaNest',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 6),

                                        // Published badge
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 7,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF063D27),
                                            borderRadius:
                                            BorderRadius.circular(5),
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
                                    const SizedBox(height: 3),
                                    const Text(
                                      'FinTech • Seed • Bengaluru',
                                      style: TextStyle(
                                        color: Color(0xFF777777),
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // More button
                              const Icon(
                                Icons.more_vert,
                                color: Color(0xFF777777),
                                size: 17,
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
                                      '₹75L',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Funding Goal',
                                      style: const TextStyle(
                                        color: Color(0xFF777777),
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1–3 Mo',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Timeline',
                                    style: const TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
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
                                    'Seed',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Stage',
                                    style: const TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),

                          const SizedBox(height: 14),

                          // Divider
                          Container(
                            height: 1,
                            color: const Color(0xFF242424),
                          ),

                          const SizedBox(height: 11),

                          Row(
                            children: [
                              // Views
                              const Icon(
                                Icons.visibility_outlined,
                                size: 12,
                                color: Color(0xFF888888),
                              ),

                              const SizedBox(width: 4),

                              const Text(
                                '32',
                                style: TextStyle(
                                  color: Color(0xFFBBBBBB),
                                  fontSize: 8,
                                ),
                              ),

                              const SizedBox(width: 3),

                              const Text(
                                'Views',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 8,
                                ),
                              ),

                              const SizedBox(width: 12),

                              // Interested
                              const Icon(
                                Icons.person_outline,
                                size: 12,
                                color: Color(0xFF888888),
                              ),

                              const SizedBox(width: 4),

                              const Text(
                                '4',
                                style: TextStyle(
                                  color: Color(0xFFBBBBBB),
                                  fontSize: 8,
                                ),
                              ),

                              const SizedBox(width: 3),

                              const Text(
                                'Interested',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 8,
                                ),
                              ),

                              const Spacer(),
                              GestureDetector(
                                onTap: (){
                                  controller.clickPostDetails();
                                },
                                child: Row(
                                  children: const [
                                    Text(
                                      'View Request',
                                      style: TextStyle(
                                        color: Color(0xFFE6E6E6),
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 12,
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ],
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