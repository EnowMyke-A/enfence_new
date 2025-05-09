import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CourseCard extends StatelessWidget {
  final String courseCode;
  final String courseName;
  final String location;
  final String time;
  final String statusText; // e.g., "Missed class", "Present", "Pending"
  final String actionText;
  final String cardID; // e.g., "Completed", "Ongoing", "Waiting to start"

  const CourseCard(
      {super.key,
      required this.courseCode,
      required this.courseName,
      required this.location,
      required this.time,
      required this.statusText,
      required this.actionText,
      required this.cardID});

  String actionIconFunction() {
    switch (actionText) {
      case "Completed":
        return "assets/images/complete.png";
      case "Ongoing":
        return "assets/images/ongoing.png";
      case "Waiting to start":
        return "assets/images/waiting.png";
      default:
        return "assets/images/completed.png";
    }
  }

  Color statusColorFunction() {
    switch (statusText) {
      case "Missed class":
        return const Color(0xFFF25B5B);
      case "Present":
        return const Color(0xFF00B383);
      case "Pending":
        return const Color(0xFFF2A45B);
      default:
        return const Color(0xFF00B383);
    }
  }

  Color statusBackgroundColorFunction() {
    switch (statusText) {
      case "Missed class":
        return const Color(0x33F25B5B);
      case "Present":
        return const Color(0x3300B383);
      case "Pending":
        return const Color(0x33F2A45B);
      default:
        return const Color(0x3300B383);
    }
  }

  Color actionColorIconFunction() {
    if (actionText == "Completed") {
      return const Color(0xFF735BF2);
    }
    return const Color(0xFF8F9BB3);
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF735BF2);
    const fontColor = Color(0xFF222B45);
    const backgroundColor = Color(0xFFFCFFFF);

    return Hero(
      tag: cardID,
      child: Container(
        padding: const EdgeInsets.all(18.0),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusBackgroundColorFunction(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: statusColorFunction(),
                          size: 12.0,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          statusText,
                          style: TextStyle(
                            color: statusColorFunction(),
                            fontFamily: "Satoshi",
                            fontSize: 14,
                            height: 1.57,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    )),
                Row(
                  children: [
                    Image.asset(
                      actionIconFunction(),
                      width: 18.0,
                      height: 18.0,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      actionText,
                      style: TextStyle(
                        color: actionColorIconFunction(),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Satoshi",
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/course_icon.png',
                  height: 48.0,
                  width: 48.0,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseCode,
                      style: const TextStyle(
                        fontFamily: "Satoshi",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: fontColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Text(
                        courseName,
                        style: const TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 14,
                          color: fontColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const HugeIcon(
                        icon: HugeIcons.strokeRoundedLocation06,
                        color: primaryColor,
                        size: 18.0),
                    const SizedBox(width: 4.0),
                    Text(location,
                        style: const TextStyle(
                            fontFamily: "Satoshi",
                            color: fontColor,
                            fontSize: 14.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(width: 16),
                    const HugeIcon(
                        icon: HugeIcons.strokeRoundedClock01,
                        color: primaryColor,
                        size: 18.0),
                    const SizedBox(width: 4),
                    Text(time,
                        style: const TextStyle(
                          fontFamily: "Satoshi",
                          color: fontColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        )),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      final data = {
                        "cardId": cardID,
                        "courseCode": courseCode,
                        "courseName": courseName,
                        "location": location,
                        "time": time,
                        "statusText": statusText,
                        "actionText": actionText
                      };
                      context.push("/class_today", extra: data);
                    },
                    child: const Text(
                      "Full details",
                      style: TextStyle(
                        fontFamily: "Satoshi",
                        color: primaryColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
