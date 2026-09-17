import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/constants/app_images.dart';
import 'package:exit_app/controller/choose_user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 217,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          AppImages.OTPVerifyImage,
                                          width: 190,
                                          height: 185,
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Verify your\nnumber',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.whiteColor,
                                      fontSize: 30,
                                      height: 1.22,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.8,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    "We've sent a 4-digit verification code to",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.whiteColor
                                          .withOpacity(0.55),
                                      fontSize: 15,
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '+91 ${controller.phoneNumberController.text.trim()}',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.whiteColor
                                          .withOpacity(0.72),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Enter OTP',
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.whiteColor
                                            .withOpacity(0.62),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 13),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(4, (index) {
                                      return Padding(
                                          padding: EdgeInsets.only(
                                            right: index == 3
                                                ? 0
                                                : 10, // 10px space between boxes
                                          ),
                                          child: SizedBox(
                                            width: 45,
                                            height: 55,
                                            child: Focus(
                                              onKeyEvent: (node, event) {
                                                // If current box is empty and user presses backspace,
                                                // move focus to previous box.
                                                if (event is KeyDownEvent &&
                                                    event.logicalKey ==
                                                        LogicalKeyboardKey
                                                            .backspace &&
                                                    controller
                                                        .otpControllers[index]
                                                        .text
                                                        .isEmpty &&
                                                    index > 0) {
                                                  controller.focusedIndex
                                                      .value = index - 1;
                                                  controller
                                                      .focusNodes[index - 1]
                                                      .requestFocus();

                                                  return KeyEventResult.handled;
                                                }

                                                return KeyEventResult.ignored;
                                              },
                                              child: TextField(
                                                controller: controller
                                                    .otpControllers[index],
                                                focusNode: controller
                                                    .focusNodes[index],
                                                keyboardType:
                                                    TextInputType.number,
                                                textInputAction:
                                                    TextInputAction.next,
                                                textAlign: TextAlign.center,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                maxLength: 1,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                style: const TextStyle(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                cursorColor:
                                                    AppColors.whiteColor,
                                                onTap: () {
                                                  controller.focusedIndex
                                                      .value = index;
                                                },
                                                onChanged: (value) {
                                                  controller.onOtpChanged(
                                                      index, value);
                                                },
                                                decoration: InputDecoration(
                                                  counterText: '',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFF303030),
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFF303030),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFF888888),
                                                    ),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                ),
                                              ),
                                            ),
                                          ));
                                    }),
                                  ),
                                  const SizedBox(height: 30),
                                  Obx(() {
                                    final remainingSeconds =
                                        controller.remainingSeconds.value;

                                    if (remainingSeconds <= 0) {
                                      return RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.65),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: [
                                            const TextSpan(
                                                text:
                                                    '${"Didn't receive the OTP? "}'),
                                            TextSpan(
                                              text: 'Resend',
                                              style: GoogleFonts.montserrat(
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  controller.resendOTP();
                                                },
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    final minutes = remainingSeconds ~/ 60;
                                    final seconds = remainingSeconds % 60;

                                    final time =
                                        '$minutes:${seconds.toString().padLeft(2, '0')}';

                                    return RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor
                                              .withOpacity(0.65),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text: 'OTP will expire in ',
                                          ),
                                          TextSpan(
                                            text: time,
                                            style: GoogleFonts.montserrat(
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 65),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 24,
                            right: 24,
                            bottom: 0,
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              height: 59,
                              child:
                              Obx(
                                () => ElevatedButton(
                                  onPressed: controller.isLoading.value
                                      ? null
                                      : () async {
                                          controller.clickVerifyOTP();
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.whiteColor,
                                    foregroundColor: AppColors.blackColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                  ),
                                  child: controller.isLoading.value
                                      ? const SizedBox(
                                          width: 32,
                                          height: 32,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 3,
                                          ),
                                        )
                                      : Text(
                                          'Verify & Continue',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
}
