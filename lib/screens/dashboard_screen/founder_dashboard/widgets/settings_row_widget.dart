import 'package:exit_app/controller/startUp_dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

Widget SettingsRowWidget({
  required IconData icon,
  required String title,
  final bool? showArrow,
  Color? iconColor,
  Color? titleColor,
}) {
  return SizedBox(
    height: 56,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: iconColor ?? const Color(0xFF999999),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: titleColor ?? const Color(0xFFD0D0D0),
              ),
            ),
          ),
          if (showArrow == true)
            const Icon(
              Icons.chevron_right_rounded,
              size: 21,
              color: Color(0xFF666666),
            )
          ,
        ]
        ,
      )
      ,
    )
    ,
  );
}
