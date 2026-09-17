import 'package:exit_app/controller/notification_list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_color.dart';
import '../constants/app_images.dart';
import '../controller/notification_controller.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotificationController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color(0xFF070809),
            body: SafeArea(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 24),
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
                          'Help & Support',
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
                      padding: const EdgeInsets.fromLTRB(24, 18, 24, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          const SectionTitle(title: 'Help'),
                          const SizedBox(height: 16),
                          const SupportCard(
                            items: [
                              SupportItem(
                                index: 0,
                                title: 'How EXIT Works',
                                subtitle: 'Understand how EXIT helps you raise',
                                expandedText:
                                    'EXIT helps you connect with investors and manage your fundraising journey.',
                              ),
                              SupportItem(
                                index: 1,
                                title: 'Discovering Founders',
                                subtitle:
                                    'Find startups that match your investment interests.',
                                expandedText:
                                    'You can explore founders and startups based on your investment preferences.',
                              ),
                              SupportItem(
                                index: 2,
                                title: 'Managing Investment Preferences',
                                subtitle: 'Update your preferred stage, industry',
                                expandedText:
                                    'Manage your investment preferences to discover more relevant opportunities.',
                              ),
                              SupportItem(
                                index: 3,
                                title: 'Connecting with Founders',
                                subtitle:
                                    'Interact with founders you’re interested in.',
                                expandedText:
                                    'Send connection requests and start conversations with founders.',
                              ),
                              SupportItem(
                                index: 4,
                                title: 'Payments & Billing',
                                subtitle:
                                    'Manage your payments, plans and billing details.',
                                expandedText:
                                    'View your plan, payment method and billing information here.',
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const SectionTitle(title: 'Support'),
                          const SizedBox(height: 16),
                          const SupportCard(
                            items: [
                              SupportItem(
                                index: 5,
                                title: 'Contact Support',
                                subtitle: 'Chat or email our support team',
                                expandedText:
                                    'Our support team is available to help with your questions.',
                              ),
                              SupportItem(
                                index: 6,
                                title: 'Report a Problem',
                                subtitle: 'Let us know if something isn’t working',
                                expandedText:
                                    'Report technical issues or problems directly to our support team.',
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const SectionTitle(title: 'Legal'),
                          const SizedBox(height: 16),
                          const SupportCard(
                            items: [
                              SupportItem(
                                index: 7,
                                title: 'Terms & Conditions',
                                subtitle: 'Read EXIT’s terms of use',
                                expandedText:
                                    'Read the complete terms and conditions for using the platform.',
                              ),
                              SupportItem(
                                index: 8,
                                title: 'Privacy Policy',
                                subtitle: 'Learn how we protect your data',
                                expandedText:
                                    'Learn how your information is collected, stored and protected.',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );




          // return Scaffold(
          //   backgroundColor: AppColors.blackColor,
          //   body: SafeArea(
          //     child: Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(24.0),
          //           child: Row(
          //             children: [
          //               GestureDetector(
          //                 onTap: () {
          //                   Get.back();
          //                 },
          //                 child: Image.asset(
          //                   AppImages.backIcon,
          //                   width: 42,
          //                   height: 42,
          //                 ),
          //               ),
          //               const SizedBox(width: 12),
          //               const Text(
          //                 'Help & Support',
          //                 style: TextStyle(
          //                     fontSize: 21,
          //                     fontWeight: FontWeight.w500,
          //                     color: AppColors.whiteColor),
          //               ),
          //               const Spacer(),
          //             ],
          //           ),
          //         ),
          //
          //
          //       ],
          //     ),
          //   ),
          // );
        });
  }
}


class SupportCard extends StatelessWidget {
  final List<SupportItem> items;

  const SupportCard({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF18191B),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF2A2C2F),
        ),
      ),
      child: Column(
        children: List.generate(
          items.length,
              (index) {
            final item = items[index];

            return Column(
              children: [
                SupportTile(item: item),

                if (index != items.length - 1)
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFF292B2E),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SupportTile extends StatelessWidget {
  final SupportItem item;

  const SupportTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final NotificationController controller =
    Get.find<NotificationController>();

    return Obx(() {
      final isExpanded = controller.isExpanded(item.index);

      return InkWell(
        onTap: () {
          controller.toggleItem(item.index);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        color: Color(0xFFE0E0E3),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Color(0xFF9B9DA2),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 7),

              Text(
                item.subtitle,
                style: const TextStyle(
                  color: Color(0xFF929399),
                  fontSize: 12,
                  height: 1.4,
                ),
              ),

              AnimatedCrossFade(
                duration: const Duration(milliseconds: 200),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    item.expandedText,
                    style: const TextStyle(
                      color: Color(0xFFB8B9BD),
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class SupportItem {
  final int index;
  final String title;
  final String subtitle;
  final String expandedText;

  const SupportItem({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.expandedText,
  });
}


class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFA6A7AC),
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
