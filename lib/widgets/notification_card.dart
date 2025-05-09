import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smooth_corner/smooth_corner.dart';

enum NotificationType {
  inClass,
  cancelled,
  location,
}

class NotificationCard extends StatelessWidget {
  final String courseCode;
  final String title;
  final String message;
  final String time;
  final NotificationType type;
  final bool isDefaultVariant;
  final VoidCallback? onDetailsTap;

  const NotificationCard({
    super.key,
    required this.courseCode,
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    this.isDefaultVariant = true,
    this.onDetailsTap,
  });

  Widget _getIcon() {
    final Color iconColor =
        isDefaultVariant ? const Color(0xFF7C3AED) : const Color(0xFFFCFFFF);
    const double iconSize = 24.0; // equivalent to h-8 w-8

    switch (type) {
      case NotificationType.inClass:
        return HugeIcon(
          icon: HugeIcons.strokeRoundedCoPresent,
          color: iconColor,
          size: iconSize,
        );
      case NotificationType.cancelled:
        return HugeIcon(
          icon: HugeIcons.strokeRoundedCancelCircle,
          color: iconColor,
          size: iconSize,
        ); // emerald-500
      case NotificationType.location:
        return HugeIcon(
          icon: HugeIcons.strokeRoundedLocationUpdate01,
          color: iconColor,
          size: iconSize,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF735BF2);
    const fontColor = Color(0xFF222B45);
    const constBackgroundColor = Color(0xFFFCFFFF);
    const grayColor = Color(0xFF8F9BB3);
    const errorColor = Color(0xFFF25B5B);
    final backgroundColor =
        isDefaultVariant ? primaryColor : constBackgroundColor;
    final textColor = isDefaultVariant ? constBackgroundColor : fontColor;
    final secondaryTextColor =
        isDefaultVariant ? constBackgroundColor : fontColor;

    return Container(
      height: 160.0,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          smoothness: 1.0,
        ),
        shadows: const [
          BoxShadow(
              offset: Offset(0, -1),
              blurRadius: 25.0,
              spreadRadius: 0,
              color: Color(0x1A8F9BB3)),
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 25.0,
              spreadRadius: 0,
              color: Color(0x0D8F9BB3))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20), // equivalent to p-6
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        isDefaultVariant ? constBackgroundColor : primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: _getIcon(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$courseCode - $title',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 18,
                      color: secondaryTextColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      time,
                      style: TextStyle(
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onDetailsTap,
                  child: Text(
                    'See full details',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDefaultVariant
                          ? constBackgroundColor
                          : primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: isDefaultVariant
                          ? constBackgroundColor
                          : primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
