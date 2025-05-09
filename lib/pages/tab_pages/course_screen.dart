import 'package:flutter/material.dart';
import '../../widgets/avatar.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/course_card.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

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

    List<Map<String, dynamic>> courseData = [
      {
        'courseCode': 'ENG101',
        'courseTitle': 'Use of English I',
        'creditValue': 2,
        'lecturers': ['Miss. Lynda'],
      },
      {
        'courseCode': 'CEF405',
        'courseTitle': 'Design and Analysis of Algorithm',
        'creditValue': 3,
        'lecturers': ['Dr. Tsague'],
      },
      {
        'courseCode': 'CEF451',
        'courseTitle': 'Security of Information System and Cyber Security',
        'creditValue': 4,
        'lecturers': ['Dr. Tsague'],
      },
      {
        'courseCode': 'CEF415',
        'courseTitle': 'Technical Writing',
        'creditValue': 3,
        'lecturers': ['Dr. Nguti'],
      },
      {
        'courseCode': 'EEF467',
        'courseTitle': 'Feedback Systems',
        'creditValue': 4,
        'lecturers': ['Dr. Bazil'],
      },
      // Add more courses here...
    ];

    return SafeArea(
      child: Container(
          width: screenWidth,
          height: screenHeight,
          color: backgroundColor,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 28, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.go('/profile');
                              },
                              child: const Avatar(
                                size: 48.0,
                                uri: 'assets/images/avatar.jpeg',
                              ),
                            ),
                            SmoothContainer(
                                color: const Color(0xFF735BF2),
                                borderRadius: BorderRadius.circular(12.0),
                                smoothness: 1.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.push('/register_courses');
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      padding: const EdgeInsets.all(10.0)),
                                  child: const Text(
                                    "Register courses",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: backgroundColor),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 72.0),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Courses",
                              style: TextStyle(
                                  fontFamily: "Satoshi",
                                  fontSize: 24.0,
                                  color: fontColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Column(
                            children: [
                              for (var course in courseData) ...[
                                CourseCard(
                                  courseCode: course['courseCode'],
                                  courseTitle: course['courseTitle'],
                                  creditValue: course['creditValue'],
                                  lecturers:
                                      List<String>.from(course['lecturers']),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                )
                              ],
                            ],
                          ))
                    ]),
              ))),
    );
  }
}
