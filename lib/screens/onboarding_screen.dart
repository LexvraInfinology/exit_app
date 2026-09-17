import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/screens/choose_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../constants/app_images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;

  final ValueNotifier<int> currentPage = ValueNotifier<int>(0);

  final List<String> images = [
    AppImages.onboarding1,
    AppImages.image2,
    AppImages.image3,
  ];
  final List<String> videos = [
    AppImages.onboarding3,
    AppImages.onboarding2,
    AppImages.onboarding3,
  ];

  final List<String> titles = [
    AppImages.title1,
    AppImages.title3,
    AppImages.title2,
  ];

  final List<String> descriptions = [
    AppImages.description1,
    AppImages.description3,
    AppImages.description2,
  ];

  final List<VideoPlayerController?> videoControllers = [
    null,
    null,
    null,
  ];

  @override
  void initState() {
    super.initState();

    pageController = PageController();

    _initializeVideo(0);
  }

  Future<void> _initializeVideo(int index) async {
    if (videoControllers[index] != null) {
      return;
    }

    final controller = VideoPlayerController.asset(
      videos[index],
    );

    try {
      await controller.initialize();

      if (!mounted) {
        await controller.dispose();
        return;
      }

      await controller.setLooping(false);

      videoControllers[index] = controller;

      // Start playing immediately
      await controller.play();

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      debugPrint("VIDEO ERROR [$index]: $e");
      await controller.dispose();
    }
  }

  void _onPageChanged(int index) {
    currentPage.value = index;

    // Make sure current video is initialized
    _initializeVideo(index);

    // Initialize next video in background
    if (index + 1 < videos.length) {
      _initializeVideo(index + 1);
    }

    // Pause other videos
    for (int i = 0; i < videoControllers.length; i++) {
      if (i != index && videoControllers[i] != null) {
        videoControllers[i]!.pause();
      }
    }

    // Play current video if already initialized
    final controller = videoControllers[index];

    if (controller != null && controller.value.isInitialized) {
      controller
        ..seekTo(Duration.zero)
        ..play();
    }
  }

  Widget _buildVideo(int index) {
    final controller = videoControllers[index];

    // Don't show a loader.
    // Just show a black background until the video is ready.
    if (controller == null || !controller.value.isInitialized) {
      return const ColoredBox(
        color: Colors.black,
      );
    }

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.contain,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: controller.value.size.width,
          height: controller.value.size.height,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }

  Widget _buildImage(int index) {
    return SizedBox.expand(
      child: Image.asset(
        images[index],
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    currentPage.dispose();

    for (final controller in videoControllers) {
      controller?.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: videos.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            width: size.width,
                            height: size.height / 2,
                            child: _buildImage(index),
                          ),
                        ),
                        // PageView.builder(
                        //   itemCount: images.length,
                        //   itemBuilder: (context, index) {
                        //     return _buildImage(index);
                        //   },
                        // ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ValueListenableBuilder<int>(
                            valueListenable: currentPage,
                            builder: (context, page, child) {
                              return Row(
                                children: List.generate(
                                  videos.length,
                                  (index) {
                                    final isSelected = index <= page;
                                    return AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.only(right: 8),
                                      height: 8,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: isSelected
                                            ? const LinearGradient(
                                                colors: [
                                                  AppColors.gradientColorTop,
                                                  AppColors.gradientColorBottom,
                                                ],
                                              )
                                            : null,
                                        border: isSelected
                                            ? null
                                            : Border.all(
                                                color: AppColors.whiteColor,
                                                width: 1,
                                              ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            titles[index],
                            style: GoogleFonts.montserrat(
                              fontSize: 28,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            descriptions[index],
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: AppColors.darkGreyColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: size.width,
                height: 58,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      backgroundColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: _continue,
                    child: Center(
                      child: Text(
                        "Continue",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _continue() {

    print('click object');

    final currentIndex = currentPage.value;
    if (currentIndex < videos.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {

      Get.to(() => const ChooseUserScreen());

    }
  }
}
