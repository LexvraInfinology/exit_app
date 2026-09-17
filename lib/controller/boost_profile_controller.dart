import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/screens/notification_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/choose_achieve_and_industry_model_class.dart';
import '../screens/post_successfully_created_screen.dart';

class BoostProfileController extends GetxController {
  final TextEditingController boostAmountController =
      TextEditingController(text: '100');
  final RxInt boostAmount = 100.obs;

  final RxDouble boostSliderValue = 0.0.obs;

  final RxString boostDuration = '1 day'.obs;

  final RxString estimatedReach = '120–250'.obs;

  final RxString startDate = ''.obs;

  final RxString startTime = '10:00 AM'.obs;

  DateTime selectedStartDate = DateTime.now();
  TimeOfDay selectedStartTime = const TimeOfDay(hour: 10, minute: 0);

  final List<ChooseAchieveAndIndustryModelClass> options_choose = const [
    ChooseAchieveAndIndustryModelClass(
      title: 'More Investor Views',
      description: 'Show your request to more relevant investors.',
    ),
    ChooseAchieveAndIndustryModelClass(
      title: 'More Connections',
      description: 'Prioritize investors who are likely to be a strong fit.',
    ),
    ChooseAchieveAndIndustryModelClass(
      title: 'More Visibility',
      description:
          'Get your funding request seen by a wider pool of investors.',
    ),
  ];
  final List<ChooseAchieveAndIndustryModelClass> options_choose_industry =
      const [
    ChooseAchieveAndIndustryModelClass(
      title: 'Investors in my industry',
      description: 'Focus on investors interested in your industry',
    ),
    ChooseAchieveAndIndustryModelClass(
      title: 'Investors at my stage',
      description: 'Investors who invest in companies at my stage.',
    ),
    ChooseAchieveAndIndustryModelClass(
      title: 'All relevant investors',
      description: 'Reach the widest pool of investors relevant to my request.',
    ),
  ];

  RxInt selectedGoalIndex = 1.obs;
  RxInt selectedAudienceIndex = 1.obs;
  RxInt currentStep = 0.obs;

  @override
  void onInit() {
    super.onInit();
    selectedStartDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    _syncDateLabel();
  }

  @override
  void onClose() {
    boostAmountController.dispose();
    super.onClose();
  }

  String get selectedGoalTitle =>
      options_choose[selectedGoalIndex.value].title;

  String get selectedAudienceTitle =>
      options_choose_industry[selectedAudienceIndex.value].title;

  void clickContinueButton(int step) {
    if (step >= 1 && step <= 4) {
      currentStep.value = step;
      update();
    }
  }

  void clickNotificationIcon() {
    Get.to(() => NotificationListScreen());
  }

  void clickForBack(int step) {
    if (step > 0) {
      currentStep.value = step - 1;
      update();
      return;
    }
    Get.back();
  }

  void selectGoal(int index) {
    selectedGoalIndex.value = index;
  }

  void selectAudience(int index) {
    selectedAudienceIndex.value = index;
  }

  void updateBoost(double value) {
    boostSliderValue.value = value;
    if (value < 25) {
      boostAmount.value = 100;
      boostDuration.value = '1 day';
      estimatedReach.value = '120–250';
    } else if (value < 50) {
      boostAmount.value = 200;
      boostDuration.value = '2 days';
      estimatedReach.value = '250–450';
    } else if (value < 75) {
      boostAmount.value = 300;
      boostDuration.value = '3 days';
      estimatedReach.value = '400–700';
    } else {
      boostAmount.value = 500;
      boostDuration.value = '5 days';
      estimatedReach.value = '700–1K';
    }

    boostAmountController.text = boostAmount.value.toString();
    update();
  }

  void onAmountTyped(String value) {
    final parsed = int.tryParse(value);
    if (parsed == null) return;
    boostAmount.value = parsed;
    update();
  }

  void postSubmitButton() {
    Get.to(
      () => PostSuccefullyCreatedScreen(
        title: 'Your request is now boosted',
        subtitle:
            'Your funding request is now visible to relevant investors.',
      ),
    );
  }

  Future<void> pickStartDate(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime firstDate = DateTime(
      today.year,
      today.month,
      today.day,
    );

    DateTime initialDate = selectedStartDate;
    if (initialDate.isBefore(firstDate)) {
      initialDate = firstDate;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: DateTime(
        today.year + 4,
        today.month,
        today.day,
      ),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.whiteColor,
              onPrimary: AppColors.blackColor,
              surface: AppColors.containerBackgroundColor,
              onSurface: AppColors.whiteColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedStartDate = DateTime(picked.year, picked.month, picked.day);
      _syncDateLabel();
      update();
    }
  }

  Future<void> pickStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.whiteColor,
              onPrimary: AppColors.blackColor,
              surface: AppColors.containerBackgroundColor,
              onSurface: AppColors.whiteColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (!context.mounted) return;
      selectedStartTime = picked;
      startTime.value = picked.format(context);
      update();
    }
  }

  void _syncDateLabel() {
    startDate.value =
        '${selectedStartDate.day.toString().padLeft(2, '0')} ${_monthName(selectedStartDate.month)} ${selectedStartDate.year}';
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
