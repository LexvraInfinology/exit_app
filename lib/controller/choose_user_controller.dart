import 'dart:async';
import 'dart:convert';

import 'package:exit_app/api_utils/api_services.dart';
import 'package:exit_app/common_widgets/confirm_plan_widget.dart';
import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/models/confirm_plan_model.dart';
import 'package:exit_app/models/get_plan_model.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart'
    show MarketplaceIndustriesResponse, MarketplaceIndustry;
import 'package:exit_app/screens/choose_plan_screen.dart';
import 'package:exit_app/screens/create_profile_screen.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/founder_dashboard_screen.dart';
import 'package:exit_app/screens/dashoard_screen/startup_dashboard_screen/startup_dashboard_screen.dart';
import 'package:exit_app/screens/otp_screen.dart';
import 'package:exit_app/screens/privacy_policy_screen.dart';
import 'package:exit_app/screens/setpreferences_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/dashoard_screen/investor_dashboard_screen/investor_dashboard_screen.dart';
import '../screens/phone_number_screen.dart';
import 'investor_dashboard_controller.dart';

class ChooseUserController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  var isLoading = false.obs;
  final ApiServices apiServices = ApiServices();
  final SharedPreferences prefs = Get.find<SharedPreferences>();
  final List<MarketplaceIndustry> industriesList = <MarketplaceIndustry>[];
  final List<MarketplaceIndustry> stagesList = <MarketplaceIndustry>[];

  var isChecked = false.obs;

  void clickCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  final List<TextEditingController> otpControllers = List.generate(
    4,
        (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(
    4,
        (_) => FocusNode(),
  );
  final RxInt focusedIndex = 0.obs;
  final RxInt remainingSeconds = 180.obs;

  Timer? timer;

  bool agreedToTerms = false;
  late final TapGestureRecognizer termsRecognizer;
  late final TapGestureRecognizer privacyRecognizer;

  final phoneNumberController = TextEditingController();
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;

  Rx<TextEditingController> preferredInvestmentController =
      TextEditingController().obs;
  Rx<TextEditingController> preferredLocationController =
      TextEditingController().obs;
  Rx<TextEditingController> preferredStageController =
      TextEditingController().obs;
  Rx<TextEditingController> preferredIndustryController =
      TextEditingController().obs;

  final RxList<Data> planList = <Data>[].obs;

  void onChangeStage(String value) {
    preferredStageController.value.text = value;
    update();
  }

  void onChangeIndustry(String value) {
    preferredIndustryController.value.text = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
    termsRecognizer = TapGestureRecognizer()
      ..onTap = clickTermsOfService;
    privacyRecognizer = TapGestureRecognizer()
      ..onTap = clickPrivacyPolicy;
    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i].addListener(() {
        if (focusNodes[i].hasFocus) {
          focusedIndex.value = i;
        }
      });
    }
  }

  void resendOTP() {
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    remainingSeconds.value = 180;

    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (remainingSeconds.value > 0) {
          remainingSeconds.value--;
        } else {
          timer.cancel();
        }
      },
    );
  }

  void onOtpChanged(int index, String value) {
    if (value.isNotEmpty) {
      // Move forward after entering a digit
      if (index < 3) {
        focusedIndex.value = index + 1;
        focusNodes[index + 1].requestFocus();
      } else {
        // Last OTP box
        focusedIndex.value = index;
        focusNodes[index].unfocus();
      }
    } else {
      // Digit was deleted
      if (index > 0) {
        focusedIndex.value = index - 1;
        focusNodes[index - 1].requestFocus();
      }
    }

    update();
  }

  String get otp {
    return otpControllers.map((controller) => controller.text).join();
  }

  void verifyAndContinue() {
    final enteredOtp = otp;

    if (enteredOtp.length != 6) {
      Get.snackbar(
        'Invalid OTP',
        'Please enter the complete 6-digit OTP.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.containerBorderColor,
        colorText: AppColors.whiteColor,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );

      return;
    }

    debugPrint('Entered OTP: $enteredOtp');

    // Navigate to next screen
    //
    // Get.to(
    //   () => const NextScreen(),
    //   transition: Transition.rightToLeft,
    // );
  }

  @override
  void onClose() {
    timer?.cancel();
    termsRecognizer.dispose();
    privacyRecognizer.dispose();

    for (final controller in otpControllers) {
      controller.dispose();
    }

    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }

    super.onClose();
  }

  void selectPath(int index) {
    selectedIndex.value = index;
  }

  void continuePressed() {
    print('object click ${selectedIndex.value}');
    Get.to(() => const PhoneNumberScreen());
  }

  void clickSendOTPButton() {
    print('object role value ${selectedIndex.value}');
    sendOTP();
  }

  void clickVerifyOTP() {
    verifyOTP(otp);
  }

  void clickPrivacyPolicyAndTermCondition() {
    Get.to(() => PrivacyPolicyScreen());
  }

  void clickCreateProfile() {
    if (selectedIndex.value == 0) {
      phoneNumberController.text = '';
      otpControllers.clear();
      clickCreateProfileInvestor();
    } else if (selectedIndex.value == 1) {
      phoneNumberController.text = '';
      otpControllers.clear();
      createProfileApi();
    } else {
      Get.to(() => const ChoosePlanScreen());
    }
  }

  void clickChoosePlanButton(ConfirmPlanModel plan) {
    agreedToTerms = false;
    update();
    Get.to(
          () => ConfirmPlanWidget(plan: plan),
    );
  }

  void clickBack() {
    Get.back();
  }

  void clickAgreeToTerms() {
    agreedToTerms = !agreedToTerms;
    update();
  }

  void clickTermsOfService() {
    Get.to(() => const PrivacyPolicyScreen());
  }

  void clickPrivacyPolicy() {
    Get.to(() => const PrivacyPolicyScreen());
  }

  void clickWhatAreCredits(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final viewInsets = MediaQuery.viewInsetsOf(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: viewInsets.bottom),
          child: Container(
            width: size.width,
            constraints: BoxConstraints(maxHeight: size.height * 0.5),
            decoration: const BoxDecoration(
              color: AppColors.containerBackgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What are credits?',
                      style: GoogleFonts.montserrat(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Credits are used to connect with investors, create funding posts, list your company for sale, and boost visibility on EXIT.',
                      style: GoogleFonts.montserrat(
                        color: AppColors.darkGreyColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void clickContinueToPayment() {
    if (!agreedToTerms) {
      Get.snackbar(
        'Terms required',
        'Please agree to the Terms of Service and Privacy Policy.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.containerBorderColor,
        colorText: AppColors.whiteColor,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    if (selectedIndex.value == 1) {
      Get.to(() => FounderDashboardScreen());
    } else {
      Get.to(() => StartupDashboardScreen());
    }
  }

  Future<void> sendOTP() async {
    final phoneNumber = phoneNumberController.text.trim();
    if (phoneNumber.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill phone number',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
    } else if (phoneNumber.length <= 9) {
      Get.snackbar(
        'Error',
        'Please check mobile number length',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.containerBorderColor,
        colorText: AppColors.whiteColor,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    } else if (!isChecked.value) {
      Get.snackbar(
        'Error',
        'Please agree to the Terms of Service and Privacy Policy.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.containerBorderColor,
        colorText: AppColors.whiteColor,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }
    var role = '';
    try {
      if (selectedIndex.value == 0) {
        role = 'investor';
      } else if (selectedIndex.value == 1) {
        role = 'founder';
      } else {
        role = 'startup';
      }

      isLoading.value = true;
      final response = await apiServices.sendOTP(
        phoneNumber,
        role,
      );
      print("Status Codebb: ${response?.status_code}${role} ${selectedIndex.value}");
      print("Message: ${response?.message}");
      if (response?.status_code == 200) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          response?.message ?? 'OTP sent successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
        Get.to(() => OTPScreen());
        // phoneNumberController.text='';
      } else {
        isLoading.value = false;
        Get.snackbar(
          'OTP Failed',
          response?.message ?? 'Authentication failed',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      }
    } catch (e) {
      print('sendOTP controller error: $e');
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.blackColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOTP(String otp_value) async {
    if (otp_value.length != 4) {
      Get.snackbar(
        'Error',
        'Please fill OTP',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }
    var role = '';
    try {
      if (selectedIndex.value == 0) {
        role = 'investor';
      } else if (selectedIndex.value == 1) {
        role = 'founder';
      } else {
        role = 'startup';
      }
      isLoading.value = true;
      final response = await apiServices.verifyOTP(
        phoneNumberController.text.trim(),
        role,
        otp_value,
      );

      print('body := ${role}');
      // if (response == null) {
      //   Get.snackbar(
      //     'Error',
      //     'No response from server',
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.redAccent,
      //     colorText: AppColors.whiteColor,
      //   );
      //   return;
      // }
      print("Status Codebb: ${response?.status_code}");
      print("Message: ${response?.message}");

      if (response?.status_code == 200) {
        Get.snackbar(
          'Success',
          response?.message ?? 'OTP verify successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );

        await prefs.setString('id', response?.data?.user?.id.toString() ?? '');
        await prefs.setString(
            'role', response?.data?.user?.role.toString() ?? '');
        print('objectempty ${prefs.getString('token')}');

        if (prefs.getString('token') != null) {
          // response?.data?.user?.role == 'investor'
          //     ? Get.to(() => InvestorDashBoardScreen())
          //     : response?.data?.user?.role == 'founder'
          //         ? Get.to(() => FounderDashboardScreen())
          //         : Get.to(() => StartupDashboardScreen());
          if (response?.data?.user?.role == 'investor') {
          await  Get.put(InvestorDashboardController()).loadHomePage();
          }
          response?.data?.user?.has_profile == true
              ? response?.data?.user?.role == 'investor'
              ? Get.to(() => InvestorDashBoardScreen())
              : response?.data?.user?.role == 'founder'
              ? Get.to(() => FounderDashboardScreen())
              : Get.to(() => StartupDashboardScreen())
              : Get.to(() => const CreateProfileScreen());
        } else {
          await prefs.setString('token', response?.data?.token ?? '');

          await prefs.setString(
              'id', response?.data?.user?.id.toString() ?? '');
          print('objectcc ${prefs.getString('token')}');
          response?.data?.user?.has_profile == true
              ? response?.data?.user?.role == 'investor'
              ? Get.to(() => InvestorDashBoardScreen())
              : response?.data?.user?.role == 'founder'
              ? Get.to(() => FounderDashboardScreen())
              : Get.to(() => StartupDashboardScreen())
              : Get.to(() => const CreateProfileScreen());
        }
        otp_value = '';
      } else {
        isLoading.value = false;
        Get.snackbar(
          'OTP Failed',
          response?.message ?? 'Authentication failed',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: AppColors.whiteColor,
        );
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> clickCreateProfileInvestor() async {
    final first_name = firstNameController.value.text.trim();
    final last_name = lastNameController.value.text.trim();
    final email = emailController.value.text.trim();
    final location = locationController.value.text.trim();
    if (first_name.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter first name',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    } else if (last_name.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter last name',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    } else if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter email',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    } else if (location.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter location',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    }
    isLoading.value = true;
    await getMarketplaceStagesApi();
    await getMarketplaceIndustriesApi();
    Get.to(() => const SetPreferencesScreen());
    isLoading.value = false;
  }

  Future<void> createProfileApi() async {
    final first_name = firstNameController.value.text.trim();
    final last_name = lastNameController.value.text.trim();
    final email = emailController.value.text.trim();
    final location = locationController.value.text.trim();
    if (first_name.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter first name',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    } else if (last_name.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter last name',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    } else if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter email',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    } else if (location.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter location',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    }
    try {
      isLoading.value = true;
      final response = await apiServices.createProfileApi(
        first_name,
        last_name,
        email,
        location,
      );
      print("Status Code: ${response?.statusCode}");
      print("Message: ${response?.message}");
      if (response?.statusCode == 201) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          response?.message ?? 'Profile create successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
        Get.to(() => const ChoosePlanScreen());
        getPlanApi();
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Profile Creation Failed',
          response?.message ?? 'Creation failed',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      }
    } catch (e) {
      print('object ${e}');
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.blackColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> setYourPreferencesApi() async {
    final preferredInvestment = preferredInvestmentController.value.text.trim();
    final preferredLocation = preferredLocationController.value.text.trim();
    final preferredStage = preferredStageController.value.text.trim();
    final preferredIndustry = preferredIndustryController.value.text.trim();
    final firstName = firstNameController.value.text.trim();
    final lastName = lastNameController.value.text.trim();
    final email = emailController.value.text.trim();
    final location = locationController.value.text.trim();
    if (preferredInvestment.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter preferred investment',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    } else if (preferredStage.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter preferred stage',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    } else if (preferredIndustry.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter preferred industries',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    } else if (preferredLocation.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter preferred location',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.whiteColor,
      );
      return;
    }
    try {
      isLoading.value = true;
      final response = await apiServices.setYourPreferencesApi(
        firstName,
        lastName,
        email,
        location,
        preferredInvestment,
        preferredStage,
        preferredIndustry,
        preferredLocation,
      );
      print("Status Code: ${response?.statusCode}");
      print("Message: ${response?.message}");
      if (response?.statusCode == 201) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          response?.message ?? 'Set Preferences successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
        Get.to(() => InvestorDashBoardScreen());
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Set Preferences Failed',
          response?.message ?? 'Preferences failed',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      }
    } catch (e) {
      print('object ${e}');
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.blackColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getMarketplaceIndustriesApi() async {
    try {
      isLoading.value = true;

      final MarketplaceIndustriesResponse? response =
      await apiServices.getMarketplaceIndustriesApi();

      if (response?.statusCode == 200) {
        industriesList.assignAll(response?.data ?? []);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      print('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getMarketplaceStagesApi() async {
    try {
      isLoading.value = true;
      final MarketplaceIndustriesResponse? response =
      await apiServices.getMarketplaceStagesApi();

      if (response?.statusCode == 200) {
        stagesList.assignAll(response?.data ?? []);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      print('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getPlanApi() async {
    try {
      isLoading.value = true;
      final response = await apiServices.getPlanApi();
      print("Status Code: ${response?.statusCode}");
      print("Message: ${response?.message}");
      if (response?.statusCode == 200) {
        isLoading.value = false;

        planList.assignAll(response?.data ?? []);

        Get.snackbar(
          'Success',
          response?.message ?? 'Plan fetch successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Plan fetch Failed',
          response?.message ?? 'Plan failed',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      }
    } catch (e) {
      print('object ${e}');
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.blackColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> buyPlanApi() async {
    final plan_id = '1';
    final mock_payment_success = 'true';
    final payment_reference = "Dummy string";

    try {
      isLoading.value = true;
      final response = await apiServices.payPlanApi(
          plan_id, mock_payment_success, payment_reference);
      print("Status Code: ${response?.statusCode}");
      print("Message: ${response?.message}");
      if (response?.statusCode == 200) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          response?.message ?? 'Plan Purchase successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
        prefs.setString('plan_credit', '');
        prefs.setString('plan_name', '');
        Get.to(() => FounderDashboardScreen());
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Plan Purchase Failed',
          response?.message ?? 'Plan Purchase failed',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      }
    } catch (e) {
      print('object ${e}');
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.blackColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
