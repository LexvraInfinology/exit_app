import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../screens/post_successfully_created_screen.dart';

class SellYourCompanyController extends GetxController {

  final TextEditingController amountController =
  TextEditingController();
  final TextEditingController revenueController =
  TextEditingController();

  final ImagePicker _picker = ImagePicker();
  final Rxn<File> selectedImage = Rxn<File>();

  final RxInt selectedAcquisition = (0).obs;
  void selectAcquisition(int index) {
    selectedAcquisition.value = index;
  }

  final RxInt selectedPurpose = 0.obs;
  final List<String> purposes = [
    'Immediately',
    '1–3 Months',
    '3–6 Months',
    '6 Months',
  ];


  final RxString industry = 'FinTech'.obs;
  void changeIndustry(String value) {
    industry.value = value;
  }

  final RxString selectedProfitability = 'Profitable'.obs;


  void postSubmitButton(){
    Get.to(() =>  PostSuccefullyCreatedScreen());
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
}
