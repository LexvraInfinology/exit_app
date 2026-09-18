import 'package:exit_app/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  width: 26,
                  height: 26,
                  padding: const EdgeInsets.all(1.4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
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
                        color: Colors.black,
                        blurRadius: 8,
                        spreadRadius: 0,
                        offset: Offset(0, 3),
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
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              final newList = controller.newNotifications;
              final earlierList = controller.earlierNotifications;

              if (controller.notifications.isEmpty) {
                return _buildEmptyState();
              }

              final items = <_ListItem>[
                if (newList.isNotEmpty) ...[
                  _ListItem.header('New', newList.length),
                  ...newList.map((n) => _ListItem.tile(n)),
                ],
                if (earlierList.isNotEmpty) ...[
                  _ListItem.header('Earlier', earlierList.length),
                  ...earlierList.map((n) => _ListItem.tile(n)),
                ],
              ];

              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 24),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  if (item.isHeader) {
                    return SectionHeader(
                      title: item.headerTitle!,
                      count: item.headerCount!,
                    );
                  }

                  final n = item.notification!;
                  return Column(
                    children: [
                      NotificationTile(
                        notification: n,
                        onTap: () => controller.markAsRead(n.id),
                        onDelete: () => controller.deleteNotification(n.id),
                      ),
                      _divider(),
                    ],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _divider() => const Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Divider(
          color: Color(0xFF232323),
          height: 1,
          thickness: 1,
        ),
      );

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications_none,
            color: Colors.white24,
            size: 56,
          ),
          SizedBox(height: 12),
          Text(
            'No notifications yet',
            style: TextStyle(color: Colors.white54, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _ListItem {
  final bool isHeader;
  final String? headerTitle;
  final int? headerCount;
  final NotificationModel? notification;

  _ListItem.header(String title, int count)
      : isHeader = true,
        headerTitle = title,
        headerCount = count,
        notification = null;

  _ListItem.tile(NotificationModel n)
      : isHeader = false,
        headerTitle = null,
        headerCount = null,
        notification = n;
}

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(notification.id),
      direction: DismissDirection.endToStart,
      background: _buildDeleteBackground(),
      confirmDismiss: (direction) async {
        onDelete();
        return true;
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color(0xFF151515),
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xFF272727), width: 0.5)),
                child: Icon(
                  notification.icon,
                  color: Colors.white70,
                  size: 20,
                ),
              ),
              const SizedBox(width: 14),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              color: const Color(0xFFF5F5F3),
                              fontSize: 15,
                              fontWeight: notification.isUnread
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          notification.timeAgo,
                          style: const TextStyle(
                            color: Color(0xFF5C5C5C),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.message,
                      style: const TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              notification.isUnread
                  ? SizedBox(
                      width: 35,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF5F5F3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 35,
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteBackground() {
    return Container(
      color: const Color(0xFFB3261E),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 24),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.delete_outline, color: Colors.white, size: 22),
          SizedBox(height: 2),
          Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final int count;
  const SectionHeader({super.key, required this.title, required this.count});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF8A8A8A),
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
            decoration: BoxDecoration(
              color: const Color(0xFF151515),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF272727), width: 0.5),
            ),
            child: Text(
              '$count',
              style: const TextStyle(
                color: Color(0xFF8A8A8A),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationController extends GetxController {
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
}
