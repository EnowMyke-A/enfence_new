import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'notification_card.dart';
import '../models/notification.dart';

class NotificationHolder extends StatelessWidget {
  final List<NotificationItem> notifications;

  const NotificationHolder({
    super.key,
    required this.notifications,
  });

  Map<String, List<NotificationItem>> _groupNotificationsByDate() {
    final groups = <String, List<NotificationItem>>{};
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    for (var notification in notifications) {
      String dateKey;
      if (notification.date.year == today.year &&
          notification.date.month == today.month &&
          notification.date.day == today.day) {
        dateKey = 'Today';
      } else if (notification.date.year == yesterday.year &&
          notification.date.month == yesterday.month &&
          notification.date.day == yesterday.day) {
        dateKey = 'Yesterday';
      } else {
        dateKey = DateFormat('MM/dd/yyyy').format(notification.date);
      }

      groups.putIfAbsent(dateKey, () => []);
      groups[dateKey]!.add(notification);
    }

    return Map.fromEntries(groups.entries.toList()
      ..sort((a, b) {
        if (a.key == 'Today') return -1;
        if (b.key == 'Today') return 1;
        if (a.key == 'Yesterday') return -1;
        if (b.key == 'Yesterday') return 1;
        return 0;
      }));
  }

  @override
  Widget build(BuildContext context) {
    final groupedNotifications = _groupNotificationsByDate();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      itemCount: groupedNotifications.length,
      itemBuilder: (context, index) {
        final dateEntry = groupedNotifications.entries.elementAt(index);
        return Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 16),
                child: Text(
                  dateEntry.key,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              ...dateEntry.value.map((notification) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: NotificationCard(
                      courseCode: notification.courseCode,
                      title: notification.title,
                      message: notification.message,
                      time: notification.time,
                      type: notification.type,
                      isDefaultVariant:
                          notification.type != NotificationType.location,
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
