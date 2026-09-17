import 'package:exit_app/screens/card_details_enter_screen.dart';
import 'package:exit_app/screens/kyc_screens/choose_card_pattern_type_screen.dart';
import 'package:exit_app/screens/kyc_screens/identity_verification_screen.dart';
import 'package:exit_app/screens/kyc_screens/kyc_identity_screen.dart';
import 'package:exit_app/screens/kyc_screens/upload_card_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_color.dart';
import '../constants/app_images.dart';

RxInt currentStep = 0.obs;

class KYCController extends GetxController {
  void clickSubmitButton() {
    Get.to(KYCIdentityScreen());
  }

  void clickScanPanButton() {
    Get.to(IdentitiyVerificationScreen());
  }

  void clickUploadPanButton() {
    Get.to(UploadCardScreen());
  }

  void clickEnterCardDetailsButton() {
    Get.to(CardDetailsEnterScreen());
  }

  void clickCardPatternButton() {
    Get.to(ChooseCardPatternTypeScreen());
  }

  void clickCaptureButton() {
    Get.to(KYCIdentityScreen());
  }

  void clickNotNow() {
    Get.back();
  }

  Widget KYCWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF101011),
                border: Border.all(
                  color: const Color(0xFF29292B),
                  width: 1,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.shield,
                    size: 31,
                    color: Color(0xFFEDEDEE),
                  ),
                  Positioned(
                    right: 13,
                    bottom: 13,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        color: Color(0xFF050505),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Before you publish',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8D8D91),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Verify your identity',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              height: 1.1,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.7,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: const Text(
              'To publish your funding request and make it visible to relevant investors, you’ll need to complete a quick KYC verification.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF8D8D91),
                fontSize: 15,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF101011),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF2B2B2D),
                width: 1,
              ),
            ),
            child: const Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Checkmark
                    const Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),

                    const SizedBox(width: 11),

                    // Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Secure & encrypted',
                            style: const TextStyle(
                              color: Color(0xFFECECEE),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Your data is stored with bank-grade security.',
                            style: const TextStyle(
                              color: Color(0xFF77777B),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),

                    const SizedBox(width: 11),

                    // Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Usually takes a few minutes',
                            style: const TextStyle(
                              color: Color(0xFFECECEE),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Seamless process with automated checks.',
                            style: const TextStyle(
                              color: Color(0xFF77777B),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Checkmark
                    const Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),

                    const SizedBox(width: 11),

                    // Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Required only once',
                            style: const TextStyle(
                              color: Color(0xFFECECEE),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'One-time setup for all future fundraises.',
                            style: const TextStyle(
                              color: Color(0xFF77777B),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // const Spacer(),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 58,
            child: ElevatedButton(
              onPressed: () {
                clickSubmitButton();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'Complete KYC',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          const SizedBox(height: 27),

          // Not now
          TextButton(
            onPressed: () {
              clickNotNow();
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF8D8D91),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
            ),
            child: const Text(
              'Not now',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height * 0.055),
        ],
      ),
    );
  }

  Widget KYCVerificationWidegt(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  Row(
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
                        'KYC Verification',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Verify your identity',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Complete the verification below to publish your funding request and connect with relevant investors requirement.',
                      style: TextStyle(
                        color: Color(0xFF858589),
                        fontSize: 12.5,
                        height: 1.35,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 21),
                  GestureDetector(
                    onTap: () {
                      clickCardPatternButton();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.darkGreyColor, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF131315),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.ac_unit,
                                  color: const Color(0xFF9C9CA1),
                                  size: 21,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      '1',
                                      style: TextStyle(
                                        color: Color(0xFF77777B),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Identity Verification',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xFFE9E9EB),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'PAN Card',
                                            style: TextStyle(
                                              color: Color(0xFF858589),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  clickSubmitButton();
                                },
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Verify',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Color(0xFFE8E8EA),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      clickSubmitButton();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.darkGreyColor, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF131315),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.ac_unit,
                                  color: const Color(0xFF9C9CA1),
                                  size: 21,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      '2',
                                      style: TextStyle(
                                        color: Color(0xFF77777B),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Aadhaar Verification',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xFFE9E9EB),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Aadhaar Card',
                                            style: TextStyle(
                                              color: Color(0xFF858589),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {},
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Verify',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Color(0xFFE8E8EA),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 23),
                  Row(
                    children: [
                      Icon(
                        Icons.lock,
                        size: 14,
                        color: const Color(0xFF99999D),
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: const Text(
                          'Your information is encrypted and securely stored.',
                          style: TextStyle(
                            color: Color(0xFF858589),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 200,
                  // ),
                  // Spacer(),
                  // const Text(
                  //   'Your details are required only once.',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     color: Color(0xFF77777B),
                  //     fontSize: 11,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                  // const SizedBox(height: 19),
                  // SizedBox(
                  //   width: MediaQuery.sizeOf(context).width,
                  //   height: 59,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       controller.clickSubmitButton();
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.white,
                  //       disabledBackgroundColor: const Color(0xFF252527),
                  //       foregroundColor: Colors.black,
                  //       disabledForegroundColor: const Color(0xFF66666A),
                  //       elevation: 0,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(17),
                  //       ),
                  //     ),
                  //     child: const Text(
                  //       'Continue',
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w700,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 90),
                ],
              )),
        ])));
  }

  Widget CardVerifyWidegt(BuildContext context, KYCController controller) {
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),
                  Row(
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
                        'Identity Verification',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Verify your PAN Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Choose a method to verify your PAN and complete your identity verification.',
                      style: TextStyle(
                        color: Color(0xFF858589),
                        fontSize: 12.5,
                        height: 1.35,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 21),
                  Text(
                    'Choose verification method',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.darkGreyColor),
                  ),
                  const SizedBox(height: 21),
                  GestureDetector(
                    onTap: () {
                      clickScanPanButton();
                    },
                    child: Container(
                      height: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.darkGreyColor, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF131315),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.lightGreyColor,
                                        width: 1)),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: AppColors.whiteColor,
                                  size: 21,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Scan PAN Card',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xFFE9E9EB),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Scan the front side of your PAN card using your camera.',
                                            style: TextStyle(
                                              color: Color(0xFF858589),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xFFE8E8EA),
                                    size: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      clickUploadPanButton();
                    },
                    child: Container(
                      height: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.darkGreyColor, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF131315),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.lightGreyColor,
                                        width: 1)),
                                child: Icon(
                                  Icons.upload,
                                  color: const Color(0xFF9C9CA1),
                                  size: 21,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Upload PAN Card',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xFFE9E9EB),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Upload a clear image of your PAN card from your device.',
                                            style: TextStyle(
                                              color: Color(0xFF858589),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {},
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xFFE8E8EA),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      clickEnterCardDetailsButton();
                    },
                    child: Container(
                      height: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.darkGreyColor, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF131315),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.lightGreyColor,
                                        width: 1)),
                                child: Icon(
                                  Icons.picture_as_pdf_outlined,
                                  color: const Color(0xFF9C9CA1),
                                  size: 21,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Enter PAN Details',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xFFE9E9EB),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Manually enter your PAN details to verify.',
                                            style: TextStyle(
                                              color: Color(0xFF858589),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {},
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xFFE8E8EA),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 23),
                  Row(
                    children: [
                      Icon(
                        Icons.lock,
                        size: 14,
                        color: const Color(0xFF99999D),
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: const Text(
                          'Your information is encrypted and securely stored.',
                          style: TextStyle(
                            color: Color(0xFF858589),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 90),
                ],
              )),
        ])));
  }

  Widget IdentityVerificationWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
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
                  'Identity Verification',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [  const SizedBox(height: 32),
                   Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Verify your identity',
                      style: GoogleFonts.montserrat(
                        color: AppColors.whiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),
                   Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Place your PAN card inside the frame. Make sure the card is clearly visible and all details are readable.',
                      style: GoogleFonts.montserrat(
                        color: AppColors.darkGreyColor,
                        fontSize: 12.5,
                        height: 1.35,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 21),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.darkGreyColor, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.darkGreyColor, width: 1)),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.flash_on,
                                    size: 22,
                                    color: AppColors.whiteColor,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Flash',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColors.whiteColor),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.darkGreyColor, width: 1)),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.picture_in_picture,
                                    size: 22,
                                    color: AppColors.whiteColor,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Gallery',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColors.whiteColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 2000,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.darkGreyColor, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.darkGreyColor, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.ac_unit,
                                size: 24,
                                color: AppColors.darkGreyColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Keep the card flat',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.darkGreyColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(color: AppColors.darkGreyColor),
                          height: 70,
                          width: 1,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.sunny,
                                size: 24,
                                color: AppColors.darkGreyColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Avoid glare or shadows',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.darkGreyColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(color: AppColors.darkGreyColor),
                          height: 70,
                          width: 1,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.remove_red_eye,
                                size: 24,
                                color: AppColors.darkGreyColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Make sure all details are visible',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.darkGreyColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 59,
                    child: ElevatedButton(
                      onPressed: () {
                        clickSubmitButton();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        disabledBackgroundColor: const Color(0xFF252527),
                        foregroundColor: Colors.black,
                        disabledForegroundColor: const Color(0xFF66666A),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: const Text(
                        'Capture',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),],),
              ),
            )
          
          ],
        ),
      ),
    );
  }

  Widget UploadCardWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
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
                  'Identity Verification',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upload your PAN Card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                ),
              ),
            ),
            const SizedBox(height: 11),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upload a clear image of the front side of your PAN card. All details must be clearly visible.',
                style: TextStyle(
                  color: Color(0xFF858589),
                  fontSize: 12.5,
                  height: 1.35,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 21),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.darkGreyColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Icon(
                          Icons.drive_folder_upload,
                          size: 32,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.darkGreyColor, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.ac_unit,
                          size: 24,
                          color: AppColors.darkGreyColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Keep the card flat',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGreyColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: AppColors.darkGreyColor),
                    height: 70,
                    width: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 24,
                          color: AppColors.darkGreyColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Avoid glare or shadows',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGreyColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: AppColors.darkGreyColor),
                    height: 70,
                    width: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          size: 24,
                          color: AppColors.darkGreyColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Make sure all details are visible',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGreyColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 59,
              child: ElevatedButton(
                onPressed: () {
                  clickCaptureButton();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFF252527),
                  foregroundColor: Colors.black,
                  disabledForegroundColor: const Color(0xFF66666A),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: const Text(
                  'Capture',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
