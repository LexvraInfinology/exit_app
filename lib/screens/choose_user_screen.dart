import 'package:exit_app/choose_user_model/choose_user_model.dart';
import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/constants/app_images.dart';
import 'package:exit_app/controller/choose_user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ChooseUserScreen extends StatelessWidget {
  const ChooseUserScreen({super.key});

  final List<ChooseUserModel> options = const [
    ChooseUserModel(
      title: 'Investor',
      description: 'Discover, evaluate & invest in promising startups.',
      icon: AppImages.investorUserIcon,
    ),
    ChooseUserModel(
      title: 'Founder',
      description: 'Pitch, connect & raise capital for your venture.',
      icon: AppImages.founderUserIcon,
    ),
    ChooseUserModel(
      title: 'Startup',
      description: 'Build, scale & connect the right opportunities.',
      icon: AppImages.startUpUserIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChooseUserController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // GestureDetector(
                        //   behavior: HitTestBehavior.opaque,
                        //   onTap: () {
                        //     Get.back();
                        //   },
                        //   child: SizedBox(
                        //     width: 52,
                        //     height: 52,
                        //     child: Image.asset(
                        //       AppImages.backIcon,
                        //       width: 42,
                        //       height: 42,
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: constraints.maxHeight,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 175,
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // WHITE BLUR / GLOW
                                            Positioned(
                                              top: 50,
                                              left: 70,
                                              right: 70,
                                              child: Container(
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(100),
                                                  color: Colors.white.withOpacity(0.28),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.white.withOpacity(0.35),
                                                      blurRadius: 80,
                                                      spreadRadius: 50,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 0,
                                              right: 0,
                                              child: Image.asset(
                                                AppImages.chooseUserImage,
                                                height: 150,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const Text(
                                        'Choose your path to get started',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          height: 1.25,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.8,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      ...List.generate(
                                        options.length,
                                        (index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 18),
                                            child: Obx(
                                              () {
                                                final selected = controller
                                                        .selectedIndex.value ==
                                                    index;

                                                return GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .selectPath(index);
                                                  },
                                                  behavior:
                                                      HitTestBehavior.opaque,
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                      milliseconds: 180,
                                                    ),
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    height: 128,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 22,
                                                      vertical: 18,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF0D0D0D),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      border: Border.all(
                                                        color: selected
                                                            ? Colors.white
                                                            : const Color(
                                                                0xFF555555),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        // ICON
                                                        Container(
                                                          width: 54,
                                                          height: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: AppColors
                                                                    .blackColor
                                                                    .withOpacity(
                                                                        .4),
                                                                offset:
                                                                    const Offset(
                                                                        0, 2),
                                                                blurRadius: 2,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Image.asset(
                                                            options[index].icon,
                                                            width: 32,
                                                            height: 32,
                                                          ),
                                                        ),

                                                        const SizedBox(
                                                            width: 20),

                                                        // TEXT
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                options[index]
                                                                    .title,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  letterSpacing:
                                                                      -.2,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 8),
                                                              Expanded(
                                                                child: Text(
                                                                  options[index]
                                                                      .description,
                                                                  maxLines: 2,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            .58),
                                                                    fontSize:
                                                                        13.5,
                                                                    height: 1.55,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        const SizedBox(
                                                            width: 10),

                                                        // RADIO BUTTON
                                                        AnimatedContainer(
                                                          duration:
                                                              const Duration(
                                                            milliseconds: 180,
                                                          ),
                                                          width: 24,
                                                          height: 24,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: selected
                                                              ? Center(
                                                                  child:
                                                                      Container(
                                                                    width: 12,
                                                                    height: 12,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 100),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 10,
                        right: 1,
                        left: 1,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              height: 58,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.continuePressed();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
