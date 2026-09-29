import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../api_utils/api_services.dart';
import '../constants/app_color.dart';
import '../screens/post_successfully_created_screen.dart';

class SellYourCompanyController extends GetxController {


  var isLoading = false.obs;
  final ApiServices apiServices = ApiServices();


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
  final RxInt selectedStage = 0.obs;
  final RxString selectedStageStringValue = ''.obs;

  void changeIndustry(String value) {
    industry.value = value;
  }

  final TextEditingController revenueController =
  TextEditingController();

  final ImagePicker _picker = ImagePicker();
  final Rxn<File> selectedImage = Rxn<File>();

  final RxInt selectedAcquisition = (0).obs;
  final RxString selectedStringAcquisition = ''.obs;
  void selectAcquisition(int index,String acquisition_value) {
    selectedAcquisition.value = index;
    selectedStringAcquisition.value = acquisition_value;
    update();
  }

  final RxInt selectedPurpose = 0.obs;
  final List<String> purposes = [
    'Immediately',
    '1–3 Months',
    '3–6 Months',
    '6 Months',
  ];


  final RxString selectedProfitability = 'Profitable'.obs;


  void postSubmitButton(){
    createSellCompanyApi();
  }
  void selectStage(int index,String value) {
    selectedStage.value = index + 1;
    selectedStageStringValue.value = value;
    print('object ${value}');
    update();
  }


  RxInt currentStep = 0.obs;

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
    }else if (step == 0) {
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

  Future<void> createSellCompanyApi() async {
    final funding_goal = amountController.value.text.trim();
    final companyName = companyNameController.value.text.trim();
    final location = locationController.value.text.trim();
    final companyWebsite = companyWebsiteController.value.text.trim();
    final companyDescription = companyDescriptionController.value.text.trim();
    final raiseDescription = raiseDescriptionController.value.text.trim();
    print('object===${companyNameController.value.text.trim()}');
    try {
      isLoading.value = true;
      final response = await apiServices.createSellCompanyApi(
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
        Get.to(() =>  PostSuccefullyCreatedScreen());

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
