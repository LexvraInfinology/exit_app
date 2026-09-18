import 'dart:io';

import 'package:exit_app/screens/kyc_screens/kyc_verified_screen.dart';
import 'package:exit_app/screens/post_successfully_created_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../api_utils/api_services.dart';
import '../models/marketplace_Industries_model.dart';

class RaiseFundsRequestController extends GetxController {
  RxInt currentStep = 0.obs;

  final ImagePicker _picker = ImagePicker();
  final Rxn<File> selectedImage = Rxn<File>();
  var isLoading = false.obs;
  final ApiServices apiServices = ApiServices();
  final List<MarketplaceIndustry> purposeList = <MarketplaceIndustry>[];
  final List<MarketplaceIndustry> stageList = <MarketplaceIndustry>[];

  final TextEditingController amountController =
  TextEditingController();

  final RxString industry = 'FinTech'.obs;
  void changeIndustry(String value) {
    industry.value = value;
  }

  final List<String> purposes = [
    'Expansion',
    'Seed',
    'Series A',
    'Series B',
    'Later',
    'Series B',
    'Later',
    'Expansion',
    'Seed',
    'Series A',
  ];
  final RxInt selectedPurpose = 0.obs;

  void selectPurpose(int index) {
    selectedPurpose.value = index;
  }

  final RxInt selectedInvestor = (-1).obs;

  void selectInvestor(int index) {
    selectedInvestor.value = index;
  }

  @override
  void onInit() {
    super.onInit();

  }

  Future<void> loadApi() async {
    isLoading.value = true;
    await getMarketplaceStagesApi();
    await  getFundsRaisePurposeApi();
    isLoading.value = false;
  }


  void postSubmitButton(){
    Get.to(() =>  PostSuccefullyCreatedScreen());
  }
  void clickSubmitButton(){
    Get.to(() =>  KYCVerifiedScreen());
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
        purposeList.assignAll(response?.data ?? []);
      } else {
        Get.snackbar('Failed', response?.message ?? 'Failed to fetch industries');
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
        purposeList.assignAll(response?.data ?? []);
      } else {
        Get.snackbar('Failed', response?.message ?? 'Failed to fetch industries');
      }
    } catch (e) {
      print('object $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

}


