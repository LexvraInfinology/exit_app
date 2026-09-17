import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/constants/app_images.dart';
import 'package:exit_app/controller/founder_dashboard_controller.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/chat_list_screen.dart';
import 'package:exit_app/screens/raise_funds_screen/create_funds_request_screen.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/founder_home_screen.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/founder_profile_screen.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/funding_request_list_screen.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/view_all_investor_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FounderDashboardScreen extends StatelessWidget {
  FounderDashboardScreen({super.key});

  final FounderDashboardController controller =
      Get.put(FounderDashboardController());

  final List<Widget> pages = [
    FounderHomeScreen(),
    ViewAllInvestorScreen(),
    FundingRequestListScreen(),
    ChatListScreen(),
    FounderProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.blackColor,
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),

        bottomNavigationBar: _FounderBottomNavigation(
          controller: controller,
        ),
      ),
    );
  }
}

class _FounderBottomNavigation extends StatelessWidget {
  final FounderDashboardController controller;

  const _FounderBottomNavigation({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final selectedIndex = controller.selectedIndex.value;

    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: Color(0xFF090909),
        border: Border(
          top: BorderSide(
            color: Color(0xFF292929),
            width: 0.6,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navigationItem(
              index: 0,
              image: AppImages.unselectedHomeIcon,
              selectedImage: AppImages.selectedHomeIcon,
              selectedIndex: selectedIndex,
            ),
            _navigationItem(
              index: 1,
              image: AppImages.unselectedInvestorIcon,
              selectedImage: AppImages.selectedInvestorIcon,
              selectedIndex: selectedIndex,
            ),
            _centerButton(
              selectedIndex: selectedIndex,
            ),
            _navigationItem(
              index: 3,
              image: AppImages.unselectedChatIcon,
              selectedImage: AppImages.selectedChatIcon,
              selectedIndex: selectedIndex,
            ),
            _navigationItem(
              index: 4,
              image: AppImages.unselectedProfileIcon,
              selectedImage: AppImages.selectedProfileIcon,
              selectedIndex: selectedIndex,
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigationItem({
    required int index,
    required int selectedIndex,
    String? image,
    String? selectedImage,
    IconData? materialIcon,
    IconData? selectedMaterialIcon,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.onItemSelected(index);
      },
      child: SizedBox(
        width: 58,
        height: 65,
        child: Center(
          child: AnimatedScale(
            scale: isSelected ? 1.12 : 1.0,
            duration: const Duration(
              milliseconds: 700,
            ),
            curve: Curves.easeOutBack,
            child: AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 700,
              ),
              switchInCurve: Curves.easeOutBack,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
              ) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                );
              },
              child: image != null
                  ? ImageIcon(
                      AssetImage(
                        isSelected && selectedImage != null
                            ? selectedImage
                            : image,
                      ),
                      key: ValueKey(
                        isSelected ? 'selected-$index' : 'unselected-$index',
                      ),
                      size: 26,
                      color: AppColors.whiteColor,
                    )
                  : Icon(
                      isSelected && selectedMaterialIcon != null
                          ? selectedMaterialIcon
                          : materialIcon,
                      key: ValueKey(
                        isSelected ? 'selected-$index' : 'unselected-$index',
                      ),
                      size: 26,
                      color: AppColors.darkGreyColor,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _centerButton({
    required int selectedIndex,
  }) {
    final bool isSelected = selectedIndex == 2;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.onItemSelected(2);
      },
      child: SizedBox(
        width: 58,
        height: 68,
        child: Center(
          child: AnimatedScale(
            scale: isSelected ? 1.10 : 1.0,
            duration: const Duration(
              milliseconds: 280,
            ),
            curve: Curves.easeOutBack,
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 280,
              ),
              curve: Curves.easeOutCubic,
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF101010),
                border: Border.all(
                  color:AppColors.whiteColor,
                  width: isSelected ? 1.2 : 0.8,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.whiteColor.withOpacity(
                      isSelected ? 0.15 : 0.05,
                    ),
                    blurRadius: isSelected ? 15 : 8,
                    spreadRadius: isSelected ? 1 : 0,
                  ),
                ],
              ),
              child: AnimatedRotation(
                turns: isSelected ? 0.125 : 0,
                duration: const Duration(
                  milliseconds: 250,
                ),
                curve: Curves.easeOutBack,
                child: const Icon(
                  Icons.add,
                  color: AppColors.whiteColor,
                  size: 22,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
