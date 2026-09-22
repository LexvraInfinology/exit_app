import 'package:exit_app/controller/chat_controller.dart';
import 'package:exit_app/controller/investor_dashboard_controller.dart';
import 'package:exit_app/models/founder_discovery_response.dart';
import 'package:exit_app/screens/new_chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_images.dart';
import '../../chat_details_screen.dart';

class FounderDetailsScreen extends StatelessWidget {
  FounderDetailsScreen({super.key, required this.founderProfile});

  final FounderProfile? founderProfile;
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
    if (!Get.isRegistered<InvestorDashboardController>()) {
      Get.put(InvestorDashboardController());
    }
    return GetBuilder<InvestorDashboardController>(
        builder: (founderDetailsController) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
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
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.bookmark_border,
                      color: Color(0xFF8A8A8A),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
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
                                color: const Color(0xFF111111),
                                borderRadius: BorderRadius.circular(11),
                                border:
                                    Border.all(color: AppColors.lightGreyColor),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                founderProfile != null ? founderProfile!.firstName[0].toUpperCase() : '',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.whiteColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w800,
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
                                          founderProfile != null ?  founderProfile!.firstName:"" ,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.whiteColor,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      founderProfile != null ? founderProfile!.isVerified ?  const Icon(
                                        Icons.verified_rounded,
                                        color: Color(0xFF777777),
                                        size: 14,
                                      ):const SizedBox():const SizedBox(),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Fintech · Bengaluru, India',
                                    style: GoogleFonts.montserrat(
                                      color: Color(0xFF858585),
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'SaaS     FinTech     B2B',
                                    style: GoogleFonts.montserrat(
                                      color: Color(0xFF969696),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFF111111),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Color(0xFF272727)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '₹25L',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.whiteColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Raising',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xFF707070),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 40),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '1 - 3 Months',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.whiteColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Timeline',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xFF707070),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 40,
                                color: AppColors.darkGreyColor,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'B2b SaaS',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.whiteColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Model',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xFF707070),
                                        fontSize: 10,
                                      ),
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
                          height: 50,
                          width: MediaQuery.sizeOf(context).width,
                          child: ElevatedButton(
                            onPressed: () {
                              if(founderProfile != null){
                                if (Get.isRegistered<ChatController>()) {
                                  Get.delete<ChatController>();
                                }
                                Get.to(() => ChatScreen(
                                  recipientId: founderProfile!.founderId,
                                  recipientName: founderProfile!.fullName,
                                  currentUserId: null,
                                  conversationId: null,));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              foregroundColor: AppColors.blackColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Text(
                              'Connect',
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
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
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          'Northstar Ventures partners with ambitious founders at the earliest stages, providing capital, mentorship and access to a strong network',
                          style: GoogleFonts.montserrat(
                            color: AppColors.darkGreyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Read more',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFF999999),
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color(0xFF777777),
                              size: 17,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Investment Focus',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF969696),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                              itemCount: tags.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.blackColor,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                        color: const Color(0xFF292929),
                                        width: 1),
                                  ),
                                  child: Text(
                                    'Saas',
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                                        'Funding Goal',
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFF777777),
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        '₹75L',
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
                                        'Funding Stage',
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFF777777),
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        'Seed',
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Business Snapshot',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF969696),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  width: 1, color: AppColors.darkGreyColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Revenue',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkGreyColor),
                                  ),
                                  Text(
                                    '₹1.2Cr',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                              Container(
                                color: AppColors.darkGreyColor,
                                width: 1,
                                height: 40,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Team',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkGreyColor),
                                  ),
                                  Text(
                                    '12',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                              Container(
                                color: AppColors.darkGreyColor,
                                width: 1,
                                height: 40,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Model',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkGreyColor),
                                  ),
                                  Text(
                                    'B2B',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Founder',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF969696),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: AppColors.darkGreyColor, width: 1)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 20),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: AppColors.darkGreyColor,
                                              width: 2,
                                            ),
                                            image: const DecorationImage(
                                              image: AssetImage(AppImages
                                                  .selectedProfileIcon),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Aarav Mehta',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.montserrat(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                const Icon(
                                                  Icons.verified_rounded,
                                                  color: AppColors.blueColor,
                                                  size: 14,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              'Founder & CEO',
                                              style: GoogleFonts.montserrat(
                                                color: Color(0xFF858585),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'View Profile',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              Icon(
                                                Icons.arrow_forward_rounded,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 10),
                                child: Text(
                                  '“Building financial tools that make business operations simpler for SMEs.',
                                  style: GoogleFonts.montserrat(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                      color: AppColors.darkGreyColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        )
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
