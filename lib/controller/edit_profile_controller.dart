import 'dart:io';
import 'package:exit_app/api_utils/api_services.dart';
import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
import 'package:exit_app/models/profile_model.dart';
import 'package:exit_app/models/update_profile_response.dart';
import 'package:exit_app/screens/dashoard_screen/investor_dashboard_screen/investor_dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController {
  EditProfileController({required this.profile});

  final ImagePicker _picker = ImagePicker();
  final Rxn<File> selectedImage = Rxn<File>();

  var isLoading = false.obs;
  final ResultsProfile? profile;

  final ApiServices apiServices = ApiServices();
  final SharedPreferences prefs = Get.find<SharedPreferences>();

  final List<MarketplaceIndustry> industriesList = <MarketplaceIndustry>[];
  final List<MarketplaceIndustry> stagesList = <MarketplaceIndustry>[];
  final List<MarketplaceIndustry> rangesList = <MarketplaceIndustry>[];
  final List<MarketplaceIndustry> locationsList = <MarketplaceIndustry>[];
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> aboutController = TextEditingController().obs;


  Rx<TextEditingController> preferredInvestmentController =
      TextEditingController().obs;
  Rx<TextEditingController> preferredLocationController =
      TextEditingController().obs;
  Rx<TextEditingController> preferredStageController =
      TextEditingController().obs;
  Rx<TextEditingController> preferredIndustryController =
      TextEditingController().obs;


  final RxString experience = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfilePage();
    init();
  }

  init(){
    if(profile != null){
      firstNameController.value.text = profile?.firstName ?? '';
      lastNameController.value.text = profile?.lastName ?? "";
      emailController.value.text = profile?.email ?? "";
      locationController.value.text = profile?.currentLocation ?? "";
      aboutController.value.text = profile?.bio ?? "";
      preferredInvestmentController.value.text = profile?.preferredInvestment ?? "";
      preferredIndustryController.value.text = profile?.preferredIndustries ?? "";
      preferredLocationController.value.text = profile?.preferredLocation ?? "";
      final stageId = stagesList.firstWhere((item) => item.name == profile?.preferredStage,).id;
      preferredStageController.value.text = stageId;
    }
  }

  void onChangeStage(String value) {
    preferredStageController.value.text = value;
    update();
  }

  void onChangeIndustry(String value) {
    preferredIndustryController.value.text = value;
    update();
  }

  void onChangeLocation(String value) {
    preferredLocationController.value.text = value;
    update();
  }

  void changeIndustry(String value) {
    experience.value = value;
  }

  final RxString company_stage = ''.obs;

  void companyStage(String value) {
    company_stage.value = value;
  }

  final RxString team_size = ''.obs;

  void teamSize(String value) {
    team_size.value = value;
  }

  void clickSubmitButton() {
    Get.back();
  }

  void clickEditProfile(bool isFounder) {
    _updateProfileApi(isFounder);
  }

  void showUploadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),

            ],
          ),
        );
      },
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
    );

    if (image != null) {
      selectedImage.value = File(image.path);
      print('Image path: ${image.path}');
    }
  }
  Future<void> loadProfilePage() async {
    isLoading.value = true;
    update();
    try {
      final results = await Future.wait([
        _safeCall(getMarketplaceStagesApi),
        _safeCall(getMarketplaceIndustriesApi),
        _safeCall(getMarketplaceRangesApi),
        _safeCall(getMarketplaceLocationsApi),
      ]);
      final allFailed = results.every((success) => success == false);
      if (allFailed) {
        Get.snackbar(
          'Error',
          'Unable to load dashboard. Please check your connection.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      }
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<bool> _safeCall(Future<void> Function() apiCall) async {
    try {
      await apiCall();
      return true;
    } catch (e) {
      debugPrint('object $e');
      return false;
    }
  }


  Future<void> getMarketplaceIndustriesApi() async {
    try {

      final MarketplaceIndustriesResponse? response =
      await apiServices.getMarketplaceIndustriesApi();

      if (response?.statusCode == 200) {
        industriesList.assignAll(response?.data ?? []);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
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
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }

  Future<void> getMarketplaceRangesApi() async {
    try {
      isLoading.value = true;
      final MarketplaceIndustriesResponse? response =
      await apiServices.getMarketplaceRangesApi();

      if (response?.statusCode == 200) {
        rangesList.assignAll(response?.data ?? []);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }

  Future<void> getMarketplaceLocationsApi() async {
    try {
      isLoading.value = true;
      final MarketplaceIndustriesResponse? response =
      await apiServices.getMarketplaceLocationsApi();

      if (response?.statusCode == 200) {
        locationsList.assignAll(response?.data ?? []);
      } else {
        Get.snackbar(
            'Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      debugPrint('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }

  Future<void> _updateProfileApi(bool isFounder) async {
    final firstName = firstNameController.value.text.trim();
    final lastName = lastNameController.value.text.trim();
    final email = emailController.value.text.trim();
    final location = locationController.value.text.trim();
    final about = aboutController.value.text.trim();
    final investment = preferredInvestmentController.value.text.trim();
    final stage = preferredStageController.value.text.trim();
    final industry = preferredIndustryController.value.text.trim();
    final preferredLocation = preferredLocationController.value.text.trim();
    debugPrint("Stage ====> $stage");
    final String? validationError = _validateProfileFields(
      firstName: firstName,
      lastName: lastName,
      email: email,
      location: location,
      about: about,
      isFounder: isFounder,
      investment: investment,
      stage: stage,
      industry: industry,
      preferredLocation: preferredLocation,
    );
    if (validationError != null) {
      _showError(validationError);
      return;
    }
    try {
      isLoading.value = true;
      final response = await apiServices.updateProfileApi(
        firstName: firstName,
        lastName: lastName,
        email: email,
        currentLocation: location,
        bio: about,
        experience: experience.value,
        currentStage: company_stage.value,
        teamSize: team_size.value,
        preferredInvestment: investment,
        preferredStage: stage,
        preferredIndustries: industry,
        preferredLocation: preferredLocation,
        userRole: "",
        profileImagePath: selectedImage.value?.path,
      );
      debugPrint("Status Code: ${response?.statusCode}");
      debugPrint("Message: ${response?.message}");

      if (response?.statusCode == 200) {
        Get.snackbar(
          'Success',
          response?.message ?? 'Update Profile successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
        Get.to(() => InvestorDashBoardScreen());
      } else {
        _showError(response?.message ?? 'Preferences failed', title: 'Set Preferences Failed');
      }
    } catch (e) {
      print('object $e');
      _showError('Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  String? _validateProfileFields({
    required String firstName,
    required String lastName,
    required String email,
    required String location,
    required String about,
    required bool isFounder,
    required String investment,
    required String stage,
    required String industry,
    required String preferredLocation,
  }) {
    if (firstName.isEmpty) return 'Please enter first name';
    if (lastName.isEmpty) return 'Please enter last name';
    if (email.isEmpty) return 'Please enter email';
    if (location.isEmpty) return 'Please enter current location';
    if (about.isEmpty) return 'Please enter bio';
    if(isFounder){
      if (experience.isEmpty) return 'Please select experience';
      if (company_stage.isEmpty) return 'Please select current stage';
      if (team_size.isEmpty) return 'Please enter team size';
    }else{
      if (firstName.isEmpty) return 'Please enter typical investment';
      if (lastName.isEmpty) return 'Please enter preferred stage';
      if (email.isEmpty) return 'Please enter industry';
      if (email.isEmpty) return 'Please enter preferred location';
    }
    return null;
  }

  void _showError(String message, {String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: title == 'Error' ? Colors.redAccent : AppColors.blackColor,
      colorText: AppColors.whiteColor,
    );
  }
}
