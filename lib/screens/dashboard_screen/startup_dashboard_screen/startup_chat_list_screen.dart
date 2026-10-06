import 'package:exit_app/api_utils/app_formatters.dart';
import 'package:exit_app/controller/chat_controller.dart';
import 'package:exit_app/controller/startUp_dashboard_controller.dart';
import 'package:exit_app/screens/new_chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_color.dart';

class StartUpChatListScreen extends StatelessWidget{
  final bool first;

  const StartUpChatListScreen({
    super.key,
    this.first = false,
  });

  @override
  Widget build(BuildContext context) {
  return GetBuilder<StartUpDashBoardController>(builder: (controller){
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Message',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.whiteColor),
                ),
                const SizedBox(
                  height: 20,
                ),

                Container(
                  height: 59,
                  decoration: BoxDecoration(
                    color: const Color(0xFF111111),
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                      color: const Color(0xFF292929),
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 21,
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Search Conversations',
                        style: TextStyle(
                          color: Color(0xFFC5C5C5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        const SizedBox(
                          height: 20,
                        ),
                        // SizedBox(
                        //   height: 51,
                        //   child: ListView.separated(
                        //     padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: filters.length,
                        //     separatorBuilder: (_, __) =>
                        //         const SizedBox(width: 12),
                        //     itemBuilder: (context, index) {
                        //       final selected = controller.selectedFilter == index;
                        //
                        //       return GestureDetector(
                        //         onTap: () {
                        //           controller.selectedFilter = index;
                        //         },
                        //         child: AnimatedContainer(
                        //           duration: const Duration(milliseconds: 180),
                        //           padding:
                        //               const EdgeInsets.symmetric(horizontal: 20),
                        //           decoration: BoxDecoration(
                        //             color: selected
                        //                 ? const Color(0xFF18131F)
                        //                 : Colors.transparent,
                        //             borderRadius: BorderRadius.circular(22),
                        //             border: Border.all(
                        //               color: selected
                        //                   ? AppColors.whiteColor
                        //                   : const Color(0xFF292929),
                        //               width: 1,
                        //             ),
                        //           ),
                        //           alignment: Alignment.center,
                        //           child: Text(
                        //             filters[index],
                        //             style: TextStyle(
                        //               fontSize: 12.5,
                        //               color: selected
                        //                   ? Colors.white
                        //                   : const Color(0xFF77777D),
                        //               fontWeight: FontWeight.w400,
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Obx(()=> ListView.builder(
                                itemCount: controller.chats.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final conversation = controller.chats[index];
                                  return GestureDetector(
                                    onTap: () {
                                      if (Get.isRegistered<ChatController>()) {
                                        Get.delete<ChatController>();
                                      }
                                      Get.to(() => ChatScreen(
                                        recipientId: conversation.userId,
                                        recipientName: conversation.name,
                                        currentUserId: controller.currentUserId,
                                        conversationId: conversation.conversationId,));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: first ? 13 : 13,
                                        vertical: first ? 15 : 15,
                                      ),
                                      decoration: BoxDecoration(
                                          color: first
                                              ? const Color(0xFF111111)
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(
                                            color: const Color(0xFF292929),
                                            width: 1,
                                          )),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          // Avatar(
                                          //   type: conversation.avatarType,
                                          // ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        conversation.name,
                                                        maxLines: 1,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.5,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          letterSpacing: -0.3,
                                                        ),
                                                      ),
                                                    ),
                                                    if (true) ...[
                                                      const SizedBox(width: 3),
                                                      const Icon(
                                                        Icons.verified,
                                                        color: AppColors.whiteColor,
                                                        size: 11,
                                                      ),
                                                    ],
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  conversation.latestMessage,
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Color(0xFF707076),
                                                    fontSize: 14,
                                                    height: 1.2,
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                conversation.unreadCount != 0 ? timeAgo(conversation.latestMessageTime):"",
                                                style: TextStyle(
                                                  color: conversation.unreadCount != 0
                                                      ? AppColors.whiteColor
                                                      : const Color(0xFF6D6D73),
                                                  fontSize: 10.5,
                                                ),
                                              ),
                                              if (conversation.unreadCount > 0) ...[
                                                const SizedBox(height: 7),
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: const BoxDecoration(
                                                    color: AppColors.whiteColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    conversation.unreadCount.toString(),
                                                    style: const TextStyle(
                                                      color:AppColors.blackColor,
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  });
  }

}