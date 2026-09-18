import 'package:exit_app/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{
  RxBool newFundingRequests = true.obs;
  RxBool founderInterest = true.obs;
  RxBool messagesConnections = true.obs;
  RxBool portfolioUpdates = true.obs;

  RxBool pushNotifications = true.obs;
  RxBool emailNotifications = true.obs;
  RxBool isLoading = false.obs;
  RxString title = ''.obs;
  RxInt count = 0.obs;

  final RxList<NotificationModel> notifications = <NotificationModel>[].obs;

  NotificationModel? _lastDeleted;
  int? _lastDeletedIndex;


  @override
  void onInit() {
    super.onInit();
    _loadDummyData();
  }

  void _loadDummyData() {
    notifications.addAll([
      NotificationModel(
        id: '1',
        type: NotificationType.profileView,
        title: 'Investor viewed your profile',
        message: 'Northstar Ventures viewed your company profile.',
        timeAgo: '10 min ago',
        isUnread: true,
        isNew: true,
      ),
      NotificationModel(
        id: '2',
        type: NotificationType.investorMatch,
        title: 'New investor match',
        message:
        'You have a new match based on your stage, industry and funding goals.',
        timeAgo: '1 hr ago',
        isUnread: true,
        isNew: true,
      ),
      NotificationModel(
        id: '3',
        type: NotificationType.fundingSaved,
        title: 'Funding request saved',
        message: 'Your funding request has been saved successfully.',
        timeAgo: '3 hrs ago',
        isUnread: true,
        isNew: true,
      ),
      NotificationModel(
        id: '4',
        type: NotificationType.verification,
        title: 'Profile verification completed',
        message: 'Your company profile has been verified.',
        timeAgo: 'Yesterday',
        isUnread: false,
        isNew: false,
      ),
      NotificationModel(
        id: '5',
        type: NotificationType.investorActivity,
        title: 'New investor activity',
        message:
        'An investor you follow has updated their investment preferences.',
        timeAgo: 'Yesterday',
        isUnread: false,
        isNew: false,
      ),
      NotificationModel(
        id: '6',
        type: NotificationType.investorActivity,
        title: 'New investor activity',
        message: 'Another investor updated their preferences this week.',
        timeAgo: '2 days ago',
        isUnread: false,
        isNew: false,
      ),
      NotificationModel(
        id: '7',
        type: NotificationType.verification,
        title: 'Document re-verification needed',
        message: 'Please re-upload your latest incorporation certificate.',
        timeAgo: '3 days ago',
        isUnread: false,
        isNew: false,
      ),
    ]);
  }

  List<NotificationModel> get newNotifications =>
      notifications.where((n) => n.isNew).toList();

  List<NotificationModel> get earlierNotifications =>
      notifications.where((n) => !n.isNew).toList();

  void markAsRead(String id) {
    final index = notifications.indexWhere((n) => n.id == id);
    if (index != -1 && notifications[index].isUnread) {
      final old = notifications[index];
      notifications[index] = NotificationModel(
        id: old.id,
        type: old.type,
        title: old.title,
        message: old.message,
        timeAgo: old.timeAgo,
        isUnread: false,
        isNew: old.isNew,
      );
    }
  }

  void deleteNotification(String id) {
    final index = notifications.indexWhere((n) => n.id == id);
    if (index == -1) return;

    _lastDeleted = notifications[index];
    _lastDeletedIndex = index;
    notifications.removeAt(index);

    Get.snackbar(
      'Notification deleted',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF262626),
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(12),
      borderRadius: 10,
      mainButton: TextButton(
        onPressed: undoDelete,
        child: const Text(
          'UNDO',
          style: TextStyle(
            color: Color(0xFFEF4444),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void undoDelete() {
    if (_lastDeleted != null && _lastDeletedIndex != null) {
      notifications.insert(_lastDeletedIndex!, _lastDeleted!);
      _lastDeleted = null;
      _lastDeletedIndex = null;
      Get.closeCurrentSnackbar();
    }
  }

  void clearAll() {
    notifications.clear();
  }

  int get unreadCount => notifications.where((n) => n.isUnread).length;

  void toggleNewFundingRequests(bool value) {
    newFundingRequests.value = value;
  }

  void toggleFounderInterest(bool value) {
    founderInterest.value = value;
  }

  void toggleMessagesConnections(bool value) {
    messagesConnections.value = value;
  }

  void togglePortfolioUpdates(bool value) {
    portfolioUpdates.value = value;
  }

  void togglePushNotifications(bool value) {
    pushNotifications.value = value;
  }

  void toggleEmailNotifications(bool value) {
    emailNotifications.value = value;
  }

  final expandedIndex = (-1).obs;

  void toggleItem(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    } else {
      expandedIndex.value = index;
    }
  }

  bool isExpanded(int index) {
    return expandedIndex.value == index;
  }



}