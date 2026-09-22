import 'dart:ffi';

import 'package:exit_app/api_utils/api_services.dart';
import 'package:exit_app/constants/app_images.dart';
import 'package:exit_app/controller/investor_dashboard_controller.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/founder_dashboard_screen.dart';
import 'package:exit_app/screens/dashoard_screen/investor_dashboard_screen/investor_dashboard_screen.dart';
import 'package:exit_app/screens/dashoard_screen/startup_dashboard_screen/startup_dashboard_screen.dart';
import 'package:exit_app/screens/new_chat_screen.dart';
import 'package:exit_app/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      checkToken();
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          AppImages.splashImage,
          width: 150,
          height: 200,
        ),
      ),
    );
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final role = prefs.getString('role');
    print('role:= ${role}');

    if (token != null && token.isNotEmpty) {
      if (role == 'investor') {
        Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(
            builder: (_) => InvestorDashBoardScreen(),
          ),
        );
      } else if (role == 'founder') {
        Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(
            builder: (_) => FounderDashboardScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(
            builder: (_) => StartupDashboardScreen(),
          ),
        );
      }
    } else {
      Navigator.pushReplacement(
        Get.context!,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );
    }
  }
}
