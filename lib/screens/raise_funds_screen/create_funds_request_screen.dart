import 'package:dotted_border/dotted_border.dart';
import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/raise_funds_request_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../constants/app_images.dart';

class CreateFundsRequestScreen extends StatelessWidget {
  int selectedPurpose = 1;
  int selectedInvestor = 1;


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RaiseFundsRequestController(),
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
                          'Create Funding Request',
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
      BuildContext context, RaiseFundsRequestController controller) {
    switch (controller.currentStep.value) {
      case 0:
        return _buildRaiseData(context, controller);

      case 1:
        return _buildCompany(context, controller);

      case 2:
        return _buildAboutRaise(context, controller);

      case 3:
        return _buildReview(context, controller);

      default:
        return const SizedBox();
    }
  }

  Widget _buildRaiseData(
      BuildContext context, RaiseFundsRequestController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Raise Details',
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
              Expanded(
                child: Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 18),
                  color: const Color(0xFF242424),
                ),
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
                          color: false ? Colors.white : const Color(0xFF262626),
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
              Expanded(
                child: Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 18),
                  color: const Color(0xFF242424),
                ),
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
                          color: false ? Colors.white : const Color(0xFF262626),
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
                      'About Raise',
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
              Expanded(
                child: Container(
                  width: 12,
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 18),
                  color: const Color(0xFF242424),
                ),
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
                'How much are you looking to raise?',
                style: GoogleFonts.montserrat(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Tell us how much capital you are looking to raise.',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF777777),
                  fontSize: 12,
                  fontWeight: FontWeight.w500
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
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: const Icon(
                                Icons.currency_rupee,
                                color: AppColors.whiteColor,
                              ),
                              hintText: 'Enter ammount...',
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
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 14,
                            color: AppColors.whiteColor,
                          ),
                        ],
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
                'What stage is your company?',
                style: GoogleFonts.montserrat(
                  color: AppColors.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 11),
              Obx(
                    () => Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    controller.stageList.length,
                        (index) {
                      final selected =
                          controller.selectedPurpose.value == index;
                      return GestureDetector(
                        onTap: () {
                          controller.selectedPurpose.value = index;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0xFF101010)
                                : const Color(0xFF111111),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: selected
                                  ? AppColors.whiteColor
                                  : const Color(0xFF171717),
                              width: selected ? 1.2 : 1,
                            ),
                          ),
                          child: Text(
                            controller.stageList[index].name,
                            style: GoogleFonts.montserrat(
                              color: selected
                                  ? AppColors.whiteColor
                                  : const Color(0xFF777777),
                              fontSize: 10,
                              fontWeight: selected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What is the purpose of this raise?',
                style: GoogleFonts.montserrat(
                  color: AppColors.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Select the primary purpose for raising funds.',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF6D6D6D),
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 12),
              Obx(
                () => ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.purposeList.length,
                    itemBuilder: (context, index) {
                      final isSelected =
                          controller.selectedInvestor.value == index;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 9),
                        child: _buildInvestorCard(
                          index,
                          controller,
                          isSelected,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
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
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCompany(
      BuildContext context, RaiseFundsRequestController controller) {
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
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(height: 25),
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
                'Upload company logo',
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGreyColor),
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
                'Industry',
                style: GoogleFonts.montserrat(
                  color: AppColors.darkGreyColor,
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

              // Text(
              //   'Company Stage',
              //   style: GoogleFonts.montserrat(
              //     color: Color(0xFF858585),
              //     fontSize: 12,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
              // const SizedBox(height: 8),
              // Container(
              //   height: 53,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFF111111),
              //     borderRadius: BorderRadius.circular(11),
              //     border: Border.all(
              //       color: const Color(0xFF2B2B2B),
              //     ),
              //   ),
              //   child: TextField(
              //     style: const TextStyle(
              //       color: Color(0xFFE7E7E7),
              //       fontSize: 15,
              //     ),
              //     cursorColor: AppColors.whiteColor,
              //     decoration: const InputDecoration(
              //       contentPadding: EdgeInsets.symmetric(horizontal: 16),
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),

              const SizedBox(height: 20),
              Text(
                'GST Number',
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
              const SizedBox(height: 20),
              Text(
                'CIN Number',
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
              height: 57,
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

  Widget _buildAboutRaise(
      BuildContext context, RaiseFundsRequestController controller) {
    final TextEditingController raiseController = TextEditingController(
      text:
          "We’re raising ₹75L to expand into 3 new cities, grow our sales team and improve our product.",
    );

    String selectedFundingTime = '1–3 Months';

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tell investors about your raise',
                  style: GoogleFonts.montserrat(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  'Tell investors a little about the company you’re',
                  style: GoogleFonts.montserrat(
                    color: Color(0xFF737373),
                    fontSize: 12,
                    height: 1.45,
                  ),
                ),
                Text(
                  'raising for.',
                  style: GoogleFonts.montserrat(
                    color: Color(0xFF737373),
                    fontSize: 12,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 23),
                Container(
                  height: 205,
                  decoration: BoxDecoration(
                    color: const Color(0xFF111111),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFF303030),
                      width: 1,
                    ),
                  ),
                  child: Stack(
                    children: [
                      TextField(
                        controller: raiseController,
                        maxLines: 7,
                        maxLength: 500,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Color(0xFFE7E7E7),
                          fontSize: 14,
                          height: 1.45,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                          contentPadding: EdgeInsets.fromLTRB(
                            16,
                            16,
                            16,
                            28,
                          ),
                          hintText:
                              'What are you planning to achieve with this funding?',
                          hintStyle: TextStyle(
                            color: Color(0xFF686868),
                            fontSize: 11,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 13,
                        bottom: 14,
                        child: ValueListenableBuilder<TextEditingValue>(
                          valueListenable: raiseController,
                          builder: (context, value, child) {
                            return Text(
                              '${value.text.length}/500',
                              style: const TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 10,
                              ),
                            );
                          },
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
                const Text(
                  'When do you need the funding?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 17),

                // Row(
                //   children: [
                //     Expanded(
                //       child: _fundingOption('Immediately'),
                //     ),
                //     const SizedBox(width: 12),
                //     Expanded(
                //       child: _fundingOption('1–3 Months'),
                //     ),
                //   ],
                // ),

                const SizedBox(height: 11),

                // Row(
                //   children: [
                //     Expanded(
                //       child: _fundingOption('3–6 Months'),
                //     ),
                //     const SizedBox(width: 12),
                //     Expanded(
                //       child: _fundingOption('6+ Months'),
                //     ),
                //   ],
                // ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pitch Deck',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  'Help investors understand your business',
                  style: TextStyle(
                    color: Color(0xFF747474),
                    fontSize: 11,
                    height: 1.5,
                  ),
                ),

                Text(
                  'better.',
                  style: TextStyle(
                    color: Color(0xFF747474),
                    fontSize: 11,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: 18),

                // _buildUploadedFile(),
              ],
            ),
            Container(
              height: 74,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF0C0C0C),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFF292929),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  // PDF icon
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF171717),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.insert_drive_file,
                          color: Color(0xFF858585),
                          size: 23,
                        ),
                        Positioned(
                          bottom: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 1,
                            ),
                            color: const Color(0xFF858585),
                            child: const Text(
                              'PDF',
                              style: TextStyle(
                                color: Color(0xFF171717),
                                fontSize: 6,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'NovaNest_Pitch_Deck.pdf',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFFD8D8D8),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '2.4 MB · ',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.darkGreyColor,
                                  fontSize: 10,
                                ),
                              ),
                              TextSpan(
                                text: 'Uploaded',
                                style: GoogleFonts.montserrat(
                                  color: Color(0xFF49B887),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Icon(
                    Icons.close,
                    color: Color(0xFF9A9A9A),
                    size: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 57,
              child: ElevatedButton(
                onPressed: () {
                  controller.clickContinueButton(3);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.blackColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _buildReview(
      BuildContext context, RaiseFundsRequestController controller) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                fontSize: 10,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 22),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.fromLTRB(
                24,
                27,
                24,
                22,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF101010),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xFF8A8A8A),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'NovaNest',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(
                                  Icons.verified,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Text(
                              'FinTech ·',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF858585),
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Bengaluru',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF858585),
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 26),
                          ],
                        ),
                      ),
                      Obx(() => Container(
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

                  // Raising
                  Text(
                    'Raising',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF858585),
                      fontSize: 11,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    '₹75L',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    'Seed · Market Expansion',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 27),

                  // Description
                  Text(
                    '“Expanding into new markets while\ngrowing our product and sales team.”',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF858585),
                      fontSize: 13,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 23),

                  Container(
                    height: 1,
                    color: const Color(0xFF292929),
                  ),

                  const SizedBox(height: 18),

                  // Bottom stats
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Goal',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF686868),
                                fontSize: 9,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              '₹75L',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Timeline',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF686868),
                                fontSize: 9,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              '1-3MO',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Stage',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF686868),
                                fontSize: 9,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              'Seed',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Raise Details',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Go back to raise details step
                    // setState(() {
                    //   currentStep = 0;
                    // });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Edit',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 14,
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
                color: const Color(0xFF101010),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFF242424),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 56,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Funding Goal',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF777777),
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Text(
                            '₹75L',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),

                  // _detailDivider(),

                  SizedBox(
                    height: 56,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Stage',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF777777),
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Text(
                            'Seed',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 56,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Purpose',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF777777),
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Text(
                            'Market Expansion',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Divider(),

                  SizedBox(
                    height: 56,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Timeline',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF777777),
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Text(
                            '1–3 Months',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            // const SizedBox(height: 26),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Pitch Deck',
                    style: GoogleFonts.montserrat(
                      color: AppColors.whiteColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Replace pitch deck
                  },
                  child: Text(
                    'Replace',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 74,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF101010),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFF242424),
                ),
              ),
              child: Row(
                children: [
                  // PDF icon
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: const Color(0xFF191919),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.picture_as_pdf,
                      color: Color(0xFFFF3B4A),
                      size: 21,
                    ),
                  ),

                  const SizedBox(width: 13),

                  // File information
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NovaNest_Pitch_Deck.pdf',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '2.4 MB',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFF666666),
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Ready
                  Row(
                    children: [
                      const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 14,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Ready',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 20),
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
                    controller.clickSubmitButton();

                    // Get.snackbar(
                    //   'Success',
                    //   'Your request has been submitted',
                    //   snackPosition: SnackPosition.TOP,
                    //   backgroundColor: Colors.white,
                    //   colorText: Colors.black,
                    //   margin: const EdgeInsets.all(16),
                    //   borderRadius: 12,
                    //   duration: const Duration(seconds: 2),
                    // );
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
                    'Publish Funding',
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Text(
                'You can edit or pause your request anytime.',
                style: GoogleFonts.montserrat(
                  color: const Color(0xFF666666),
                  fontSize: 9,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInvestorCard(
    int index,
    RaiseFundsRequestController controller,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        controller.selectInvestor(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.whiteColor : const Color(0xFF292929),
            width: isSelected ? 1.2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //   padding: EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(color: AppColors.whiteColor, width: 1)),
            //   child: Icon(
            //     investor.icon,
            //     size: 32,
            //     color: AppColors.whiteColor,
            //   ),
            // ),
            const SizedBox(
              width: 10,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.purposeList[index].name,
                    style: GoogleFonts.montserrat(
                        color: AppColors.whiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  // Text(
                  //   '${controller.purposeList[index].subtitle},${investor.subtitle}',
                  //   style: GoogleFonts.montserrat(
                  //     color: AppColors.darkGreyColor,
                  //     fontSize: 13,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),

            // Radio button
            GestureDetector(
              onTap: () {
                controller.selectInvestor(index);
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.whiteColor : Colors.transparent,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.whiteColor
                        : const Color(0xFF444444),
                    width: 1,
                  ),
                ),
                child: isSelected
                    ? const Icon(
                        Icons.radio_button_checked,
                        size: 13,
                        color: Colors.black,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InvestorOption {
  final IconData icon;
  final String name;
  final String subtitle;

  const _InvestorOption({
    required this.icon,
    required this.name,
    required this.subtitle,
  });
}
