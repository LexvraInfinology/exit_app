import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/kyc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';

class CardDetailsEnterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KYCController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                  'Enter PAN Details',
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
                  'Please enter your PAN details exactly as printed on your PAN card.',
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
                'PAN Number',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF858585),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 53,
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: const Color(0xFF2B2B2B),
                  ),
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Color(0xFFE7E7E7),
                    fontSize: 15,
                  ),
                  cursorColor: AppColors.whiteColor,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 21),
              Text(
                'Full Name(as per PAN Card)',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF858585),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 53,
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: const Color(0xFF2B2B2B),
                  ),
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Color(0xFFE7E7E7),
                    fontSize: 15,
                  ),
                  cursorColor: AppColors.whiteColor,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter the name exactly as it appears on your PAN card.',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF858585),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Text(
                'Date of Birth',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF858585),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 53,
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: const Color(0xFF2B2B2B),
                  ),
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Color(0xFFE7E7E7),
                    fontSize: 15,
                  ),
                  cursorColor: AppColors.whiteColor,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                  ),
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
                   controller. clickCaptureButton();
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
        )),
      );
    });
  }
}
