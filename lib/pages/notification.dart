import 'package:enfence_new/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../widgets/notification_holder.dart';
import '../models/notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationScreen createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen> {
  bool darkMode = false;
  bool notification = false;

  // Example notifications data
  final List<NotificationItem> notifications = [
    (
      id: '1',
      courseCode: 'CEF405',
      title: 'Lecturer now in class',
      message: 'Class has now started, Lecturer is in class',
      time: '09:05 AM',
      type: NotificationType.inClass,
      date: DateTime.now(),
    ),
    (
      id: '2',
      courseCode: 'CEF451',
      title: 'Class cancelled',
      message: 'Class has been cancelled by lecturer',
      time: '12:42 PM',
      type: NotificationType.cancelled,
      date: DateTime.now(),
    ),
    (
      id: '3',
      courseCode: 'CEF415',
      title: 'Location changed',
      message: 'Class location changed to Tech room 3',
      time: '03:01 PM',
      type: NotificationType.location,
      date: DateTime.now(),
    ),
    (
      id: '4',
      courseCode: 'CEF415',
      title: 'Lecturer now in class',
      message: 'Class has now started, Lecturer is in class',
      time: '11:10 AM',
      type: NotificationType.inClass,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    const primaryColor = Color(0xFF735BF2);
    const fontColor = Color(0xFF222B45);
    const backgroundColor = Color(0xFFFCFFFF);
    const grayColor = Color(0xFF8F9BB3);
    const errorColor = Color(0xFFF25B5B);

    //Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: SingleChildScrollView(
                child: StickyHeader(
                    header: Container(
                        width: screenWidth,
                        padding: const EdgeInsets.fromLTRB(18, 24.0, 24.0, 18),
                        color: const Color(0xFFFCFFFF),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                GoRouter.of(context).pop();
                              },
                              style: IconButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  elevation: 0.0,
                                  padding: const EdgeInsets.all(0.0),
                                  backgroundColor: Colors.transparent),
                              icon: const HugeIcon(
                                icon: HugeIcons.strokeRoundedArrowLeft02,
                                color: Color(0xFF222B45),
                                size: 32.0,
                              ),
                            ),
                            const Text(
                              "Notifications",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: fontColor),
                            ),
                            SmoothContainer(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              smoothness: 1.0,
                              side: const BorderSide(
                                  color: Color(0x338F9BB3), width: 1.5),
                              child: IconButton(
                                onPressed: () {},
                                icon: const HugeIcon(
                                  icon: HugeIcons.strokeRoundedNotification02,
                                  color: grayColor,
                                ),
                                style: IconButton.styleFrom(
                                    padding: const EdgeInsets.all(0.0)),
                              ),
                            ),
                          ],
                        )),
                    content: Padding(
                      padding: EdgeInsets.fromLTRB(
                          18,
                          notifications.isEmpty ? screenWidth / 2.5 : 48,
                          18,
                          0),
                      child: notifications.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const HugeIcon(
                                  icon:
                                      HugeIcons.strokeRoundedNotificationOff02,
                                  color: grayColor,
                                  size: 72.0,
                                ),
                                const SizedBox(height: 16.0),
                                const Text(
                                  "No new notification",
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w600,
                                    color: grayColor,
                                    fontSize: 20.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                const Text(
                                  "No updates about your classes yet. Keep using application to receive notifications",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      color: grayColor,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                                SmoothContainer(
                                    color: const Color(0xFF735BF2),
                                    borderRadius: BorderRadius.circular(12.0),
                                    smoothness: 1.0,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          context.go("/home");
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                const EdgeInsets.all(16.0)),
                                        child: const Text(
                                          "Continue to dashboard",
                                          style: TextStyle(
                                              fontFamily: 'Satoshi',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFFCFFFF)),
                                        ))),
                              ],
                            )
                          : NotificationHolder(notifications: notifications),
                    )),
              ))),
    );
  }
}
