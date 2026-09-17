import 'package:exit_app/controller/kyc_controller.dart';
import 'package:exit_app/screens/kyc_screens/kyc_verified_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class KYCIdentityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KYCController>(builder: (controller) {
      return controller.KYCVerificationWidegt(context);
    });
  }
}
