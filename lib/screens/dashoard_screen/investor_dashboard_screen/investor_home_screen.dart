import 'package:exit_app/api_utils/app_formatters.dart';
import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/chat_controller.dart';
import 'package:exit_app/controller/investor_dashboard_controller.dart';
import 'package:exit_app/screens/last_visited_screen.dart';
import 'package:exit_app/screens/need_your_attention_screen.dart';
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
                                        GestureDetector(
                                          onTap: (){
                                            Get.to(
                                                  () => ViewAllNeedsAttentionScreen(
                                                items: homeController.needsAttentionList,
                                                onOpenConversation: (item) {
                                                  if (Get.isRegistered<ChatController>()) {
                                                    Get.delete<ChatController>();
                                                  }
                                                  Get.to(
                                                        () => ChatScreen(
                                                      recipientId: item.founderId,
                                                      recipientName: item.founderName,
                                                      currentUserId: homeController.currentUserId,
                                                      conversationId: item.conversationId,
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'View all (${homeController.needsAttentionList.length})',
                                            style: GoogleFonts.montserrat(
                                              color: const Color(0xFF858585),
                                              fontSize: 12,
                                            ),
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
                                                        if (Get.isRegistered<ChatController>()) {
                                                          Get.delete<ChatController>();
                                                        }     Get.to(() => ChatScreen(
                                                          recipientId: item.founderId,
                                                          recipientName: item.founderName,
                                                          currentUserId: homeController.currentUserId,
                                                          conversationId: item.conversationId,));
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
                              Obx(()=> homeController.founderList.isNotEmpty ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ListView.builder(
                                      itemCount: homeController.founderList.length == 1 ? 1:2,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final  fundingData = homeController.founderList[index];
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
                                                              fundingData.companyName,
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
                                                          '${fundingData.industry} · ${fundingData.stage.toUpperCase()} · ${fundingData.location}',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color:
                                                            const Color(0xFF858585),
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: fundingData.isLoading
                                                        ? null
                                                        : () => homeController.toggleSavedFounder(fundingData),
                                                    child: fundingData.isLoading
                                                        ? const SizedBox(
                                                      width: 15,
                                                      height: 15,
                                                      child: CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF777777)),
                                                      ),
                                                    )
                                                        : Icon(
                                                      fundingData.isSaved
                                                          ? Icons.bookmark_rounded
                                                          : Icons.bookmark_border_rounded,
                                                      size: 21,
                                                      color: fundingData.isSaved ? Colors.white : const Color(0xFF777777),
                                                    ),
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
                                                      fundingData.raiseDescription,
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
                                                          const Color(0xFF858585),
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        formatIndianShortCurrency(fundingData.fundingGoal),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.white,
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
                                                                color: const Color(
                                                                    0xFF777777),
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 7),
                                                            Text(
                                                              fundingData.stage.toUpperCase(),
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
                                                                color: const Color(
                                                                    0xFF777777),
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 7),
                                                            Text(
                                                              formatFundingTimeline(fundingData.fundingTimeline),
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
                                                    homeController.clickFounderDetails(fundingData);
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
                                ],
                              ):const SizedBox(),),
                             homeController.lastVisitedList.isNotEmpty ?
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
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
                                         GestureDetector(
                                           onTap: (){
                                             Get.to(ViewAllLastVisitedScreen(items: homeController.lastVisitedList,));
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
                                     const SizedBox(
                                       height: 20,
                                     ),
                                     ListView.builder(
                                         itemCount: homeController.lastVisitedList.length == 1 ? 1:2,
                                         shrinkWrap: true,
                                         physics: const NeverScrollableScrollPhysics(),
                                         itemBuilder: (context, index) {
                                         final lastVisitItem = homeController.lastVisitedList[index];
                                           return Container(
                                             margin:
                                             const EdgeInsets.symmetric(vertical: 12),
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
                                                                       lastVisitItem.companyName,
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
                                                                 '${lastVisitItem.industry} · ${lastVisitItem.stage.toUpperCase()} · ${lastVisitItem.location}',
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
                                                              formatIndianShortCurrency(lastVisitItem.fundingGoal),
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
                                                                 formatAddedTime(lastVisitItem.createdAt),
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
                                 ):const SizedBox()
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

