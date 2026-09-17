import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {

  final ImagePicker _picker = ImagePicker();
  final Rxn<File> selectedImage = Rxn<File>();


  final RxString experience = '0-5'.obs;

  void changeIndustry(String value) {
    experience.value = value;
  }

  final RxString company_stage = 'Series A'.obs;

  void companyStage(String value) {
    company_stage.value = value;
  }

  final RxString team_size = '2-5'.obs;

  void teamSize(String value) {
    team_size.value = value;
  }

  void clickSubmitButton() {
    Get.back();
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
}
