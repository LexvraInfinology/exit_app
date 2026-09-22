import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/investor_dashboard_controller.dart';
import 'package:exit_app/screens/new_chat_screen.dart';
import 'package:exit_app/screens/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';

class InvestorHomeScreen extends StatelessWidget {
  const InvestorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvestorDashboardController>(builder: (homeController) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
            child: homeController.isLoading.value
                ? const Center(
                    child: CupertinoActivityIndicator(
                    radius: 15,
                    color: Colors.white,
                  ))
                : Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.dashboardIcon,
                                width: 32,
                                height: 32,
                              ),
                              const SizedBox(width: 2),
                              const Text(
                                'EXIT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const NotificationScreen());
                                },
                                child: Container(
                                  width: 42,
                                  height: 42,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                  ),
                                  child: const Icon(
                                    Icons.notifications_none_rounded,
                                    color: Colors.white,
                                    size: 29,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  homeController.selectedIndex.value = 4;
                                },
                                child: Container(
                                  width: 38,
                                  height: 38,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF292929),
                                  ),
                                  child: const Text(
                                    'AM',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 0),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 58,
                          decoration: BoxDecoration(
                            color: const Color(0xFF111111),
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(
                              color: AppColors.darkGreyColor,
                              width: 1,
                            ),
                          ),
                          child: const Row(
                            children: [
                              SizedBox(width: 20),
                              Icon(
                                Icons.search_rounded,
                                size: 21,
                                color: Colors.white,
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Search Conversations',
                                style: TextStyle(
                                  color: Color(0xFFB8B8B8),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                homeController.needsAttentionList.isNotEmpty ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Needs your attention',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'View all (2)',
                                          style: GoogleFonts.montserrat(
                                            color: const Color(0xFF858585),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ):const SizedBox(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF111111),
                                    borderRadius: BorderRadius.circular(17),
                                    border: Border.all(
                                      color: const Color(0xFF292929),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      homeController.needsAttentionList.isNotEmpty ?
                                      ListView.builder(
                                        itemCount: homeController.needsAttentionList.length == 1 ? 1:2,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          final item = homeController.needsAttentionList[index];
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(16, 17, 16, 18),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      item.founderName,
                                                      style: GoogleFonts.montserrat(
                                                        fontSize: 14,
                                                        color: AppColors.whiteColor,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Container(
                                                      width: 11,
                                                      height: 11,
                                                      decoration: const BoxDecoration(
                                                        color: Color(0xFF4A9EFF),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Icon(
                                                        Icons.check,
                                                        size: 7,
                                                        color: AppColors.whiteColor,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // homeController.clickChatItem();
                                                        Get.to(() => ChatScreen(
                                                          recipientId: item.founderId,
                                                          recipientName: item.founderName,
                                                          currentUserId: null));
                                                      },
                                                      child: Text(
                                                        'Open conversation ›',
                                                        style: GoogleFonts.montserrat(
                                                          fontSize: 11,
                                                          color: AppColors.whiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 9),
                                                Text(
                                                  'Founder replied · ${timeAgo(item.latestMessageTime)}',
                                                  style: GoogleFonts.montserrat(
                                                    color: const Color(0xFF777777),
                                                    fontSize: 11,
                                                  ),
                                                ),
                                                const SizedBox(height: 13),
                                                Text(
                                                  item.latestMessage,
                                                  style: GoogleFonts.montserrat(
                                                    color: const Color(0xFF858585),
                                                    fontSize: 14,
                                                    height: 1.55,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ):SizedBox()
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: homeController.needsAttentionList.isNotEmpty ? 20:0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Matched to your thesis',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.2,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        homeController.selectedIndex.value = 1;
                                      },
                                      child: Text(
                                        'View all →',
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFF858585),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Opportunities that match your preferences.',
                                  style: TextStyle(
                                    color: AppColors.darkGreyColor,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListView.builder(
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 20, 19),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF111111),
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          border: Border.all(
                                            color: const Color(0xFF292929),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 48,
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF1B1B1B),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xFF303030),
                                                    ),
                                                  ),
                                                  child: const Icon(
                                                    Icons.spa_rounded,
                                                    color: Color(0xFF8B5CF6),
                                                    size: 25,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'NovaNest',
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              fontSize: 17,
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 6),
                                                          Container(
                                                            width: 11,
                                                            height: 11,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0xFF4A9EFF),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: const Icon(
                                                              Icons.check,
                                                              size: 7,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        'FinTech · Seed · Bengaluru',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color:
                                                              Color(0xFF858585),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.bookmark_border_rounded,
                                                  size: 22,
                                                  color: Color(0xFF858585),
                                                ),
                                              ],
                                            ),

                                            const SizedBox(height: 23),

                                            // Description + raising
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'FinTech platform helping SMEs manage payments & cash flow.',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: Color(0xFF858585),
                                                      fontSize: 14,
                                                      height: 1.45,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'Raising',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color:
                                                            Color(0xFF858585),
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      '₹75L',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                            const SizedBox(height: 23),

                                            // Phase box
                                            Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFF242424),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 16,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Phase',
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color: Color(
                                                                  0xFF777777),
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 7),
                                                          Text(
                                                            'Seed',
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    fontSize:
                                                                        12,
                                                                    color: AppColors
                                                                        .whiteColor),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: 35,
                                                    color:
                                                        const Color(0xFF252525),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 16,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Closes in',
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color: Color(
                                                                  0xFF777777),
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 7),
                                                          Text(
                                                            '1–3 months',
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    fontSize:
                                                                        12,
                                                                    color: AppColors
                                                                        .whiteColor),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            const SizedBox(height: 23),

                                            // Button
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              height: 41,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  homeController
                                                      .clickFounderDetails();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.whiteColor,
                                                  foregroundColor:
                                                      AppColors.blackColor,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                ),
                                                child: Text(
                                                  'View Opportunity',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'New since you last visited',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.2,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'View all →',
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xFF858585),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ListView.builder(
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 12),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF111111),
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          border: Border.all(
                                            color: const Color(0xFF292929),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 81,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xFF303030),
                                                        ),
                                                      ),
                                                      child: const Icon(
                                                        Icons.bolt_rounded,
                                                        size: 19,
                                                        color: Colors.white,
                                                      ),
                                                    ),

                                                    const SizedBox(width: 11),

                                                    // LEFT CONTENT
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                  'CloudXcel',
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    fontSize:
                                                                        14,
                                                                    color: AppColors
                                                                        .whiteColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 6),
                                                              Container(
                                                                width: 11,
                                                                height: 11,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xFF4A9EFF),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    const Icon(
                                                                  Icons.check,
                                                                  size: 7,
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              height: 4),
                                                          Text(
                                                            'HealthTech · Series A · Delhi',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color: const Color(
                                                                  0xFF858585),
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    const SizedBox(width: 10),

                                                    // RIGHT CONTENT
                                                    SizedBox(
                                                      width: 65,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            '₹1.5Cr',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Text(
                                                            'Added 2h ago',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color: const Color(
                                                                  0xFF777777),
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    const SizedBox(width: 10),

                                                    const Icon(
                                                      Icons
                                                          .bookmark_border_rounded,
                                                      size: 21,
                                                      color: Color(0xFF777777),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    })
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
}

String timeAgo(String? dateString) {
  if (dateString == null || dateString.trim().isEmpty) {
    return '';
  }

  try {
    final dateTime = DateTime.parse(dateString).toLocal();
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.isNegative) {
      return 'Just now';
    }

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    }

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours} hr ago';
    }

    if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    }

    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  } catch (e) {
    debugPrint('❌ INVALID DATE RECEIVED: "$dateString"');
    debugPrint('❌ DATE ERROR: $e');
    return '';
  }
}