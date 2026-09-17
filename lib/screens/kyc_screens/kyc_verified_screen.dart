import 'package:exit_app/controller/kyc_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_color.dart';
import '../../constants/app_images.dart';

class KYCVerifiedScreen extends StatelessWidget {
  const KYCVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: KYCController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: AppColors.blackColor,
              body: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: controller.KYCWidget(context),
                    ),
                  )
                ],
              ));
          //  child: controller.currentStep == 0
          //      ?
          // controller.KYCWidget(context)
          //      : controller.currentStep == 1
          //          ? KYCVerificationWidegt(context, controller)
          //          : controller.currentStep == 2
          //              ? CardVerifyWidegt(context, controller)
          //              : controller.currentStep == 3
          //                  ? IdentityVerificationWidget(context)
          //                  : SizedBox()
        });
  }
}
