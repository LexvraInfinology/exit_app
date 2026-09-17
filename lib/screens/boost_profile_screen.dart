import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/boost_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';
import '../models/choose_achieve_and_industry_model_class.dart';


class BoostProfileScreen extends StatelessWidget {
  BoostProfileScreen({super.key});
  static const _stepLabels = [
    'Goal',
    'Audience',
    'Budget & Duration',
    'Review',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BoostProfileController(),
      builder: (controller) {
        return PopScope(
          canPop: controller.currentStep.value == 0,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            controller.clickForBack(controller.currentStep.value);
          },
          child: Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      (MediaQuery.sizeOf(context).width < 360 ? 16.0 : 24.0) - 8,
                      8,
                      (MediaQuery.sizeOf(context).width < 360 ? 16.0 : 24.0) - 8,
                      0,
                    ),
                    child: Row(
                      children: [
                        _headerAction(
                          onTap: () {
                            controller.clickForBack(
                              controller.currentStep.value,
                            );
                          },
                          icon: Image.asset(
                            AppImages.backIcon,
                            width: 42,
                            height: 42,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Boost Your Request',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteColor),
                          ),
                        ),
                        _headerAction(
                          onTap: controller.clickNotificationIcon,
                          icon: const Icon(
                            Icons.notifications_none_rounded,
                            size: 36,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      layoutBuilder: (currentChild, previousChildren) {
                        return Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            ...previousChildren,
                            if (currentChild != null) currentChild,
                          ],
                        );
                      },
                      child: _buildStepContent(context, controller),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStepContent(
      BuildContext context,
      BoostProfileController controller,
      ) {
    switch (controller.currentStep.value) {
      case 0:
        return _buildGoal(context, controller);
      case 1:
        return _buildAudience(context, controller);
      case 2:
        return _buildBudget(context, controller);
      case 3:
        return _buildReview(context, controller);
      default:
        return const SizedBox();
    }
  }

  Widget _headerAction({
    required VoidCallback onTap,
    required Widget icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: 42,
          height: 42,
          child: Center(child: icon),
        ),
      ),
    );
  }

  Widget _stepper(int current) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < 4; i++) ...[
            if (i > 0)
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.5),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: AppColors.containerBorderColor,
                  ),
                ),
              ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _stepCircle(i, current),
                  const SizedBox(height: 8),
                  Text(
                    _stepLabels[i],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        color: i <= current
                            ? AppColors.whiteColor
                            : AppColors.whiteColor.withAlpha(4),
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _stepCircle(int index, int current) {
    final completed = index < current;
    final active = index == current;
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: completed
            ? AppColors.whiteColor
            : active
            ? Colors.transparent
            : AppColors.containerBackgroundColor,
        border: Border.all(
          color: completed
              ? AppColors.blackColor
              : active
              ? AppColors.whiteColor
              : AppColors.containerBorderColor,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '0${index + 1}',
        style: GoogleFonts.montserrat(
            color: completed
                ? AppColors.blackColor
                : active
                ? AppColors.whiteColor
                : AppColors.whiteColor.withAlpha(4),
            fontSize: 12,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _primaryButton(String label, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.blackColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor),
        ),
      ),
    );
  }

  Widget _radio(bool selected) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.whiteColor : AppColors.containerBorderColor,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: selected
          ? Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
        ),
      )
          : null,
    );
  }

  Widget _optionCard({
    required ChooseAchieveAndIndustryModelClass option,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? Colors.transparent : AppColors.containerBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.whiteColor : AppColors.containerBorderColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _radio(selected),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.title,
                    style: GoogleFonts.montserrat(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    option.description,
                    style: GoogleFonts.montserrat(
                        color: AppColors.darkGreyColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          color: AppColors.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }

  Widget _buildGoal(
      BuildContext context,
      BoostProfileController controller,
      ) {
    return Column(
      key: const ValueKey('goal'),
      children: [
        _stepper(0),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            itemCount: controller.options_choose.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('What do you want to achieve?'),
                    const SizedBox(height: 16),
                    Obx(
                          () => _optionCard(
                        option: controller.options_choose[index],
                        selected: controller.selectedGoalIndex.value == index,
                        onTap: () => controller.selectGoal(index),
                      ),
                    ),
                  ],
                );
              }
              return Obx(
                    () => _optionCard(
                  option: controller.options_choose[index],
                  selected: controller.selectedGoalIndex.value == index,
                  onTap: () => controller.selectGoal(index),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: _primaryButton(
            'Continue',
                () => controller.clickContinueButton(1),
          ),
        ),
      ],
    );
  }

  Widget _buildAudience(
      BuildContext context,
      BoostProfileController controller,
      ) {
    return Column(
      key: const ValueKey('audience'),
      children: [
        _stepper(1),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            itemCount: controller.options_choose_industry.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('Who should see your request?'),
                    const SizedBox(height: 16),
                    Obx(
                          () => _optionCard(
                        option: controller.options_choose_industry[index],
                        selected:
                        controller.selectedAudienceIndex.value == index,
                        onTap: () => controller.selectAudience(index),
                      ),
                    ),
                  ],
                );
              }
              return Obx(
                    () => _optionCard(
                  option: controller.options_choose_industry[index],
                  selected: controller.selectedAudienceIndex.value == index,
                  onTap: () => controller.selectAudience(index),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: _primaryButton(
            'Continue',
                () => controller.clickContinueButton(2),
          ),
        ),
      ],
    );
  }

  Widget _buildBudget(
      BuildContext context,
      BoostProfileController controller,
      ) {
    return Column(
      key: const ValueKey('budget'),
      children: [
        _stepper(2),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle('Set your boost'),
                const SizedBox(height: 17),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '₹',
                        style: GoogleFonts.montserrat(
                            color: AppColors.whiteColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      IntrinsicWidth(
                        child: TextField(
                          controller: controller.boostAmountController,
                          keyboardType: TextInputType.number,
                          maxLength: 5,
                          onChanged: controller.onAmountTyped,
                          style: GoogleFonts.montserrat(
                              color: AppColors.whiteColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            counterText: '',
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.edit_outlined,
                          color: AppColors.darkGreyColor,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Obx(
                        () => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withAlpha(12),
                        border: Border.all(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'Estimated duration · ${controller.boostDuration.value}',
                        style: GoogleFonts.montserrat(
                            color: AppColors.whiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 37),
                Obx(
                      () => SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 5,
                      activeTrackColor: AppColors.whiteColor,
                      inactiveTrackColor: AppColors.containerBorderColor,
                      thumbColor: AppColors.whiteColor,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 9,
                      ),
                      overlayShape: SliderComponentShape.noOverlay,
                    ),
                    child: Slider(
                      value: controller.boostSliderValue.value,
                      min: 0,
                      max: 100,
                      onChanged: controller.updateBoost,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.containerBackgroundColor,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.containerBorderColor),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.groups,
                                    color: AppColors.darkGreyColor,
                                    size: 15,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Estimated Reach',
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Obx(
                                    () => Text(
                                  controller.estimatedReach.value,
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.whiteColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'relevant investors',
                                style: GoogleFonts.montserrat(
                                    color: AppColors.darkGreyColor,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          color: AppColors.containerBorderColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      color: AppColors.darkGreyColor,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Duration',
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.darkGreyColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Obx(
                                      () => Text(
                                    controller.boostDuration.value,
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.whiteColor,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'of promotion',
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.darkGreyColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _sectionTitle('When should your boost start?'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Obx(
                            () => _boostDateField(
                          title: 'Start date',
                          value: controller.startDate.value,
                          icon: Icons.calendar_today_outlined,
                          onTap: () => controller.pickStartDate(context),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Obx(
                            () => _boostDateField(
                          title: 'Start time',
                          value: controller.startTime.value,
                          icon: Icons.access_time,
                          onTap: () => controller.pickStartTime(context),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Your boost will start at the selected time after payment.',
                  style: GoogleFonts.montserrat(
                      color: AppColors.darkGreyColor,
                      fontSize: 11,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: _primaryButton(
            'Continue',
                () => controller.clickContinueButton(3),
          ),
        ),
      ],
    );
  }

  Widget _buildReview(
      BuildContext context,
      BoostProfileController controller,
      ) {
    return Column(
      key: const ValueKey('review'),
      children: [
        _stepper(3),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  'Review your boost',
                  style: GoogleFonts.montserrat(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.containerBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.containerBorderColor),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor.withAlpha(05),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.containerBorderColor),
                          ),
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AppImages.novaNestLogo,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      'NovaNest',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  SvgPicture.asset(
                                    AppImages.boostVerified,
                                    width: 10,
                                    height: 10,
                                  ),
                                ],
                              ),
                              Text(
                                'FinTech · Seed · Bengaluru',
                                style: GoogleFonts.montserrat(
                                    color: AppColors.darkGreyColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Raising',
                              style: GoogleFonts.montserrat(
                                  color: AppColors.darkGreyColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '₹75L',
                              style: GoogleFonts.montserrat(
                                  color: AppColors.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(height: 1, color: AppColors.containerBorderColor),
                    const SizedBox(height: 20),
                    Obx(
                          () => _reviewRow(
                        asset: AppImages.boostGoal,
                        glyphWidth: 14,
                        glyphHeight: 14,
                        label: 'Goal',
                        value: controller.selectedGoalTitle,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                          () => _reviewRow(
                        asset: AppImages.boostAudience,
                        glyphWidth: 17.5,
                        glyphHeight: 14,
                        label: 'Audience',
                        value: controller.selectedAudienceTitle,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                          () => _reviewRow(
                        asset: AppImages.boostBudget,
                        glyphWidth: 14,
                        glyphHeight: 14,
                        label: 'Budget',
                        value: '₹${controller.boostAmount.value}',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                          () => _reviewRow(
                        asset: AppImages.boostDuration,
                        glyphWidth: 12.25,
                        glyphHeight: 14,
                        label: 'Estimated duration',
                        value: controller.boostDuration.value,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                          () => _reviewRow(
                        asset: AppImages.boostReach,
                        glyphWidth: 14,
                        glyphHeight: 14,
                        label: 'Estimated reach',
                        value: '${controller.estimatedReach.value} investors',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: SvgPicture.asset(
                        AppImages.boostInfo,
                        width: 12,
                        height: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Reach and duration are estimates and may vary based on your selected audience.',
                        style: GoogleFonts.montserrat(
                            color: AppColors.darkGreyColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.containerBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.containerBorderColor),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.montserrat(
                              color: AppColors.darkGreyColor,
                              fontSize: 12),
                        ),
                        const SizedBox(height: 2),
                        Obx(
                              () => Text(
                            '₹${controller.boostAmount.value}',
                            style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.boostLock,
                              width: 14,
                              height: 14,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Secure payment',
                              style: GoogleFonts.montserrat(
                                  color: AppColors.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '100% safe & secure',
                          style: GoogleFonts.montserrat(
                              color: AppColors.darkGreyColor,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: _primaryButton(
            'Continue to payment',
            controller.postSubmitButton,
          ),
        ),
      ],
    );
  }

  Widget _reviewRow({
    required String asset,
    required double glyphWidth,
    required double glyphHeight,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: Center(
            child: SvgPicture.asset(
              asset,
              width: glyphWidth,
              height: glyphHeight,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.montserrat(
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.montserrat(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ],
    );
  }

  Widget _boostDateField({
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
              color: AppColors.darkGreyColor,
              fontSize: 11),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 58,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.containerBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.containerBorderColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: GoogleFonts.montserrat(
                        color: AppColors.whiteColor,
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Icon(icon, color: AppColors.darkGreyColor, size: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
