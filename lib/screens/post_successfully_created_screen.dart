import 'package:exit_app/constants/app_color.dart';
import 'package:exit_app/constants/app_images.dart';
import 'package:exit_app/screens/dashoard_screen/founder_dashboard/founder_dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostSuccefullyCreatedScreen extends StatelessWidget {
  final String title;
  final String subtitle;

  const PostSuccefullyCreatedScreen({
    super.key,
    this.title = 'You funding request is live',
    this.subtitle =
    'Your request has been published and is now visible to relevant investors on EXIT.',
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>  FounderDashboardScreen(),
        ),
      );
    });
    final size = MediaQuery.sizeOf(context);
    final imageHeight = (size.height * 0.25).clamp(120.0, 200.0);

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(30.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight - 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.postSuccessfullyCreated,
                        width: double.infinity,
                        height: imageHeight,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor,
                            fontSize: 24),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(color: AppColors.darkGreyColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.containerBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.containerBorderColor,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor,
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Logo
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.business_center_outlined,
                                      size: 17,
                                      color: AppColors.darkGreyColor,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 9),

                                // Company info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'NovaNest',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const SizedBox(width: 6),

                                          // Published badge
                                          // Container(
                                          //   padding: const EdgeInsets.symmetric(
                                          //     horizontal: 7,
                                          //     vertical: 3,
                                          //   ),
                                          //   decoration: BoxDecoration(
                                          //     color: AppColors.lightGreenColor,
                                          //     borderRadius:
                                          //     BorderRadius.circular(5),
                                          //   ),
                                          //   child: const Text(
                                          //     'Published',
                                          //     style: TextStyle(
                                          //       color: AppColors.greenColor,
                                          //       fontSize: 8,
                                          //       fontWeight: FontWeight.w600,
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        'FinTech • Seed • Bengaluru',
                                        style: GoogleFonts.montserrat(
                                            color: AppColors.darkGreyColor,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),

                                // More button
                              ],
                            ),

                            const SizedBox(height: 16),

                            Container(
                              height: 1,
                              color: AppColors.containerBorderColor,
                            ),
                            const SizedBox(height: 16),
                            Row(children: [
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '₹75L',
                                        style: GoogleFonts.montserrat(color: AppColors.whiteColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 5),
                                    ],
                                  )),
                            ]),

                            // Divider

                            const SizedBox(height: 11),

                            Row(
                              children: [
                                // Views
                                const Icon(
                                  Icons.radio_button_checked,
                                  size: 12,
                                  color: AppColors.greenColor,
                                ),

                                const SizedBox(width: 4),

                                Flexible(
                                  child: Text(
                                    'Published just now',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.darkGreyColor,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
