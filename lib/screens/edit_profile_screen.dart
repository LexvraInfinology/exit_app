import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/edit_profile_controller.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: EditProfileController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
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
                      Text(
                        'Edit Profile',
                        style: GoogleFonts.montserrat(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Obx(() => Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.darkGreyColor,
                                    width: 2,
                                  ),
                                ),
                                child: controller.selectedImage.value != null
                                    ? ClipOval(
                                        child: Image.file(
                                          controller.selectedImage.value!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const Icon(
                                        Icons.person,
                                        size: 30,
                                      ),
                              )),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                controller.showUploadOptions(context);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.containerBorderColor,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 24,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Change Photo',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.darkGreyColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            'Personal Details',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.whiteColor),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'First Name',
                            style: GoogleFonts.montserrat(
                              color: AppColors.darkGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 53,
                            decoration: BoxDecoration(
                              color: AppColors.containerBackgroundColor,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                color: AppColors.containerBorderColor,
                              ),
                            ),
                            child: TextField(
                              controller: controller.firstNameController.value,
                              style: GoogleFonts.montserrat(
                                color: Color(0xFFE7E7E7),
                                fontSize: 16,
                              ),
                              cursorColor: AppColors.whiteColor,
                              decoration: const InputDecoration(
                                hintText: 'Enter first name',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Last Name',
                            style: GoogleFonts.montserrat(
                              color: AppColors.darkGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                              style: GoogleFonts.montserrat(
                                color: Color(0xFFE7E7E7),
                                fontSize: 16,
                              ),
                              controller: controller.lastNameController.value,
                              cursorColor: AppColors.whiteColor,
                              decoration: const InputDecoration(
                                hintText: 'Enter last name',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Email',
                            style: GoogleFonts.montserrat(
                              color: AppColors.darkGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                              controller: controller.emailController.value,
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFFE7E7E7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              cursorColor: AppColors.whiteColor,
                              decoration: const InputDecoration(
                                hintText: 'Enter email',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Current location',
                            style: GoogleFonts.montserrat(
                              color: AppColors.darkGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                              controller: controller.locationController.value,
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFFE7E7E7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              cursorColor: AppColors.whiteColor,
                              decoration: const InputDecoration(
                                hintText: 'Enter current location',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'About you',
                            style: GoogleFonts.montserrat(
                              color: AppColors.darkGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: AppColors.containerBackgroundColor,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                color: AppColors.containerBorderColor,
                              ),
                            ),
                            child: TextField(
                              controller: controller.aboutController.value,
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xFFE7E7E7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              cursorColor: AppColors.whiteColor,
                              decoration: const InputDecoration(
                                hintText: 'Enter about you.......',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        //INVESTER FIELDS
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                'Typical Investment',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.darkGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 53,
                                decoration: BoxDecoration(
                                  color: AppColors.containerBackgroundColor,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                    color: AppColors.containerBorderColor,
                                  ),
                                ),
                                child: TextField(
                                  controller: controller.aboutController.value,
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xFFE7E7E7),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                  cursorColor: AppColors.whiteColor,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter about you.......',
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildDropdownField(
                                hint: 'Select stage',
                                value: controller.preferredStageController.value.text.trim().isEmpty ? null : controller.preferredStageController.value.text.trim(),
                                items: controller.stagesList,
                                onChanged: (val) {
                                  if(val != null){
                                    controller.onChangeStage(val);
                                  }
                                },
                              ),
                              const SizedBox(height: 8),
                              _buildDropdownField(
                                  hint: 'Industry',
                                value: controller.preferredIndustryController.value.text.trim().isEmpty ? null : controller.preferredStageController.value.text.trim(),
                                items: controller.stagesList,
                                onChanged: (val) {
                                  if(val != null){
                                    controller.onChangeIndustry(val);
                                  }
                                },
                              ),
                              const SizedBox(height: 8),
                              _buildDropdownField(
                                hint: 'Location',
                                value: controller.preferredLocationController.value.text.trim().isEmpty ? null : controller.preferredStageController.value.text.trim(),
                                items: controller.stagesList,
                                onChanged: (val) {
                                  if(val != null){
                                    controller.onChangeLocation(val);
                                  }
                                },
                              ),
                            ],
                          )
                        // FOUNDER FIELDS
                        // Column(children: [
                        //   const SizedBox(
                        //     height: 16,
                        //   ),
                        //   Text(
                        //     'Founder Details',
                        //     style: GoogleFonts.montserrat(
                        //       color: AppColors.whiteColor,
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //   ),
                        //   const SizedBox(
                        //     height: 16,
                        //   ),
                        //   Text(
                        //     'Experience',
                        //     style: GoogleFonts.montserrat(
                        //       color: AppColors.darkGreyColor,
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        //   const SizedBox(height: 8),
                        //   Obx(
                        //         () => Container(
                        //       height: 53,
                        //       padding:
                        //       const EdgeInsets.symmetric(horizontal: 16),
                        //       decoration: BoxDecoration(
                        //         color: AppColors.containerBackgroundColor,
                        //         borderRadius: BorderRadius.circular(11),
                        //         border: Border.all(
                        //           color: AppColors.containerBorderColor,
                        //         ),
                        //       ),
                        //       child: DropdownButtonHideUnderline(
                        //         child: DropdownButton<String>(
                        //           value: controller.experience.value.isEmpty
                        //               ? null
                        //               : controller.experience.value,
                        //           hint: Text(
                        //             'Select Experience',
                        //             style: GoogleFonts.montserrat(
                        //                 color: AppColors.darkGreyColor,
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.w600),
                        //           ),
                        //           isExpanded: true,
                        //           dropdownColor: const Color(0xFF171717),
                        //           icon: const Icon(
                        //             Icons.keyboard_arrow_down,
                        //             color: Color(0xFF777777),
                        //           ),
                        //           style: GoogleFonts.montserrat(
                        //             color: Color(0xFFE7E7E7),
                        //             fontSize: 15,
                        //           ),
                        //           items: [
                        //             DropdownMenuItem(
                        //               value: '0-5',
                        //               child: Text(
                        //                 '0-5',
                        //                 style: GoogleFonts.montserrat(
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w600),
                        //               ),
                        //             ),
                        //             DropdownMenuItem(
                        //               value: '5-10',
                        //               child: Text('5-10',
                        //                   style: GoogleFonts.montserrat(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.w600)),
                        //             ),
                        //             DropdownMenuItem(
                        //               value: '10-15',
                        //               child: Text('10-15',
                        //                   style: GoogleFonts.montserrat(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.w600)),
                        //             ),
                        //             DropdownMenuItem(
                        //               value: '15-20',
                        //               child: Text('15-20',
                        //                   style: GoogleFonts.montserrat(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.w600)),
                        //             ),
                        //           ],
                        //           onChanged: (value) {
                        //             if (value != null) {
                        //               controller.experience(value);
                        //             }
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   const SizedBox(
                        //     height: 16,
                        //   ),
                        //   Text(
                        //     'Current Stage',
                        //     style: GoogleFonts.montserrat(
                        //       color: AppColors.darkGreyColor,
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        //   const SizedBox(height: 8),
                        //   Obx(
                        //         () => Container(
                        //       height: 53,
                        //       padding:
                        //       const EdgeInsets.symmetric(horizontal: 16),
                        //       decoration: BoxDecoration(
                        //         color: AppColors.containerBackgroundColor,
                        //         borderRadius: BorderRadius.circular(11),
                        //         border: Border.all(
                        //           color: AppColors.containerBorderColor,
                        //         ),
                        //       ),
                        //       child: DropdownButtonHideUnderline(
                        //         child: DropdownButton<String>(
                        //           value: controller.company_stage.value.isEmpty
                        //               ? null
                        //               : controller.company_stage.value,
                        //           hint: Text(
                        //             'Select Stage',
                        //             style: GoogleFonts.montserrat(
                        //                 color: Color(0xFF777777),
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.w600),
                        //           ),
                        //           isExpanded: true,
                        //           dropdownColor: const Color(0xFF171717),
                        //           icon: const Icon(
                        //             Icons.keyboard_arrow_down,
                        //             color: Color(0xFF777777),
                        //           ),
                        //           style: GoogleFonts.montserrat(
                        //               color: Color(0xFFE7E7E7),
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w600),
                        //           items: [
                        //             DropdownMenuItem(
                        //               value: 'Series A',
                        //               child: Text('Series A',
                        //                   style: GoogleFonts.montserrat(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.w600)),
                        //             ),
                        //             DropdownMenuItem(
                        //               value: 'Series B',
                        //               child: Text('Series B',
                        //                   style: GoogleFonts.montserrat(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.w600)),
                        //             ),
                        //             DropdownMenuItem(
                        //               value: 'Seed',
                        //               child: Text('Seed',
                        //                   style: GoogleFonts.montserrat(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.w600)),
                        //             ),
                        //           ],
                        //           onChanged: (value) {
                        //             if (value != null) {
                        //               controller.companyStage(value);
                        //             }
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   const SizedBox(
                        //     height: 16,
                        //   ),
                        //   Text(
                        //     'Team Size',
                        //     style: GoogleFonts.montserrat(
                        //       color: AppColors.darkGreyColor,
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        //   const SizedBox(height: 8),
                        //   Obx(
                        //         () => Container(
                        //       height: 53,
                        //       padding:
                        //       const EdgeInsets.symmetric(horizontal: 16),
                        //       decoration: BoxDecoration(
                        //         color: AppColors.containerBackgroundColor,
                        //         borderRadius: BorderRadius.circular(11),
                        //         border: Border.all(
                        //           color: AppColors.containerBorderColor,
                        //         ),
                        //       ),
                        //       child: DropdownButtonHideUnderline(
                        //         child: DropdownButton<String>(
                        //           value: controller.team_size.value.isEmpty
                        //               ? null
                        //               : controller.team_size.value,
                        //           hint: Text(
                        //             'Team Size',
                        //             style: GoogleFonts.montserrat(
                        //                 color: AppColors.darkGreyColor,
                        //                 fontSize: 15,
                        //                 fontWeight: FontWeight.w600),
                        //           ),
                        //           isExpanded: true,
                        //           dropdownColor: const Color(0xFF171717),
                        //           icon: const Icon(
                        //             Icons.keyboard_arrow_down,
                        //             color: Color(0xFF777777),
                        //           ),
                        //           style: GoogleFonts.montserrat(
                        //               color: Color(0xFFE7E7E7),
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.w600),
                        //           items: [
                        //             DropdownMenuItem(
                        //               value: '2-5',
                        //               child: Text('2-5',
                        //                   style: GoogleFonts.montserrat(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.w600)),
                        //             ),
                        //             DropdownMenuItem(
                        //               value: '5-10',
                        //               child: Text('5-10',
                        //                   style: GoogleFonts.montserrat(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.w600)),
                        //             ),
                        //             DropdownMenuItem(
                        //               value: '10-15',
                        //               child: Text('10-15',
                        //                   style: GoogleFonts.montserrat(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.w600)),
                        //             ),
                        //             DropdownMenuItem(
                        //               value: '15-20',
                        //               child: Text('15-20',
                        //                   style: GoogleFonts.montserrat(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.w600)),
                        //             ),
                        //           ],
                        //           onChanged: (value) {
                        //             if (value != null) {
                        //               controller.teamSize(value);
                        //             }
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   const SizedBox(height: 40),
                        //   GestureDetector(
                        //     onTap: () {
                        //       controller.clickEditProfile();
                        //     },
                        //     child: Container(
                        //       width: MediaQuery.sizeOf(context).width,
                        //       height: 58,
                        //       alignment: Alignment.center,
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(24),
                        //       ),
                        //       child: controller.isLoading.value ?
                        //       const Center(child: CircularProgressIndicator()):Text(
                        //         'Save Changes',
                        //         style: GoogleFonts.montserrat(
                        //           color: AppColors.blackColor,
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w600,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   const SizedBox(height: 20),
                        // ],)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          );
        });

  }

  Widget _buildDropdownField({
    required String hint,
    required String? value,
    required List<MarketplaceIndustry> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white10,
          width: 0.7,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint: Text(
            hint,
            style: const TextStyle(color: Colors.white38, fontSize: 15),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
          dropdownColor: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
          style: const TextStyle(color: Colors.white, fontSize: 15),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item.id,
              child: Text(item.name),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
