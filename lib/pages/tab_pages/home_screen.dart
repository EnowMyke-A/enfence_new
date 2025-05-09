import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../widgets/avatar.dart';
import '../../widgets/date.dart';
import '../../widgets/course_card_today.dart';
import '../../widgets/base_page.dart';

class HomeScreen extends BasePage {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BasePageState<HomeScreen> {
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

    final List<Map<String, dynamic>> courses = [
      {
        "cardId": "8323890283",
        "courseCode": "CEF405",
        "courseName": "Design and analysis of algorithms",
        "location": "FET BGFL",
        "time": "09:00am",
        "statusText": "Missed class",
        "actionText": "Completed",
      },
      {
        "cardId": "4837439890",
        "courseCode": "EEF467",
        "courseName": "Feedback systems",
        "location": "FET hall 1",
        "time": "11:00am",
        "statusText": "Present",
        "actionText": "Completed",
      },
      {
        "cardId": "5729829280",
        "courseCode": "CEF415",
        "courseName": "Technical Writing",
        "location": "FET hall 2",
        "time": "03:00pm",
        "statusText": "Pending",
        "actionText": "Ongoing",
      },
      {
        "cardId": "2323090123",
        "courseCode": "CEF451",
        "courseName": "Security of Information System and Cybersecurity",
        "location": "FET BGFL",
        "time": "05:00am",
        "statusText": "Pending",
        "actionText": "Waiting to start",
      },
    ];

    return SafeArea(
        child: Container(
      width: screenWidth,
      height: screenHeight,
      color: backgroundColor,
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/profile');
                        },
                        child: const Avatar(
                          size: 64.0,
                          uri: 'assets/images/avatar.jpeg',
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello!",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                                color: fontColor),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "Oliver Twist",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w600,
                                color: fontColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SmoothContainer(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  smoothness: 1.0,
                  side: const BorderSide(color: Color(0x338F9BB3), width: 1.5),
                  child: IconButton(
                    onPressed: () {
                      context.push("/notifications");
                    },
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedNotification02,
                      color: grayColor,
                    ),
                    style: IconButton.styleFrom(
                        padding: const EdgeInsets.all(0.0)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48.0),
            const SizedBox(
              width: double.infinity,
              child: DateRow(),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Container(
              height: screenWidth < 400 ? 235.0 : 250,
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  smoothness: 1.0,
                ),
                color: primaryColor,
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Image.asset(
                        "assets/images/Abstract_dec.png",
                        width: (screenWidth - 32) / 1.785,
                      )),
                  Positioned(
                      right: 0.0,
                      bottom: 0.0,
                      child: Image.asset(
                        "assets/images/dashboard.png",
                        width: (screenWidth - 32) / 1.983,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: (screenWidth - 22) / 2,
                            child: const Text(
                              "Get your attendance for all courses this semester till date",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w600,
                                  color: backgroundColor),
                            )),
                        const SizedBox(
                          height: 24.0,
                        ),
                        SmoothContainer(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(12.0),
                            smoothness: 1.0,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    padding: const EdgeInsets.all(10.0)),
                                child: const Text(
                                  "Download",
                                  style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor),
                                ))),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              "Today's classes",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w600,
                  color: fontColor),
            ),
            const SizedBox(
              height: 16.0,
            ),
            for (var course in courses) ...[
              CourseCard(
                courseCode: course['courseCode'] ?? 'Unknown Code',
                courseName: course['courseName'] ?? 'Unknown Course',
                location: course['location'] ?? 'Unknown Location',
                time: course['time'] ?? '00:00',
                statusText: course['statusText'] ?? 'Unknown Status',
                actionText: course['actionText'] ?? 'Unknown Action',
                cardID: course['cardId'] ?? "Unknown ID",
              ),
              const SizedBox(height: 16.0), // Adds spacing between cards
            ],
          ],
        ),
      )),
    ));
  }
}
