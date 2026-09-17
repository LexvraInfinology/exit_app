import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/constants/app_images.dart';
import 'package:exit_app/controller/choose_user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseUserController>(builder: (controller) {
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: 220,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Soft white glow
                              Positioned(
                                top: 20,
                                child: Container(
                                  width: 190,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        AppColors.whiteColor.withOpacity(0.025),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.whiteColor
                                            .withOpacity(0.10),
                                        blurRadius: 90,
                                        spreadRadius: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Replace this with your actual illustration
                              Image.asset(
                                AppImages.numberScreenImage,
                                width: 230,
                                height: 210,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 34),
                        Text(
                          "Let's get\nyou started",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: AppColors.whiteColor,
                            fontSize: 30,
                            height: 1.25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.8,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Enter your phone number to create your founder account.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: AppColors.whiteColor.withOpacity(0.58),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 35),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Phone No.',
                            style: GoogleFonts.montserrat(
                              color: AppColors.whiteColor.withOpacity(0.62),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 64,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: const Color(0xFF111111),
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                              color: const Color(0xFF353535),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Country selector
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '🇮🇳',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '+91',
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.whiteColor
                                            .withOpacity(0.72),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppColors.whiteColor
                                          .withOpacity(0.65),
                                      size: 19,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 15),

                              // Vertical divider
                              Container(
                                width: 1,
                                height: 34,
                                color: const Color(0xFF555555),
                              ),

                              const SizedBox(width: 14),

                              // Phone input
                              Expanded(
                                child: TextField(
                                  controller: controller.phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.whiteColor,
                                    fontSize: 15,
                                  ),
                                  cursorColor: AppColors.whiteColor,
                                  decoration: InputDecoration(
                                    hintText: 'Enter phone number',
                                    hintStyle: GoogleFonts.montserrat(
                                      color: AppColors.whiteColor
                                          .withOpacity(0.40),
                                      fontSize: 15,
                                    ),
                                    border: InputBorder.none,
                                    isCollapsed: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.isChecked.value,
                                  onChanged: (val) =>
                                      controller.clickCheckbox(val),
                                )),
                            Column(
                              children: [
                                Text(
                                  'By continuing, you agree to our',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    color:
                                        AppColors.whiteColor.withOpacity(0.78),
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                GestureDetector(
                                  onTap: () {
                                    controller.clickPrivacyPolicyAndTermCondition();
                                  },
                                  child: Text(
                                    'Terms & Privacy Policy.',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.whiteColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: 59,
                          child: Obx(
                            () => ElevatedButton(
                              onPressed: controller.isLoading.value
                                  ? null
                                  : () async {
                                      controller.clickSendOTPButton();
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
                                      'Send OTP',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
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
