import 'package:exit_app/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_images.dart';
import '../controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  final int recipientId;
  final String recipientName;
  final int? currentUserId;
  final String? conversationId;

  const ChatScreen({
    super.key,
    required this.conversationId,
    required this.recipientId,
    required this.recipientName,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ChatController(recipientId: recipientId, conversationId: conversationId,),
    );
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
              ),
              child: Row(
                children: [
                  // Back button
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

                  const SizedBox(width: 15),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF151515),
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: Colors.white.withOpacity(.06),
                      ),
                    ),
                    child:  Center(
                      child: Text(
                        recipientName.isNotEmpty ? recipientName[0].toUpperCase() : '',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 13),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              recipientName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Obx(() => Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.connectionState.value ==
                                    ChatConnectionState.connected
                                    ? const Color(0xFF9B5CFF)
                                    : Colors.grey,
                              ),
                              child: const Icon(
                                Icons.check,
                                size: 7,
                                color: Colors.white,
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Phone
                  const Icon(
                    Icons.phone,
                    size: 19,
                    color: Colors.white,
                  ),

                  const SizedBox(width: 23),

                  // More
                  const Icon(
                    Icons.more_horiz,
                    size: 21,
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            Expanded(
              child: Obx(() {
                if (controller.isCreatingConnection.value ||
                    controller.connectionState.value == ChatConnectionState.connecting) {
                  return const Center(
                    child: CupertinoActivityIndicator(radius: 15,color: Colors.white),
                  );
                }

                if (controller.messages.isEmpty) {
                  return Center(
                    child: Text(
                      'No messages yet. Say hello!',
                      style: TextStyle(color: Colors.white.withOpacity(.45), fontSize: 13),
                    ),
                  );
                }
                return ListView.builder(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return Align(
                      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width * 0.72,
                        ),
                        decoration: BoxDecoration(
                          color: message.isMe ? Colors.white : const Color(0xFF171717),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          message.body,
                          style: TextStyle(
                            fontSize: 13,
                            color: message.isMe ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.attach_file,
                    size: 23,
                    color: Color(0xFF898989),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFF171717),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: TextField(
                        controller: controller.messageController,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => controller.sendMessage(),
                        decoration: InputDecoration(
                          hintText: 'Write a message...',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(.45),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 17,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 29),
                  GestureDetector(
                    onTap: controller.sendMessage,
                    child: Obx(() => Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: controller.isSending.value
                          ? const Padding(
                        padding: EdgeInsets.all(10),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                          : const Icon(
                        Icons.send,
                        size: 19,
                        color: Colors.black,
                      ),
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}