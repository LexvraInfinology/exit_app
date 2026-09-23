import 'package:flutter/material.dart';

String timeAgo(String? dateString) {
  if (dateString == null || dateString.trim().isEmpty) {
    return '';
  }

  try {
    final dateTime = DateTime.parse(dateString).toLocal();
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.isNegative) {
      return 'Just now';
    }

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    }

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours} hr ago';
    }

    if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    }

    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  } catch (e) {
    debugPrint('❌ INVALID DATE RECEIVED: "$dateString"');
    debugPrint('❌ DATE ERROR: $e');
    return '';
  }

}


String formatIndianShortCurrency(
    String rawAmount, {
      String symbol = '₹',
    }) {
  final amount = double.tryParse(rawAmount) ?? 0.0;

  if (amount <= 0) return '${symbol}0';

  const crore = 10000000;
  const lakh = 100000;
  const thousand = 1000;

  String trimZero(double value) {
    String s = value.toStringAsFixed(2);
    s = s.replaceFirst(RegExp(r'0+$'), '');
    s = s.replaceFirst(RegExp(r'\.$'), '');
    return s;
  }

  if (amount >= crore) {
    return '$symbol${trimZero(amount / crore)}Cr';
  } else if (amount >= lakh) {
    return '$symbol${trimZero(amount / lakh)}L';
  } else if (amount >= thousand) {
    return '$symbol${trimZero(amount / thousand)}K';
  } else {
    return '$symbol${trimZero(amount)}';
  }
}

String formatFundingTimeline(String value) {
  final parts = value.split('_');

  if (parts.length == 3) {
    return '${parts[0]}-${parts[1]} ${parts[2]}';
  }

  return value.replaceAll('_', ' ');
}

String formatAddedTime(DateTime? dateTime) {
  if (dateTime == null) {
    return 'Added recently';
  }

  final difference = DateTime.now().difference(dateTime);

  if (difference.inMinutes < 1) {
    return 'Added just now';
  } else if (difference.inMinutes < 60) {
    return 'Added ${difference.inMinutes}m ago';
  } else if (difference.inHours < 24) {
    return 'Added ${difference.inHours}h ago';
  } else if (difference.inDays < 7) {
    return 'Added ${difference.inDays}d ago';
  } else if (difference.inDays < 30) {
    return 'Added ${difference.inDays ~/ 7}w ago';
  } else if (difference.inDays < 365) {
    return 'Added ${difference.inDays ~/ 30}mo ago';
  } else {
    return 'Added ${difference.inDays ~/ 365}y ago';
  }
}