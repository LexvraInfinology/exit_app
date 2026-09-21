import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/constants/app_images.dart';
import 'package:exit_app/controller/choose_user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseUserController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.blackColor,
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
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
                      const SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(
                            bottom: 90,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                height: 190,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    // Soft glow
                                    Positioned(
                                      top: 20,
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.whiteColor
                                              .withOpacity(0.025),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.whiteColor
                                                  .withOpacity(0.09),
                                              blurRadius: 80,
                                              spreadRadius: 25,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Image.asset(
                                      AppImages.createProfileImage,
                                      width: 180,
                                      height: 165,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Center(
                                child: Text(
                                  'Create Profile',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.8,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: Text(
                                  'Tell us a little about yourself\n'
                                  'to get started',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.55),
                                    fontSize: 15,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 35),
                              _label('First Name'),
                              const SizedBox(height: 12),
                              _textField(
                                controller: controller.firstNameController.value,
                                hint: 'Enter your first name',
                                textInputAction: TextInputAction.next,
                                context: context,
                              ),
                              const SizedBox(height: 26),
                              _label('Last Name'),
                              const SizedBox(height: 12),
                              _textField(
                                controller: controller.lastNameController.value,
                                hint: 'Enter your last name',
                                textInputAction: TextInputAction.next,
                                context: context,
                              ),
                              const SizedBox(height: 26),
                              _label('Email'),
                              const SizedBox(height: 12),
                              _textField(
                                controller: controller.emailController.value,
                                hint: 'Enter your email address',
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                context: context,
                              ),
                              const SizedBox(height: 26),
                              _label('Current Location'),
                              const SizedBox(height: 12),
                              _textField(
                                controller: controller.locationController.value,
                                hint: 'Enter your current location',
                                textInputAction: TextInputAction.done,
                                context: context,
                              ),
                              const SizedBox(height: 26),
                              _label('Role'),
                              const SizedBox(height: 12),
                              Obx(
                                    () => Container(
                                  height: 53,
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: AppColors.containerBackgroundColor,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: AppColors.containerBorderColor,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: controller.user_role.value.isEmpty
                                          ? null
                                          : controller.user_role.value,
                                      hint: Text(
                                        'Select User role',
                                        style: GoogleFonts.montserrat(
                                            color: AppColors.darkGreyColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      isExpanded: true,
                                      dropdownColor: const Color(0xFF171717),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0xFF777777),
                                      ),
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xFFE7E7E7),
                                        fontSize: 15,
                                      ),
                                      items: [
                                        DropdownMenuItem(
                                          value: 'Founder',
                                          child: Text(
                                            'Founder',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 'CEO',
                                          child: Text('CEO',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        DropdownMenuItem(
                                          value: 'VP',
                                          child: Text('VP',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Politician',
                                          child: Text('Politician',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        if (value != null) {
                                          controller.user_role(value);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom button
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 8,
                    ),
                    color: const Color(0xFF050505),
                    child: SizedBox(
                      height: 59,
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () async {
                                  controller.clickCreateProfile();
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
                                  'Continue',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withOpacity(0.62),
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _textField(
      {TextEditingController? controller,
      required String hint,
      TextInputType? keyboardType,
      TextInputAction? textInputAction,
      required BuildContext context}) {
    return Container(
      height: 64,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF303030),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        style: const TextStyle(
          color:AppColors.whiteColor,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        cursorColor: AppColors.whiteColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 20,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: AppColors.whiteColor.withOpacity(0.40),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
