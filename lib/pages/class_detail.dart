import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:intl/intl.dart';

class ClassDetailScreen extends StatefulWidget {
  final Object data;
  const ClassDetailScreen({super.key, required this.data});

  String actionIconFunction() {
    final actionText = (data as Map<String, dynamic>)["actionText"];
    switch (actionText) {
      case "Completed":
        return "assets/images/completed_class.png";
      case "Ongoing":
        return "assets/images/ongoing_class.png";
      case "Waiting to start":
        return "assets/images/waiting_class.png";
      default:
        return "assets/images/completed_class.png";
    }
  }

  Color statusColorFunction() {
    final statusText = (data as Map<String, dynamic>)["statusText"];
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
    final statusText = (data as Map<String, dynamic>)["statusText"];
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
    final actionText = (data as Map<String, dynamic>)["actionText"];
    if (actionText == "Completed") {
      return const Color(0xFF735BF2);
    }
    return const Color(0xFF8F9BB3);
  }

  @override
  // ignore: library_private_types_in_public_api
  _ClassDetailScreen createState() => _ClassDetailScreen();
}

class _ClassDetailScreen extends State<ClassDetailScreen> {
  // Move the boolean variables here as class fields
  bool classStart = false;
  bool lecturerArrives = false;
  bool checkedIn = false;
  bool classEnd = false;

  Color primaryColor = const Color(0xFF735BF2);
  Color grayColor = const Color(0xFF8F9BB3);
  Color errorColor = const Color(0xFFF25B5B);
  Color successColor = const Color(0xFF00B383);

  // Move the function here as a class method
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    const fontColor = Color(0xFF222B45);
    const backgroundColor = Color(0xFFFCFFFF);
    const primaryColor = Color(0xFF735BF2);
    const grayColor = Color(0xFF8F9BB3);
    const grayColor20 = Color(0x338F9BB3);
    const errorColor = Color(0xFFF25B5B);
    const successColor = Color(0xFF00B383);

    Color eventColorDecider(int event) {
      // Determine the color based on the event number
      switch (event) {
        case 0:
          return grayColor20; // Before class starts
        case 1: // Lecturer arrives
          return primaryColor; // Lecturer present
        case 2: // Checked in
          return successColor; // Checked in
        case 3: // Checked out
          return primaryColor; // Lecturer still present
        case 4: // Lecturer leaves
          return grayColor20; // After lecturer leaves
        case 5: // Class ends
          return grayColor20; // Class ended
        default:
          return grayColor20; // Default case
      }
    }

    final List<Map<String, dynamic>> events = [
      {"title": "Class start time", "time": "9:00am", "event": 0},
      {"title": "Lecturer arrives class", "time": "9:05am", "event": 1},
      {"title": "You Checked in", "time": "9:10am", "event": 2},
      {"title": "You Checked out", "time": "9:25am", "event": 3},
      {"title": "Lecturer leaves", "time": "10:59am", "event": 4},
      {"title": "Class ends", "time": "11:00am", "event": 5},
    ];

    final courseCardData = widget.data as Map<String, dynamic>;

    double lengthFraction(String startTimeStr, String endTimeStr) {
      // Convert 12-hour format to 24-hour format for parsing
      DateFormat inputFormat = DateFormat("hh:mma");
      DateFormat outputFormat = DateFormat("HH:mm");

      try {
        DateTime startTime = inputFormat.parse(startTimeStr.toLowerCase());
        DateTime endTime = inputFormat.parse(endTimeStr.toLowerCase());

        // Calculate the difference in minutes
        int differenceInMinutes = endTime.difference(startTime).inMinutes;

        // Convert to hours and return fraction
        return differenceInMinutes / 60 / 2;
      } catch (e) {
        // Return a default value if parsing fails
        return 0.5;
      }
    }

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
                              "Class stats",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: fontColor,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SmoothContainer(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              smoothness: 1.0,
                              side: const BorderSide(
                                  color: Color(0x338F9BB3), width: 1.5),
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
                        )),
                    content: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 48, 18, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Hero(
                            tag: courseCardData["cardId"],
                            child: Container(
                              padding: const EdgeInsets.all(18.0),
                              decoration: ShapeDecoration(
                                color: primaryColor,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: widget.statusColorFunction(),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                color: backgroundColor,
                                                size: 12.0,
                                              ),
                                              const SizedBox(
                                                width: 8.0,
                                              ),
                                              Text(
                                                courseCardData["statusText"],
                                                style: const TextStyle(
                                                  fontFamily: "Satoshi",
                                                  color: backgroundColor,
                                                  fontSize: 14,
                                                  height: 1.57,
                                                  fontWeight: FontWeight.w500,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Row(
                                        children: [
                                          Image.asset(
                                            widget.actionIconFunction(),
                                            width: 18.0,
                                            height: 18.0,
                                          ),
                                          const SizedBox(width: 8.0),
                                          Text(
                                            courseCardData["actionText"],
                                            style: const TextStyle(
                                              fontFamily: "Satoshi",
                                              color: backgroundColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
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
                                        'assets/images/bookIcon.png',
                                        height: 48.0,
                                        width: 48.0,
                                      ),
                                      const SizedBox(
                                        width: 16.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            courseCardData["courseCode"],
                                            style: const TextStyle(
                                              fontFamily: "Satoshi",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: backgroundColor,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const SizedBox(height: 4.0),
                                          ConstrainedBox(
                                            constraints: const BoxConstraints(
                                                maxWidth: 200),
                                            child: Text(
                                              courseCardData["courseName"],
                                              style: const TextStyle(
                                                fontFamily: "Satoshi",
                                                fontSize: 14,
                                                color: backgroundColor,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.none,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const HugeIcon(
                                              icon: HugeIcons
                                                  .strokeRoundedLocation06,
                                              color: backgroundColor,
                                              size: 18.0),
                                          const SizedBox(width: 4.0),
                                          Text(courseCardData["location"],
                                              style: const TextStyle(
                                                  color: backgroundColor,
                                                  fontFamily: "Satoshi",
                                                  fontSize: 14.0,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500)),
                                          const SizedBox(width: 16),
                                          const HugeIcon(
                                              icon: HugeIcons
                                                  .strokeRoundedClock01,
                                              color: backgroundColor,
                                              size: 18.0),
                                          const SizedBox(width: 4),
                                          Text(courseCardData["time"],
                                              style: const TextStyle(
                                                  fontFamily: "Satoshi",
                                                  color: backgroundColor,
                                                  fontSize: 14.0,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          overlayColor: WidgetStateProperty.all(
                                              Colors
                                                  .transparent), // Transparent overlay
                                          splashFactory: NoSplash
                                              .splashFactory, // No ripple effect
                                        ),
                                        child: const Text(
                                          "",
                                          style: TextStyle(
                                              fontFamily: "Satoshi",
                                              color: primaryColor,
                                              fontSize: 14.0,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 20.0),
                                  child: const Column(
                                    children: [
                                      Text(
                                        "15 mins",
                                        style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            color: errorColor,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Attended",
                                        style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            color: fontColor,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 20.0),
                                  child: const Column(
                                    children: [
                                      Text(
                                        "2 hours",
                                        style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            color: primaryColor,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Class time",
                                        style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            color: fontColor,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 20.0),
                                  child: const Column(
                                    children: [
                                      Text(
                                        "12.5%",
                                        style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            color: errorColor,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Attended",
                                        style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            color: fontColor,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: events.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                    height: index > 0
                                        ? lengthFraction(
                                                events[index - 1]["time"],
                                                events[index]["time"]) *
                                            300
                                        : 30.0,
                                    child: TimelineTile(
                                      isFirst: index == 0,
                                      isLast: index == events.length - 1,
                                      alignment: TimelineAlign.manual,
                                      lineXY: 0.1,
                                      indicatorStyle: IndicatorStyle(
                                        width: 12,
                                        padding: const EdgeInsets.all(4),
                                        color: eventColorDecider(
                                            events[index]["event"]),
                                        indicator: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: eventColorDecider(
                                                events[index]["event"]),
                                          ),
                                        ),
                                      ),
                                      beforeLineStyle: LineStyle(
                                        color: (index > 0)
                                            ? eventColorDecider(
                                                events[index - 1]["event"])
                                            : eventColorDecider(
                                                events[index]["event"]),
                                        thickness: 3,
                                      ),
                                      afterLineStyle: LineStyle(
                                        color: eventColorDecider(
                                            events[index]["event"]),
                                        thickness: 3,
                                      ),
                                      endChild: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0,
                                                        vertical: 10.0),
                                                decoration: ShapeDecoration(
                                                  shape: SmoothRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    smoothness: 1.0,
                                                  ),
                                                  shadows: const [
                                                    BoxShadow(
                                                        offset: Offset(0, -1),
                                                        blurRadius: 25.0,
                                                        spreadRadius: 0,
                                                        color:
                                                            Color(0x1A8F9BB3)),
                                                    BoxShadow(
                                                        offset: Offset(0, 4),
                                                        blurRadius: 25.0,
                                                        spreadRadius: 0,
                                                        color:
                                                            Color(0x0D8F9BB3))
                                                  ],
                                                  color: backgroundColor,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      events[index]["title"],
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: fontColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 4.0,
                                                    ),
                                                    Text(
                                                      events[index]["time"],
                                                      style: const TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: fontColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
              ))),
    );
  }
}
