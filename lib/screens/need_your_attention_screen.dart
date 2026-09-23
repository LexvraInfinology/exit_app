import 'package:exit_app/api_utils/app_formatters.dart';
import 'package:exit_app/models/need_attention_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewAllNeedsAttentionScreen extends StatelessWidget {
  final String title;
  final List<NeedsAttentionItem> items;
  final void Function(NeedsAttentionItem item) onOpenConversation;
  const ViewAllNeedsAttentionScreen({
    super.key,
    this.title = 'Needs attention',
    required this.items,
    required this.onOpenConversation,
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
          : ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return NeedsAttentionCard(
            item: item,
            onOpenConversation: () => onOpenConversation(item),
          );
        },
      ),
    );
  }
}

class NeedsAttentionCard extends StatelessWidget {
  final NeedsAttentionItem item;
  final VoidCallback onOpenConversation;

  const NeedsAttentionCard({
    super.key,
    required this.item,
    required this.onOpenConversation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFF292929)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 17, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    item.founderName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
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
                const Spacer(),
                GestureDetector(
                  onTap: onOpenConversation,
                  child: Text(
                    'Open conversation ›',
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            Text(
              'Founder replied · ${timeAgo(item.latestMessageTime)}',
              style: GoogleFonts.montserrat(
                color: const Color(0xFF777777),
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 13),
            Text(
              item.latestMessage,
              style: GoogleFonts.montserrat(
                color: const Color(0xFF858585),
                fontSize: 14,
                height: 1.55,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

