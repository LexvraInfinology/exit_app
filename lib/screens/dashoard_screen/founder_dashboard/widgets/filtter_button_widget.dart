import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
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
  final MarketplaceIndustry? selectedStage;
  final MarketplaceIndustry? selectedIndustry;
  final MarketplaceIndustry? selectedRange;
  final MarketplaceIndustry? selectedLocation;

  const FilterListWidget({
    super.key,
    required this.backgroundColor,
    this.onTap,
    this.fadeWidth = 60,
    this.text,
    this.icon,
    required this.items,
    required this.buildContext,
    required this.showArrow,
     this.selectedStage,
     this.selectedIndustry,
     this.selectedRange,
     this.selectedLocation
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          ListView.separated(
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

          // ---- Right fade overlay ----
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IgnorePointer(
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
  required   List<MarketplaceIndustry> options,
}) {
  return GestureDetector(
    onTap: () {
      if(options.isEmpty){
        showNoOptionsPopup(context,title: text);
      }else{
        showFilterPopup(context, options);
      }
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
List<MarketplaceIndustry> options,
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
        value: option.id,
        child: Text(
          option.name,
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

void showNoOptionsPopup(BuildContext context, {String? title}) {
  showDialog(
    context: context,
    barrierColor: Colors.black54,
    builder: (context) => Dialog(
      backgroundColor: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: Colors.white10,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.filter_list_off_rounded,
                color: Colors.white70,
                size: 28,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title != null ? 'No ${title.toLowerCase()} options' : 'No options available',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'We couldn\'t find any options to show right now. Please try again later.',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 13,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


class FilterListModel {
  String title;
  List<MarketplaceIndustry> options;

  FilterListModel({required this.title,required this.options, });
}

