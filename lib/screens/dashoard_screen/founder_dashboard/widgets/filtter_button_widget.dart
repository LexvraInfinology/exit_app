import 'package:exit_app/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
