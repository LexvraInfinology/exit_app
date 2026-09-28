import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/kyc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';

class CardDetailsEnterScreen extends StatelessWidget {
  const CardDetailsEnterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KYCController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.blackColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),

                  // =========================
                  // HEADER
                  // =========================
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

                  // =========================
                  // TITLE
                  // =========================
                  const Text(
                    'Enter PAN Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.2,
                    ),
                  ),

                  const SizedBox(height: 11),

                  const Text(
                    'Please enter your PAN details exactly as printed on your PAN card.',
                    style: TextStyle(
                      color: Color(0xFF858589),
                      fontSize: 12.5,
                      height: 1.35,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 21),

                  // =========================
                  // PAN NUMBER
                  // =========================
                  Text(
                    'PAN Number',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF858585),
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
                      controller: controller.panNumberController,
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 10,
                      style: const TextStyle(
                        color: Color(0xFFE7E7E7),
                        fontSize: 15,
                      ),
                      cursorColor: AppColors.whiteColor,
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: 'ABCDE1234F',
                        hintStyle: TextStyle(
                          color: Color(0xFF555555),
                          fontSize: 15,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 21),

                  // =========================
                  // FULL NAME
                  // =========================
                  Text(
                    'Full Name (as per PAN Card)',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF858585),
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
                      controller: controller.fullNameController,
                      textCapitalization: TextCapitalization.words,
                      style: const TextStyle(
                        color: Color(0xFFE7E7E7),
                        fontSize: 15,
                      ),
                      cursorColor: AppColors.whiteColor,
                      decoration: const InputDecoration(
                        hintText: 'Enter full name',
                        hintStyle: TextStyle(
                          color: Color(0xFF555555),
                          fontSize: 15,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Enter the name exactly as it appears on your PAN card.',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF858585),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 21),

                  // =========================
                  // DATE OF BIRTH
                  // =========================
                  Text(
                    'Date of Birth',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF858585),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 8),

                  GestureDetector(
                    onTap: () async {
                      final DateTime? pickedDate =
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.dark(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                surface: Color(0xFF111111),
                                onSurface: Colors.white,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickedDate != null) {
                        controller.dobController.text =
                        '${pickedDate.day.toString().padLeft(2, '0')}/'
                            '${pickedDate.month.toString().padLeft(2, '0')}/'
                            '${pickedDate.year}';

                        controller.update();
                      }
                    },
                    child: Container(
                      height: 53,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF111111),
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(
                          color: const Color(0xFF2B2B2B),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              controller.dobController.text.isEmpty
                                  ? 'YYYY-MM-DD'
                                  : controller.dobController.text,
                              style: TextStyle(
                                color: controller
                                    .dobController.text.isEmpty
                                    ? const Color(0xFF555555)
                                    : const Color(0xFFE7E7E7),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 19,
                            color: Color(0xFF858589),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  // =========================
                  // SUBMIT BUTTON
                  // =========================
                  SizedBox(
                    width: double.infinity,
                    height: 59,
                    child: ElevatedButton(
                      onPressed: controller.isLoading
                          ? null
                          : () async {
                        await controller.verifyPan();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        disabledBackgroundColor:
                        const Color(0xFF252527),
                        foregroundColor: Colors.black,
                        disabledForegroundColor:
                        const Color(0xFF66666A),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: controller.isLoading
                          ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                          : const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}