import 'package:flutter/material.dart';

enum NotificationType {
  profileView,
  investorMatch,
  fundingSaved,
  verification,
  investorActivity,
}

class NotificationModel {
  final String id;
  final NotificationType type;
  final String title;
  final String message;
  final String timeAgo;
  final bool isUnread;
  final bool isNew; // belongs to "New" section vs "Earlier"

  NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.timeAgo,
    this.isUnread = false,
    this.isNew = true,
  });

  IconData get icon {
    switch (type) {
      case NotificationType.profileView:
        return Icons.person_outline;
      case NotificationType.investorMatch:
        return Icons.videocam_outlined;
      case NotificationType.fundingSaved:
        return Icons.bookmark_outline;
      case NotificationType.verification:
        return Icons.help_outline;
      case NotificationType.investorActivity:
        return Icons.show_chart;
    }
  }
}