import 'package:exit_app/controller/investor_dashboard_controller.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/chat_list_screen.dart';
import 'package:exit_app/screens/dashoard_screen/investor_dashboard_screen/investor_chat_list_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../constants/app_color.dart';
import '../../../constants/app_images.dart';
import 'founder_discover_screen.dart';
import 'investor_profile_screen.dart';
import 'investor_home_screen.dart';
import 'investor_portfolio_screen.dart';

class InvestorDashBoardScreen extends StatelessWidget {
   InvestorDashBoardScreen({super.key});


  final List<Widget> pages = [
    InvestorHomeScreen(),
    FounderDiscoverScreen(),
    InvestorPortfolioScreen(),
    InvestorChatListScreen(),
    InvestorProfileScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: InvestorDashboardController(),
        builder: (dashboardcontroller) {
      return Obx(
            () => Scaffold(
          backgroundColor: AppColors.blackColor,
          body: IndexedStack(
            index: dashboardcontroller.selectedIndex.value,
            children: pages,
          ),

          bottomNavigationBar: _InvestorBottomNavigation(
            controller: dashboardcontroller,
          ),
        ),
      );
    });
  }
}


class _InvestorBottomNavigation extends StatelessWidget {
  final InvestorDashboardController controller;

  const _InvestorBottomNavigation({
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
        _navigationItem(
          index: 2,
          image: AppImages.unSelectedPortfolioIcon,
          selectedImage: AppImages.selectedPortfolioIcon,
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

  Widget  _navigationItem({
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

