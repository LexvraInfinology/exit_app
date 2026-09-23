import 'package:exit_app/api_utils/app_formatters.dart';
import 'package:exit_app/models/last_visited_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ViewAllLastVisitedScreen extends StatelessWidget {
  final String title;
  final List<LastVisitFundingRequest> items;

  const ViewAllLastVisitedScreen({
    super.key,
    this.title = 'New since you last visited',
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 35,
                height: 35,
                padding: const EdgeInsets.all(1.4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white54,
                      Colors.white12,
                    ],
                    stops: [0.0, 0.45, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF1A1A1A),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 40),
          ],
        ),
      ),
      body: items.isEmpty
          ? Center(
        child: Text(
          'Nothing to show',
          style: GoogleFonts.montserrat(
            color: const Color(0xFF858585),
            fontSize: 13,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return FundingRequestListCard(item: items[index]);
        },
      ),
    );
  }
}

class FundingRequestListCard extends StatelessWidget {
  final LastVisitFundingRequest item;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;

  const FundingRequestListCard({
    super.key,
    required this.item,
    this.onTap,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: const Color(0xFF292929)),
        ),
        child: SizedBox(
          height: 81,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: const Color(0xFF303030)),
                  ),
                  child: const Icon(
                    Icons.bolt_rounded,
                    size: 19,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 11),

                // LEFT CONTENT
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              item.companyName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 11,
                            height: 11,
                            decoration: const BoxDecoration(
                              color: Color(0xFF4A9EFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 7,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${item.industry} · ${item.stage.toUpperCase()} · ${item.location}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF858585),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                // RIGHT CONTENT
                SizedBox(
                  width: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        formatIndianShortCurrency(item.fundingGoal),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        formatAddedTime(item.createdAt),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF777777),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                GestureDetector(
                  onTap: onBookmarkTap,
                  child: const Icon(
                    Icons.bookmark_border_rounded,
                    size: 21,
                    color: Color(0xFF777777),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



