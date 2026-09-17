import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/controller/kyc_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadCardScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return GetBuilder<KYCController>(builder: (controller){
     return Scaffold( backgroundColor:AppColors.blackColor,body: SafeArea(child: controller.UploadCardWidget(context)),);
   });
  }

}