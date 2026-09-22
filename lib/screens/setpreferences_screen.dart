import 'package:exit_app/constants/app_images.dart';
import 'package:exit_app/controller/choose_user_controller.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPreferencesScreen extends StatelessWidget {
  const SetPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = keyboardHeight > 0;
    return GetBuilder<ChooseUserController>(
        builder: (controller) { return Scaffold(
      backgroundColor: Colors.black,
      body: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                        Center(child: Image.asset(AppImages.setPrefrenceImage)),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        'Set your preferences',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        'Tell us what fits your investment strategy.',
                        style: TextStyle(color: Colors.white60, fontSize: 16,fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text('Typical Investment',
                        style: TextStyle(color: Colors.white70, fontSize: 13,fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                     CustomTextField(
                       keyboardType: TextInputType.number,
                        controller: controller.preferredInvestmentController.value,
                        hint: 'Enter amount'),
                    const SizedBox(height: 24),
                    const Text('Preferred Stage',
                        style: TextStyle(color: Colors.white70, fontSize: 13,fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    _buildDropdownField(
                      hint: 'Select Industry',
                      value: controller.preferredIndustryController.value.text.trim().isEmpty ? null : controller.preferredIndustryController.value.text.trim(),
                      items: controller.industriesList,
                      onChanged: (val) {
                        if(val != null){
                          controller.onChangeIndustry(val);
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    const Text('Preferred industries',
                        style: TextStyle(color: Colors.white70, fontSize: 13,fontWeight: FontWeight.w600)),
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
                    const SizedBox(height: 24),
                    const Text('Preferred location',
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                    const SizedBox(height: 8),
                     CustomTextField(
                        controller: controller.preferredLocationController.value,
                        hint: 'Enter your Preferred Location'),
                    const SizedBox(height: 24),
                    const Text('Founded',
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                    const SizedBox(height: 8),
                    CustomTextField(
                        controller: controller.foundedController.value,
                        hint: 'Founded'),
                    const SizedBox(height: 24),
                    const Text('Funding Type',
                        style: TextStyle(color: Colors.white70, fontSize: 13,fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    _buildDropdownField(
                      hint: 'Funding Type',
                      value: controller.fundingTypeController.value.text.trim().isEmpty ? null : controller.fundingTypeController.value.text.trim(),
                      items: controller.fundingTypeList,
                      onChanged: (val) {
                        if(val != null){
                          controller.onChangeFundType(val);
                        }
                      },
                    ),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(1.4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.white54,
                          Colors.white12,
                        ],
                        stops: [0.0, 0.45, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 8,
                          spreadRadius: 0,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A1A),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isKeyboardOpen ? const SizedBox(): Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.only(right: 20,left: 20,top: 30,bottom: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: Obx(
                        () =>  GestureDetector(
                    onTap: controller.isLoading.value
                        ? null
                        : () async {
                      controller.setYourPreferencesApi();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: controller.isLoading.value
                            ? const SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        )
                            :const Text(
                          "Continue",
                          style: TextStyle(fontSize: 16.5, color: Colors.black,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );});
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



class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white10,
          width: 0.7,
        ),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        enabled: enabled,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38, fontSize: 15),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}