import 'package:exit_app/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exit_app/controller/investor_dashboard_controller.dart';
import 'package:get/get.dart';




class FilterListWidget extends StatelessWidget {

  final BuildContext buildContext;
  final String? text;
  final IconData? icon;
  final bool showArrow;
  final List<FilterListModel> items;
  final void Function(String)? onTap;
  final Color backgroundColor;
  final double fadeWidth;

  const FilterListWidget({
    super.key,
    required this.backgroundColor,
    this.onTap,
    this.fadeWidth = 60,
    this.text,
    this.icon,
    required this.items,
    required this.buildContext,
    required this.showArrow
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InvestorDashboardController(), tag: UniqueKey().toString());
    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          ListView.separated(
            controller: controller.scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final label = items[index].title;
              return FilterButtonWidget(context: buildContext, showArrow: showArrow, options: items[index].options,text: label,icon: icon);
            },
          ),
          // ---- Left fade overlay ----
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Obx(
                    () => AnimatedOpacity(
                  duration: const Duration(milliseconds: 120),
                  opacity: controller.leftOpacity.value,
                  child: Container(
                    width: fadeWidth,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [0.0, 0.5, 1.0],
                        colors: [
                          backgroundColor,
                          backgroundColor.withOpacity(0.6),
                          backgroundColor.withOpacity(0.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ---- Right fade overlay ----
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Obx(
                    () => AnimatedOpacity(
                  duration: const Duration(milliseconds: 120),
                  opacity: controller.rightOpacity.value,
                  child: Container(
                    width: fadeWidth,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        stops: const [0.0, 0.5, 1.0],
                        colors: [
                          backgroundColor,
                          backgroundColor.withOpacity(0.6),
                          backgroundColor.withOpacity(0.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




Widget FilterButtonWidget({
  required BuildContext context,
  String? text,
  IconData? icon,
  required bool showArrow,
  required List<String> options,
}) {
  return GestureDetector(
    onTap: () {
      showFilterPopup(context, options);
    },
    child: Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.containerBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.containerBorderColor,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: AppColors.whiteColor,
              size: 22,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text ?? '',
            style: GoogleFonts.montserrat(
                color: AppColors.darkGreyColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          if (showArrow) ...[
            const SizedBox(width: 8),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF888888),
              size: 22,
            ),
          ],
        ],
      ),
    ),
  );
}

void showFilterPopup(
  BuildContext context,
  List<String> options,
) {
  final RenderBox button = context.findRenderObject() as RenderBox;

  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  final Offset position = button.localToGlobal(
    Offset.zero,
    ancestor: overlay,
  );

  showMenu<String>(
    context: context,
    color: AppColors.blackColor,
    position: RelativeRect.fromLTRB(
      MediaQuery.sizeOf(context).width / 2.5,
      MediaQuery.sizeOf(context).height / 3.8,
      position.dx + button.size.width,
      position.dy + button.size.height + 5,
    ),
    items: options.map((option) {
      return PopupMenuItem<String>(
        value: option,
        child: Text(
          option,
          style: GoogleFonts.montserrat(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
      );
    }).toList(),
  ).then((value) {
    if (value != null) {
      print('Selected: $value');
    }
  });
}

// Widget FilterButtonWidget({
//   String? text,
//   IconData? icon,
//   required bool showArrow,
// }) {
//   return Container(
//     height: 38,
//     padding: const EdgeInsets.symmetric(horizontal: 14),
//     decoration: BoxDecoration(
//       color: const Color(0xFF101010),
//       borderRadius: BorderRadius.circular(20),
//       border: Border.all(
//         color: const Color(0xFF292929),
//       ),
//     ),
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (icon != null) ...[
//           Icon(
//             icon,
//             color: AppColors.whiteColor,
//             size: 15,
//           ),
//           const SizedBox(width: 8),
//         ],
//
//         Text(
//           text ?? '',
//           style: const TextStyle(
//             color: Color(0xFFD0D0D0),
//             fontSize: 12,
//           ),
//         ),
//
//         if (showArrow) ...[
//           const SizedBox(width: 6),
//           const Icon(
//             Icons.keyboard_arrow_down,
//             color: Color(0xFF888888),
//             size: 17,
//           ),
//         ],
//       ],
//     ),
//   );
// }

class FilterListModel {
  String title;
  List<String> options;

  FilterListModel({required this.title,required this.options, });
}

