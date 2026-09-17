import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/constants/app_images.dart';
import 'package:exit_app/controller/choose_user_controller.dart';
import 'package:exit_app/models/confirm_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ConfirmPlanWidget({
  required ConfirmPlanModel plan,
}) {
  final billedAmount =
      plan.price.contains('.') ? plan.price : '${plan.price}.00';
  return GetBuilder<ChooseUserController>(
    builder: (controller) {
      return Builder(
        builder: (context) {
          final width = MediaQuery.sizeOf(context).width;
          return Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: controller.clickBack,
                          child: Image.asset(
                            AppImages.backIcon,
                            width: 42,
                            height: 42,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Confirm Your Plan',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _PlanSummaryCard(
                            width: width - 16 * 2,
                            plan: plan,
                            onCreditsTap: () =>
                                controller.clickWhatAreCredits(context),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Billing Summary',
                            style: GoogleFonts.montserrat(
                              color: AppColors.darkGreyColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: width - 16 * 2,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.containerBackgroundColor,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.containerBorderColor,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Plan (${plan.title})',
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      billedAmount,
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.whiteColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const Divider(
                                  height: 1,
                                  color: AppColors.containerBorderColor,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Total',
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      billedAmount,
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.whiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: GestureDetector(
                              onTap: controller.clickAgreeToTerms,
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.checkboxFillColor,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: controller.agreedToTerms
                                            ? AppColors.white60
                                            : AppColors.darkGreyColor1,
                                      ),
                                    ),
                                    child: controller.agreedToTerms
                                        ? SvgPicture.asset(
                                            AppImages.confirmPlanCheck,
                                            width: 8.75,
                                            height: 10,
                                            colorFilter: const ColorFilter.mode(
                                              AppColors.whiteColor,
                                              BlendMode.srcIn,
                                            ),
                                          )
                                        : null,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 12,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text: 'I agree to the ',
                                          ),
                                          TextSpan(
                                            text: 'Terms of Service',
                                            style: const TextStyle(
                                              color: AppColors.whiteColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  AppColors.white30,
                                            ),
                                            recognizer:
                                                controller.termsRecognizer,
                                          ),
                                          const TextSpan(text: ' and '),
                                          TextSpan(
                                            text: 'Privacy Policy',
                                            style: const TextStyle(
                                              color: AppColors.whiteColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  AppColors.white30,
                                            ),
                                            recognizer:
                                                controller.privacyRecognizer,
                                          ),
                                          const TextSpan(text: '.'),
                                        ],
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
                  ),
                  Container(
                    width: width,
                    padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.transparent,
                          AppColors.black90,
                          AppColors.blackColor,
                        ],
                        stops: [0, 0.5, 1],
                      ),
                    ),
                    child: Obx(
                      () => SizedBox(
                        height: 58,
                        child: ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () async {
                                  controller.buyPlanApi();
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
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _PlanSummaryCard({
  required double width,
  required ConfirmPlanModel plan,
  required VoidCallback onCreditsTap,
}) {
  return Container(
    width: width,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      border: Border.all(color: AppColors.containerBorderColor),
      gradient: const LinearGradient(
        begin: Alignment(-0.8, -1),
        end: Alignment(1, 1),
        colors: [
          AppColors.containerBackgroundColor,
          AppColors.containerBackgroundColor,
        ],
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          right: -16,
          top: 208,
          child: IgnorePointer(
            child: Opacity(
              opacity: 0.03,
              child: _WatermarkIcon(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  color: AppColors.whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                plan.price,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white05,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.white10),
                ),
                child: Text(
                  plan.credits,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    color: AppColors.white90,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              for (int i = 0; i < plan.benefits.length; i++) ...[
                if (i > 0) const SizedBox(height: 12),
                _BenefitRow(label: plan.benefits[i]),
              ],
              const SizedBox(height: 24),
              const Divider(
                height: 1,
                color: AppColors.containerBorderColor,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: onCreditsTap,
                behavior: HitTestBehavior.opaque,
                child: Row(
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: SvgPicture.asset(
                        AppImages.confirmPlanInfo,
                        width: 12,
                        height: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'What are credits?',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          color: AppColors.darkGreyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7.25,
                      height: 11,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1, top: 1),
                        child: SvgPicture.asset(
                          AppImages.confirmPlanChevron,
                          width: 6.25,
                          height: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _WatermarkIcon() {
  return SvgPicture.asset(
    AppImages.confirmPlanWatermark,
    width: 120,
    height: 120,
    colorFilter: const ColorFilter.mode(
      AppColors.whiteColor,
      BlendMode.srcIn,
    ),
  );
}

Widget _BenefitRow({required String label}) {
  return Row(
    children: [
      Container(
        width: 20,
        height: 21,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.lightGreenColor,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.green20),
        ),
        child: SvgPicture.asset(
          AppImages.confirmPlanCheck,
          width: 8.75,
          height: 10,
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text(
          label,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            color: AppColors.white90,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
