import 'package:exit_app/api_utils/app_formatters.dart';
import 'package:exit_app/controller/chat_controller.dart';
import 'package:exit_app/controller/investor_dashboard_controller.dart';
import 'package:exit_app/models/founder_discovery_response.dart';
import 'package:exit_app/screens/new_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_color.dart';
import '../../../constants/app_images.dart';

class FounderDetailsScreen extends StatelessWidget {
  const FounderDetailsScreen({super.key, required this.fundingData});

  final FundingRequest? fundingData;

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
                   Icon(
                    fundingData != null ?
                    fundingData!.isSaved ? Icons.bookmark:
                    Icons.bookmark_border:Icons.bookmark_border,
                    color: fundingData != null ? fundingData!.isSaved ?
                    Colors.white: const Color(0xFF8A8A8A):
                    const Color(0xFF8A8A8A),
                    size: 22,
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
                                fundingData != null ? fundingData!.companyName[0].toUpperCase() : '',
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
                                          fundingData != null ?  fundingData!.companyName:"" ,
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
                                      fundingData != null ? fundingData!.profile.isVerified ?  const Icon(
                                        Icons.verified_rounded,
                                        color: Color(0xFF777777),
                                        size: 14,
                                      ):const SizedBox():const SizedBox(),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                      fundingData != null ?  '${fundingData!.industry} · ${fundingData!.stage.toUpperCase()} · ${fundingData!.location}':"",
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xFF858585),
                                      fontSize: 13,
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
                            color: const Color(0xFF111111),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF272727)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                fundingData != null ? formatIndianShortCurrency(fundingData!.fundingGoal):"",
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
                                      fundingData != null ? formatFundingTimeline(fundingData!.fundingTimeline):"",
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
                              const Divider(
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
                              if(fundingData != null){
                                if (Get.isRegistered<ChatController>()) {
                                  Get.delete<ChatController>();
                                }
                                Get.to(() => ChatScreen(
                                  recipientId: fundingData!.profile.founderId,
                                  recipientName: fundingData!.profile.fullName,
                                  currentUserId: null,
                                  conversationId: null,
                                  fundingId: fundingData!.id,
                                  ));
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
                            fundingData != null ? fundingData!.companyDescription:"",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
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
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1111),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: const Color(0xFF272727)),
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
                                          color: const Color(0xFF777777),
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                          fundingData != null ? formatIndianShortCurrency(fundingData!.fundingGoal):"",
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
                                          fundingData != null ? fundingData!.stage.toUpperCase():"",
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
                                        'Funding Purpose',
                                        style: GoogleFonts.montserrat(
                                          color: const Color(0xFF777777),
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        fundingData != null ? fundingData!.purpose.toUpperCase():"",
                                        style: GoogleFonts.montserrat(
                                          color: const Color(0xFFE0E0E0),
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
                                                  fundingData != null ? fundingData!.profile.fullName:"",
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
                                                 if(fundingData != null && fundingData!.profile.isVerified)
                                                const Icon(
                                                  Icons.verified_rounded,
                                                  color: AppColors.blueColor,
                                                  size: 14,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                                fundingData != null ? fundingData!.profile.role.toUpperCase():"",
                                              style: GoogleFonts.montserrat(
                                                color: Color(0xFF858585),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            ProfilePopupCard.show(
                                              context,
                                              imageUrl: 'https://...',
                                              name: fundingData != null ? fundingData!.profile.fullName:"",
                                              location: '${fundingData != null ? fundingData!.profile.currentLocation:""} ${fundingData != null ? fundingData!.profile.preferredLocation:""}',
                                              quote: fundingData != null ? fundingData!.profile.bio:"",
                                              experience: fundingData != null ? fundingData!.profile.experience:"",
                                              industry: fundingData != null ? fundingData!.profile.preferredIndustries:"",
                                              role: fundingData != null ? fundingData!.profile.role.toUpperCase():"",
                                              isVerified: fundingData != null ? fundingData!.profile.isVerified:false,
                                            );
                                          },
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
                                        const SizedBox(
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
                                  fundingData != null ? fundingData!.profile.bio:"",
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


class ProfilePopupCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isVerified;
  final String location;
  final String quote;
  final String experience; // e.g. "6+ years"
  final String industry; // e.g. "FinTech"
  final String role; // e.g. "Founder"
  final VoidCallback? onClose;

  const ProfilePopupCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.quote,
    required this.experience,
    required this.industry,
    required this.role,
    this.isVerified = true,
    this.onClose,
  });

  static Future<void> show(
      BuildContext context, {
        required String imageUrl,
        required String name,
        required String location,
        required String quote,
        required String experience,
        required String industry,
        required String role,
        bool isVerified = true,
      }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.75),
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: ProfilePopupCard(
          imageUrl: imageUrl,
          name: name,
          location: location,
          quote: quote,
          experience: experience,
          industry: industry,
          role: role,
          isVerified: isVerified,
          onClose: () => Navigator.of(ctx).pop(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF262626)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TOP ROW: avatar + name/location + close button
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  imageUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 64,
                    height: 64,
                    color: const Color(0xFF262626),
                    child: const Icon(Icons.person, color: Colors.white54),
                  ),
                ),
              ),
              const SizedBox(width: 14),
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
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        if (isVerified) ...[
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.verified_rounded,
                            size: 18,
                            color: Color(0xFF3B9EFF),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 15,
                          color: Color(0xFF9A9A9A),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              color: const Color(0xFF9A9A9A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onClose,
                child: const Icon(
                  Icons.close_rounded,
                  size: 20,
                  color: Color(0xFF9A9A9A),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          // QUOTE
          Text(
            '"$quote"',
            style: GoogleFonts.montserrat(
              fontSize: 14.5,
              fontStyle: FontStyle.italic,
              height: 1.5,
              color: const Color(0xFFD8D8D8),
            ),
          ),

          const SizedBox(height: 20),
          Container(height: 1, color: const Color(0xFF262626)),
          const SizedBox(height: 20),

          // STATS ROW
          Row(
            children: [
              Expanded(
                child: _StatItem(
                  icon: Icons.work_outline_rounded,
                  value: experience,
                  label: 'Experience',
                ),
              ),
              Container(
                width: 1,
                height: 34,
                color: const Color(0xFF262626),
              ),
              Expanded(
                child: _StatItem(
                  icon: Icons.bar_chart_rounded,
                  value: industry,
                  label: 'Industry',
                ),
              ),
              Container(
                width: 1,
                height: 34,
                color: const Color(0xFF262626),
              ),
              Expanded(
                child: _StatItem(
                  icon: Icons.person_outline_rounded,
                  value: role,
                  label: 'Role',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: Colors.white),
        const SizedBox(height: 8),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 11,
            color: const Color(0xFF858585),
          ),
        ),
      ],
    );
  }
}

