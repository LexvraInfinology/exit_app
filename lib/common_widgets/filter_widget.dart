import 'dart:async';
import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/widgets/filtter_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// class FilterListModel {
//   String title;
//   List<MarketplaceIndustry> options;
//
//   FilterListModel({required this.title, required this.options});
// }


import 'dart:async';

import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FilterHandleWidget extends StatefulWidget {
  final List<FilterListModel> items;
  final IconData? icon;
  final bool showArrow;
  final Color backgroundColor;
  final double fadeWidth;

  final MarketplaceIndustry? Function(String title) selectedFor;
  final void Function(String title, MarketplaceIndustry? value) onFilterSelected;

  const FilterHandleWidget({
    super.key,
    required this.items,
    required this.selectedFor,
    required this.onFilterSelected,
    required this.backgroundColor,
    this.fadeWidth = 60,
    this.icon,
    this.showArrow = true,
  });

  @override
  State<FilterHandleWidget> createState() => _FilterHandleWidgetState();
}

class _FilterHandleWidgetState extends State<FilterHandleWidget> {
  final ScrollController _scrollController = ScrollController();

  double _leftOpacity = normalOpacity;
  double _rightOpacity = normalOpacity;

  double _lastPixels = 0;
  Timer? _stopTimer;

  static const double normalOpacity = 0.0;
  static const double scrollingOpacity = 1.0;
  static const Duration stopDelay = Duration(milliseconds: 150);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final currentPixels = _scrollController.position.pixels;

    if (currentPixels < _lastPixels) {
      setState(() {
        _rightOpacity = scrollingOpacity;
        _leftOpacity = normalOpacity;
      });
    } else if (currentPixels > _lastPixels) {
      setState(() {
        _leftOpacity = scrollingOpacity;
        _rightOpacity = normalOpacity;
      });
    }

    _lastPixels = currentPixels;

    _stopTimer?.cancel();
    _stopTimer = Timer(stopDelay, () {
      if (!mounted) return;
      setState(() {
        _leftOpacity = normalOpacity;
        _rightOpacity = normalOpacity;
      });
    });
  }

  @override
  void dispose() {
    _stopTimer?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: widget.items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final filter = widget.items[index];
              return FilterButtonWidget(
                filter: filter,
                icon: widget.icon,
                showArrow: widget.showArrow,
                selected: widget.selectedFor(filter.title),
                onSelected: (value) => widget.onFilterSelected(filter.title, value),
              );
            },
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: IgnorePointer(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 120),
                opacity: _leftOpacity,
                child: Container(
                  width: widget.fadeWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: const [0.0, 0.5, 1.0],
                      colors: [
                        widget.backgroundColor,
                        widget.backgroundColor.withOpacity(0.6),
                        widget.backgroundColor.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IgnorePointer(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 120),
                opacity: _rightOpacity,
                child: Container(
                  width: widget.fadeWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      stops: const [0.0, 0.5, 1.0],
                      colors: [
                        widget.backgroundColor,
                        widget.backgroundColor.withOpacity(0.6),
                        widget.backgroundColor.withOpacity(0.0),
                      ],
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

// ============================================================================
// FilterButtonWidget
//   - Shows selected.name in place of the title once something is picked.
//   - Tapping the SAME already-selected option again clears it (toggle-off),
//     and the label falls back to the filter's title ("Stage" etc.).
// ============================================================================

class FilterButtonWidget extends StatelessWidget {
  final IconData? icon;
  final bool showArrow;
  final FilterListModel filter;
  final MarketplaceIndustry? selected;
  final void Function(MarketplaceIndustry? value) onSelected;

  const FilterButtonWidget({
    super.key,
    this.icon,
    required this.showArrow,
    required this.filter,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final label = selected?.name ?? filter.title;

    return GestureDetector(
      onTap: () async {
        if (filter.options.isEmpty) {
          showNoOptionsPopup(context, title: filter.title);
          return;
        }

        final MarketplaceIndustry? picked =
        await showFilterPopup(context, filter.options, selected: selected);

        if (picked == null) return; // user dismissed popup without tapping anything

        if (selected != null && picked.id == selected!.id) {
          // Tapped the already-selected option again -> toggle OFF
          onSelected(null);
        } else {
          onSelected(picked);
        }
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.containerBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected != null ? AppColors.whiteColor : AppColors.containerBorderColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.whiteColor, size: 22),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: GoogleFonts.montserrat(
                color: selected != null ? AppColors.whiteColor : AppColors.darkGreyColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (showArrow) ...[
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF888888), size: 22),
            ],
          ],
        ),
      ),
    );
  }
}


Future<MarketplaceIndustry?> showFilterPopup(
    BuildContext context,
    List<MarketplaceIndustry> options, {
      MarketplaceIndustry? selected,
    }) async {
  final RenderBox button = context.findRenderObject() as RenderBox;
  final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

  final Offset buttonTopLeft = button.localToGlobal(Offset.zero, ancestor: overlay);
  final Offset buttonBottomRight = button.localToGlobal(
    button.size.bottomRight(Offset.zero),
    ancestor: overlay,
  );

  return showMenu<MarketplaceIndustry>(
    context: context,
    color: AppColors.blackColor,
    position: RelativeRect.fromLTRB(
      buttonTopLeft.dx,
      buttonBottomRight.dy + 6,
      overlay.size.width - buttonBottomRight.dx,
      0,
    ),
    items: options.map((option) {
      final bool isSelected = option.id == selected?.id;
      return PopupMenuItem<MarketplaceIndustry>(
        value: option,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.name,
              style: GoogleFonts.montserrat(
                color: isSelected ? AppColors.whiteColor : AppColors.whiteColor.withOpacity(0.85),
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 12),
              const Icon(Icons.check, color: Colors.white, size: 18),
            ],
          ],
        ),
      );
    }).toList(),
  );
}


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
              decoration: const BoxDecoration(color: Colors.white10, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: const Icon(Icons.filter_list_off_rounded, color: Colors.white70, size: 28),
            ),
            const SizedBox(height: 16),
            Text(
              title != null ? 'No ${title.toLowerCase()} options' : 'No options available',
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'We couldn\'t find any options to show right now. Please try again later.',
              style: TextStyle(color: Colors.white54, fontSize: 13, height: 1.4),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}