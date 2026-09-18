import 'package:exit_app/controller/investor_dashboard_controller.dart';
import 'package:exit_app/screens/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_images.dart';
import '../controller/founder_dashboard_controller.dart';

Widget FounderHeaderWidget(FounderDashboardController dashboardController) {
  return Row(
    children: [
      Image.asset(AppImages.dashboardIcon, width: 32, height: 32,),

      const SizedBox(width: 2),

      const Text(
        'EXIT',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      const Spacer(),

      GestureDetector(
        onTap: (){Get.to(const NotificationScreen());},
        child: Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.white,
            size: 29,
          ),
        ),
      ),

      const SizedBox(width: 10),

      GestureDetector(
        onTap: () {
          dashboardController.selectedIndex.value = 4;
        },
        child: Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF292929),
          ),
          child: const Text(
            'AM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      const SizedBox(width: 0),
    ],
  );
}
