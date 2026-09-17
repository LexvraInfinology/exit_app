import 'package:exit_app/controller/kyc_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IdentitiyVerificationScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return GetBuilder<KYCController>(builder: (controller){
    return SafeArea(child: controller.IdentityVerificationWidget(context));
  });
  }

}