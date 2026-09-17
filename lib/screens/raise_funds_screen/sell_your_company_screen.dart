import 'package:dotted_border/dotted_border.dart';
import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/sell_your_company_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../constants/app_images.dart';
import '../../controller/raise_funds_request_controller.dart';

class SellYourCompanyScreen extends StatelessWidget {
  SellYourCompanyScreen({super.key});

  int selectedPurpose = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SellYourCompanyController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.clickForBack(controller.currentStep.value);
                          controller.update();
                        },
                        child: Image.asset(
                          AppImages.backIcon,
                          width: 42,
                          height: 42,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Sell your company',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 32),
                    ],
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: _buildStepContent(context, controller),
                  ),
                ),
              ],
            )),
          );
        });
  }

  Widget _buildStepContent(
      BuildContext context, SellYourCompanyController controller) {
    switch (controller.currentStep.value) {
      case 0:
        return _buildSaleDetails(context, controller);

      case 1:
        return _buildCompany(context, controller);

      case 2:
        return _buildSnapshot(context, controller);

      case 3:
        return _buildReview(context, controller);

      default:
        return const SizedBox();
    }
  }

  Widget _buildSaleDetails(
      BuildContext context, SellYourCompanyController controller) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: true
                              ? const Color(0xFF101010)
                              : const Color(0xFF0B0B0B),
                          border: Border.all(
                            color: true
                                ? AppColors.whiteColor
                                : const Color(0xFF262626),
                            width: true ? 1.4 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: GoogleFonts.montserrat(
                              color: true
                                  ? AppColors.whiteColor
                                  : const Color(0xFF555555),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Sell Details',
                        style: GoogleFonts.montserrat(
                          color: true
                              ? AppColors.whiteColor
                              : const Color(0xFF555555),
                          fontSize: 7,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 18),
                  color: const Color(0xFF242424),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: false
                              ? const Color(0xFF101010)
                              : const Color(0xFF0B0B0B),
                          border: Border.all(
                            color:
                                false ? Colors.white : const Color(0xFF262626),
                            width: false ? 1.4 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: GoogleFonts.montserrat(
                              color: false
                                  ? AppColors.whiteColor
                                  : const Color(0xFF555555),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Company',
                        style: GoogleFonts.montserrat(
                          color: false
                              ? AppColors.whiteColor
                              : const Color(0xFF555555),
                          fontSize: 7,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 18),
                  color: const Color(0xFF242424),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: false
                              ? const Color(0xFF101010)
                              : const Color(0xFF0B0B0B),
                          border: Border.all(
                            color:
                                false ? Colors.white : const Color(0xFF262626),
                            width: false ? 1.4 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '3',
                            style: GoogleFonts.montserrat(
                              color: false
                                  ? AppColors.whiteColor
                                  : const Color(0xFF555555),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Snapshots',
                        style: GoogleFonts.montserrat(
                          color: false
                              ? AppColors.whiteColor
                              : const Color(0xFF555555),
                          fontSize: 7,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 18),
                  color: const Color(0xFF242424),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: false
                              ? const Color(0xFF101010)
                              : const Color(0xFF0B0B0B),
                          border: Border.all(
                            color: false
                                ? AppColors.whiteColor
                                : const Color(0xFF262626),
                            width: false ? 1.4 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '4',
                            style: GoogleFonts.montserrat(
                              color: false
                                  ? AppColors.whiteColor
                                  : const Color(0xFF555555),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'REVIEW',
                        style: GoogleFonts.montserrat(
                          color: false
                              ? AppColors.whiteColor
                              : const Color(0xFF555555),
                          fontSize: 7,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tell us about the sale',
                  style: GoogleFonts.montserrat(
                    color: AppColors.whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'This helpSet the key details for your company listing.s investors understand your funding requirement.',
                  style: GoogleFonts.montserrat(
                    color: Color(0xFF777777),
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 120,
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xFF171717),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: controller.amountController,
                              onChanged: (value) {
                                final number = int.tryParse(
                                  value.replaceAll(',', ''),
                                );
                                if (number != null) {
                                  final formatted = NumberFormat(
                                    '#,##,##0',
                                    'en_IN',
                                  ).format(number);

                                  if (formatted != value) {
                                    controller.amountController.value =
                                        TextEditingValue(
                                      text: formatted,
                                      selection: TextSelection.collapsed(
                                        offset: formatted.length,
                                      ),
                                    );
                                  }
                                }
                              },
                              keyboardType: TextInputType.number,
                              style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter amount...',
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: const Icon(
                                  Icons.currency_rupee,
                                  color: AppColors.whiteColor,
                                ),
                                prefixStyle: GoogleFonts.montserrat(
                                  color: AppColors.whiteColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Target amount',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFF686868),
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 34,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF070707),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'INR',
                              style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 14,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'What stage is your company?',
                  style: GoogleFonts.montserrat(
                    color: AppColors.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.selectedAcquisition.value = 0;
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: controller.selectedAcquisition.value == 0
                                    ? AppColors.whiteColor
                                    : AppColors.darkGreyColor,
                                width: controller.selectedAcquisition.value == 0
                                    ? 1.2
                                    : 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Full Acquisition',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'Sell the entire company',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.darkGreyColor,
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.selectedAcquisition.value = 1;
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: controller.selectedAcquisition.value == 1
                                    ? AppColors.whiteColor
                                    : AppColors.darkGreyColor,
                                width: controller.selectedAcquisition.value == 1
                                    ? 1.2
                                    : 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Partial Acquisition',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'Sell a stake in the company',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.darkGreyColor,
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 150),
                // Text(
                //   'Expected Timeline',
                //   style: GoogleFonts.montserrat(
                //     color: AppColors.whiteColor,
                //     fontSize: 14,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                // const SizedBox(height: 20),
                // Text(
                //   'Select the primary reason for this funding.',
                //   style: GoogleFonts.montserrat(
                //     color: AppColors.darkGreyColor,
                //     fontSize: 12,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // Obx(() => Wrap(
                //       spacing: 8,
                //       runSpacing: 8,
                //       children: List.generate(
                //         controller.purposes.length,
                //         (index) {
                //           final selected =
                //               controller.selectedPurpose.value == index;
                //
                //           return GestureDetector(
                //             onTap: () {
                //               controller.selectedPurpose.value = index;
                //             },
                //             child: AnimatedContainer(
                //               duration: const Duration(milliseconds: 150),
                //               padding: const EdgeInsets.symmetric(
                //                 horizontal: 16,
                //                 vertical: 9,
                //               ),
                //               decoration: BoxDecoration(
                //                 color: selected
                //                     ? const Color(0xFF101010)
                //                     : const Color(0xFF111111),
                //                 borderRadius: BorderRadius.circular(20),
                //                 border: Border.all(
                //                   color: selected
                //                       ? AppColors.whiteColor
                //                       : const Color(0xFF171717),
                //                   width: selected ? 1.2 : 1,
                //                 ),
                //               ),
                //               child: Text(
                //                 controller.purposes[index],
                //                 style: GoogleFonts.montserrat(
                //                   color: selected
                //                       ? AppColors.whiteColor
                //                       : const Color(0xFF777777),
                //                   fontSize: 10,
                //                   fontWeight: selected
                //                       ? FontWeight.w600
                //                       : FontWeight.w400,
                //                 ),
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //     )),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  decoration: const BoxDecoration(
                    color: Color(0xFF050505),
                  ),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.clickContinueButton(1);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whiteColor,
                        foregroundColor: AppColors.blackColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCompany(
      BuildContext context, SellYourCompanyController controller) {
    final TextEditingController companyNameController =
        TextEditingController(text: 'NovaNest');

    final TextEditingController locationController =
        TextEditingController(text: 'Bengaluru, India');

    final TextEditingController websiteController =
        TextEditingController(text: 'www.novanest.com');

    final TextEditingController descriptionController = TextEditingController();
    String industry = 'FinTech';

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: true
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '01',
                        style: GoogleFonts.montserrat(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Raise Details',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: true
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 24),
                  color: AppColors.whiteColor,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: true
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '02',
                        style: GoogleFonts.montserrat(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Company',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: true
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 12,
                height: 1,
                margin: const EdgeInsets.only(bottom: 24),
                color: const Color(0xFF292929),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: false
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: false
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '03',
                        style: GoogleFonts.montserrat(
                          color: false
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'About Raise',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: false
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 12,
                height: 1,
                margin: const EdgeInsets.only(bottom: 24),
                color: const Color(0xFF292929),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: false
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: false
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '04',
                        style: GoogleFonts.montserrat(
                          color: false
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Review',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: false
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Company',
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor),
              ),
              const SizedBox(height: 6),
              Text(
                'Tell investors a little about the company you’re\nraising for.',
                style: GoogleFonts.montserrat(
                  color: const Color(0xFF777777),
                  fontSize: 12,
                  height: 1.55,
                ),
              ),

              const SizedBox(height: 20),
              Obx(() => DottedBorder(
                    color: AppColors.darkGreyColor,
                    strokeWidth: 1,
                    dashPattern: [5, 4],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    child: controller.selectedImage.value == null
                        ? Container(
                            padding: const EdgeInsets.all(24),
                            decoration:
                                BoxDecoration(border: Border.all(width: 1)),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.darkGreyColor,
                                          width: 1)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Select Image Camera, Gallery or pdf',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: AppColors.whiteColor),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.showUploadOptions(context);
                                        },
                                        child: Text(
                                          ' Upload',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: AppColors.greenColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(24),
                            decoration:
                                BoxDecoration(border: Border.all(width: 1)),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.darkGreyColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: controller.selectedImage.value != null
                                      ? Image.file(
                                          controller.selectedImage.value!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(
                                          Icons.image,
                                          size: 30,
                                        ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'images_text.png',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: AppColors.whiteColor),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '1.5 MB',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: AppColors.darkGreyColor),
                                        ),
                                        Text(
                                          ' Uploaded',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: AppColors.greenColor),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    controller.selectedImage.value = null;
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 32,
                                    color: AppColors.darkGreyColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                  )),
              const SizedBox(height: 20),
              Text(
                'Company Name',
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
                  controller: companyNameController,
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
              const SizedBox(height: 7),
              Text(
                'Use your registered or public company name.',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF666666),
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Industry',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF858585),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Obx(
                () => Container(
                  height: 53,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF111111),
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(
                      color: const Color(0xFF2B2B2B),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.industry.value.isEmpty
                          ? null
                          : controller.industry.value,
                      hint: const Text(
                        'Select Industry',
                        style: TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 15,
                        ),
                      ),
                      isExpanded: true,
                      dropdownColor: const Color(0xFF171717),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF777777),
                      ),
                      style: const TextStyle(
                        color: Color(0xFFE7E7E7),
                        fontSize: 15,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'FinTech',
                          child: Text('FinTech'),
                        ),
                        DropdownMenuItem(
                          value: 'SaaS',
                          child: Text('SaaS'),
                        ),
                        DropdownMenuItem(
                          value: 'Healthcare',
                          child: Text('Healthcare'),
                        ),
                        DropdownMenuItem(
                          value: 'E-Commerce',
                          child: Text('E-Commerce'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          controller.changeIndustry(value);
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Company Stage',
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
              // _lockedField(
              //   text: '',
              //   icon: Icons.lock,
              // ),
              const SizedBox(height: 20),
              Text(
                'Location',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF858585),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 8),
              // _iconTextField(
              //   controller: locationController,
              //   icon: Icons.location_on,
              // ),
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
                  controller: locationController,
                  style: const TextStyle(
                    color: Color(0xFFE1E1E1),
                    fontSize: 15,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.location_on,
                      size: 17,
                      color: const Color(0xFF858585),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Company Website',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFF858585),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    'Optional',
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
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
                  controller: websiteController,
                  style: const TextStyle(
                    color: Color(0xFFE1E1E1),
                    fontSize: 15,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.language,
                      size: 17,
                      color: const Color(0xFF858585),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Text(
                'Company Description',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF858585),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 8),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: const Color(0xFF2B2B2B),
                  ),
                ),
                child: Stack(
                  children: [
                    TextField(
                      controller: descriptionController,
                      maxLength: 250,
                      maxLines: 5,
                      style: GoogleFonts.montserrat(
                        color: Color(0xFFE1E1E1),
                        fontSize: 14,
                        height: 1.5,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText:
                            'Tell investors what your company does in a\nfew sentences...',
                        hintStyle: GoogleFonts.montserrat(
                          color: Color(0xFFD0D0D0),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        counterText: '',
                        contentPadding:
                            const EdgeInsets.fromLTRB(16, 14, 16, 25),
                      ),
                    ),
                    Positioned(
                      right: 12,
                      bottom: 7,
                      child: ValueListenableBuilder<TextEditingValue>(
                        valueListenable: descriptionController,
                        builder: (_, value, __) {
                          return Text(
                            '${value.text.length}/250',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF777777),
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 18),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
            color: const Color(0xFF050505),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  controller.clickContinueButton(2);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.blackColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSnapshot(
      BuildContext context, SellYourCompanyController controller) {


    final TextEditingController detailsController = TextEditingController();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: true
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '01',
                        style: GoogleFonts.montserrat(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Raise Details',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: true
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 24),
                  color: AppColors.whiteColor,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: true
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '02',
                        style: GoogleFonts.montserrat(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Company',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: true
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 24),
                  color: AppColors.whiteColor,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: true
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '03',
                        style: GoogleFonts.montserrat(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'About Raise',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: true
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 12,
                height: 1,
                margin: const EdgeInsets.only(bottom: 24),
                color: const Color(0xFF292929),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: false
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: false
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '04',
                        style: GoogleFonts.montserrat(
                          color: false
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Review',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: false
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Business Snapshot',
                style: GoogleFonts.montserrat(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Help buyers understand your business.',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF737373),
                  fontSize: 12,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Annual Revenue',
                style: GoogleFonts.montserrat(
                    color: Color(0xFF737373),
                    fontSize: 14,
                    height: 1.45,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 74,
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(
                    color: const Color(0xFF303030),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 18),
                    Text(
                      '₹',
                      style: GoogleFonts.montserrat(
                        color: Color(0xFFAAAAAA),
                        fontSize: 23,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller:controller. revenueController,
                        onChanged: (value) {
                          final number = int.tryParse(
                            value.replaceAll(',', ''),
                          );
                          if (number != null) {
                            final formatted = NumberFormat(
                              '#,##,##0',
                              'en_IN',
                            ).format(number);

                            if (formatted != value) {
                              controller.revenueController.value =
                                  TextEditingValue(
                                    text: formatted,
                                    selection: TextSelection.collapsed(
                                      offset: formatted.length,
                                    ),
                                  );
                            }
                          }
                        },
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.montserrat(
                          color: AppColors.whiteColor,
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                        ),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '12345678',
                          isCollapsed: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Your total revenue in the last 12 months.',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF777777),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              _profitabilityOption('Profitable', controller),
              const SizedBox(height: 12),
              _profitabilityOption('Break-even', controller),
              const SizedBox(height: 12),
              _profitabilityOption('Pre-profit', controller),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Anything buyers should know?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Optional',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const Text(
                'Share any additional information that can help\nbuyers.',
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFF303030),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: TextField(
                  controller: detailsController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.4,
                  ),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        'E.g. Key strengths, long-term contracts,\nunique assets...',
                    hintStyle: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
                color: const Color(0xFF050505),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.clickContinueButton(3);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.whiteColor,
                      foregroundColor: AppColors.blackColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _profitabilityOption(
      String value, SellYourCompanyController controller) {
    return Obx(
      () {
        final bool selected = controller.selectedProfitability.value == value;

        return GestureDetector(
          onTap: () {
            controller.selectedProfitability.value = value;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: 58,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selected ? Colors.white : const Color(0xFF2B2B2B),
                width: selected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: selected
                        ? const Color(0xFFEDEDED)
                        : const Color(0xFF888888),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? Colors.white : Colors.transparent,
                    border: Border.all(
                      color: selected ? Colors.white : const Color(0xFF333333),
                      width: 1,
                    ),
                  ),
                  child: selected
                      ? const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.black,
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildReview(
      BuildContext context, SellYourCompanyController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: true
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '01',
                        style: GoogleFonts.montserrat(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Raise Details',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: true
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 24),
                  color: AppColors.whiteColor,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: true
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '02',
                        style: GoogleFonts.montserrat(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Company',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: true
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 24),
                  color: AppColors.whiteColor,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: true
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '03',
                        style: GoogleFonts.montserrat(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'About Raise',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: true
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 24),
                  color: AppColors.whiteColor,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: true
                            ? const Color(0xFF050505)
                            : const Color(0xFF151515),
                        border: Border.all(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF292929),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '04',
                        style: GoogleFonts.montserrat(
                          color: true
                              ? const Color(0xFFE8E8E8)
                              : const Color(0xFF555555),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Review',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: true
                            ? const Color(0xFFBDBDBD)
                            : const Color(0xFF555555),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Review your request',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Make sure everything looks right before you publish.',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF777777),
              fontSize: 12,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 27, 24, 27),
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'NovaNest',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 7),
                              Container(
                                width: 14,
                                height: 14,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFA855F7),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'FinTech ·',
                            style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Bengaluru',
                            style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Obx(()=> Container(
                      width: 100,
                      height: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.darkGreyColor,
                          width: 1,
                        ),
                      ),
                      child: controller.selectedImage.value != null
                          ? Image.file(
                        controller.selectedImage.value!,
                        fit: BoxFit.cover,
                      )
                          : const Icon(
                        Icons.image,
                        size: 30,
                      ),
                    )),
                  ],
                ),

                const SizedBox(height: 29),
                const Text(
                  '“Expanding into new markets while growing our product and sales team.”',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Sale Details',
                style: GoogleFonts.montserrat(
                  color: AppColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  controller.clickForBack(1);
                },
                child: Row(
                  children: [
                    Text(
                      'Edit',
                      style: GoogleFonts.montserrat(
                        color: AppColors.whiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFF2C2C2C),
                width: 1,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Asking Price',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF777777),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Text(
                          '₹2,50,00,000',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFFEDEDED),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Asking Price',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF777777),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Text(
                          'Full Acquisition',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFFEDEDED),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Reason for Selling',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF777777),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Text(
                          'Founder Exit',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFFEDEDED),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Expected Timeline',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF777777),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Text(
                          '1–3 Months',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFFEDEDED),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Business Snapshot',
                style: GoogleFonts.montserrat(
                  color: AppColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  controller.clickContinueButton(2);
                },
                child: Row(
                  children: [
                    Text(
                      'Edit',
                      style: GoogleFonts.montserrat(
                        color: AppColors.whiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFF2C2C2C),
                width: 1,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Annual Revenue',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF777777),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Text(
                          '₹1,20,00,000',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFFEDEDED),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.darkGreyColor,
                ),
                SizedBox(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Profitability',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF777777),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Text(
                          'Profitable',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFFEDEDED),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: AppColors.darkGreyColor),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 17, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Additional Information',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF777777),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'clients, Experienced team and solid\n'
                        'product-market fit.',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFFEDEDED),
                          fontSize: 15,
                          height: 1.55,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 26),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.postSubmitButton();
                      // List company for sale
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
                      'List Company For Sale',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'You can edit or pause your listing anytime.',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
