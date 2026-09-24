import 'dart:io';

import 'package:exit_app/screens/kyc_screens/kyc_verified_screen.dart';
import 'package:exit_app/screens/post_successfully_created_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../api_utils/api_services.dart';
import '../constants/app_color.dart';
import '../models/marketplace_Industries_model.dart';

class RaiseFundsRequestController extends GetxController {
  RxInt currentStep = 0.obs;

  final ImagePicker _picker = ImagePicker();
  final Rxn<File> selectedImage = Rxn<File>();
  var isLoading = false.obs;
  final ApiServices apiServices = ApiServices();
  final RxList<MarketplaceIndustry> purposeList = <MarketplaceIndustry>[].obs;
  final RxList<MarketplaceIndustry> stageList = <MarketplaceIndustry>[].obs;

  final TextEditingController amountController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController companyWebsiteController =
      TextEditingController();
  final TextEditingController companyDescriptionController =
      TextEditingController();
  final TextEditingController raiseDescriptionController =
      TextEditingController();

  final RxString industry = 'FinTech'.obs;

  void changeIndustry(String value) {
    industry.value = value;
  }

  final RxInt selectedPurpose = 0.obs;
  final RxInt selectedStage = 0.obs;
  final RxString selectedStageStringValue = ''.obs;
  final RxString selectedPurposeStringValue = ''.obs;

  void selectPurpose(int index,String value) {
    selectedPurpose.value = index;
    selectedPurposeStringValue.value = value;
    print('select purpose ${ value}');
    update();
  }

  void selectStage(int index,String value) {
    selectedStage.value = index + 1;
    selectedStageStringValue.value = value;
    print('object ${value}');
    update();
  }

  // final RxInt selectedInvestor = (-1).obs;
  var selectedInvestor = 0.obs;

  void selectInvestor(int index) {
    selectedInvestor.value = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadApi();
  }

  Future<void> loadApi() async {
    isLoading.value = true;
    await getMarketplaceStagesApi();
    await getFundsRaisePurposeApi();
    isLoading.value = false;
  }

  void postSubmitButton() {
    Get.to(() => const PostSuccefullyCreatedScreen());
  }

  void clickSubmitButton() {
    createFundsRaiseApi();
    // Get.to(() => KYCVerifiedScreen());
  }

  void clickContinueButton(int step) {
    if (step == 1) {
      currentStep.value = 1;
      update();
    } else if (step == 2) {
      currentStep.value = 2;
      update();
    } else if (step == 3) {
      currentStep.value = 3;
      update();
    } else if (step == 4) {
      currentStep.value = 4;
      update();
    }
  }

  void clickForBack(int step) {
    if (step == 4) {
      currentStep.value = 3;
      update();
    } else if (step == 3) {
      currentStep.value = 2;
      update();
    } else if (step == 2) {
      currentStep.value = 1;
      update();
    } else if (step == 1) {
      currentStep.value = 0;
      update();
    } else if (step == 0) {
      Get.back();
      update();
    }
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
              ListTile(
                leading: const Icon(Icons.picture_as_pdf),
                title: const Text('PDF'),
                onTap: () {
                  Navigator.pop(context);
                  pickPdf();
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

  Future<void> pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      final file = result.files.single;

      print('PDF path: ${file.path}');
    }
  }

  Future<void> getFundsRaisePurposeApi() async {
    try {
      isLoading.value = true;

      final MarketplaceIndustriesResponse? response =
          await apiServices.getFundsRaisePurposeApi();

      if (response?.statusCode == 200) {
        purposeList.value = response?.data ?? [];
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
        stageList.value = response?.data ?? [];
        // purposeList.assignAll(response?.data ?? []);
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

  Future<void> createFundsRaiseApi() async {
    final funding_goal = amountController.value.text.trim();
    final companyName = companyNameController.value.text.trim();
    final location = locationController.value.text.trim();
    final companyWebsite = companyWebsiteController.value.text.trim();
    final companyDescription = companyDescriptionController.value.text.trim();
    final raiseDescription = raiseDescriptionController.value.text.trim();
    print('object===${companyNameController.value.text.trim()}');
    try {
      isLoading.value = true;
      final response = await apiServices.createFundsRaiseApi(
          funding_goal.replaceAll(',', ''),
          "INR",
          (selectedStage.value + 1).toString(),
          (selectedPurpose.value + 1).toString(),
          companyName,
          selectedImage.value!.path,
          industry.value,
          location,
          companyWebsite,
          companyDescription,
          raiseDescription,
          "",
          "");
      print("Status Code: ${response?.statusCode}");
      print("Message: ${response?.message}");
      if (response?.statusCode == 201) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          response?.message ?? 'Funds Raise successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.blackColor,
          colorText: AppColors.whiteColor,
        );
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Funds raise Failed',
          response?.message ?? 'Funds raise failed',
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
