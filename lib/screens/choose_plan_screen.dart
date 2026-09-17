import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/choose_user_controller.dart';
import 'package:exit_app/models/confirm_plan_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';

class ChoosePlanScreen extends StatelessWidget {
  const ChoosePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final heroHeight = (size.height * 0.22).clamp(120.0, 190.0);
    return GetBuilder<ChooseUserController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(size.width < 360 ? 16.0 : 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      AppImages.backIcon,
                      width: 42,
                      height: 42,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight - 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width,
                                height: heroHeight,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      AppImages.choosePlanImage,
                                      width: size.width * 0.45,
                                      height: heroHeight,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 28),
                              Text(
                                'Choose Your Plan',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                    color: AppColors.whiteColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                'Select a plan that fits your journey.\n'
                                'Upgrade, downgrade or cancel anytime.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    color: AppColors.darkGreyColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 34),
                              Obx(() => ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.planList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: PlanCard(
                                        title:
                                            controller.planList[index].name ??
                                                '',
                                        price:
                                            '₹ ${controller.planList[index].price}' ??
                                                '',
                                        credits:
                                            '${controller.planList[index].credits ?? ''} Credits',
                                        highlighted: controller
                                                .planList[index].isActive ??
                                            false,
                                        bgImage: AppImages.launchPlanBg,
                                      ),
                                    );
                                  }))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String credits;
  final bool highlighted;
  final String bgImage;
  final List<String> benefits;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.credits,
    required this.bgImage,
    this.highlighted = false,
    this.benefits = const [
      'Investor Connections',
      'Create Funding Posts',
      'Company for Sale listing',
    ],
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseUserController>(builder: (controller) {
      return Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: highlighted
                ? AppColors.darkGreyColor
                : AppColors.darkGreyColor1,
            width: 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                bgImage,
                fit: BoxFit.cover,
              ),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 18, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                        color: AppColors.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          price,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                              color: AppColors.whiteColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 4),
                      // Flexible(
                      //   child: Text(
                      //     '/ month',
                      //     maxLines: 1,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: GoogleFonts.montserrat(
                      //         color: AppColors.whiteColor,
                      //         fontSize: 24,
                      //         fontWeight: FontWeight.w400),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.whiteColor,
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      credits,
                      style: GoogleFonts.montserrat(
                          color: AppColors.whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 18),
                  for (int i = 0; i < benefits.length; i++) ...[
                    if (i > 0) const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '•',
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            benefits[i],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 18),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.clickChoosePlanButton(
                          ConfirmPlanModel(
                            title: title,
                            price: price,
                            credits: credits,
                            benefits: benefits,
                            plan_id: '1'
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.whiteColor,
                        foregroundColor: AppColors.blackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
