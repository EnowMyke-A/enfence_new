import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/register_course_card.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:micro_loaders/micro_loaders.dart';

class RegisterCourse extends StatefulWidget {
  const RegisterCourse({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterCourse createState() => _RegisterCourse();
}

class _RegisterCourse extends State<RegisterCourse> {
  bool _isLoading = false;

  void _onRegisterPressed() async {
    setState(() {
      _isLoading = true;
    });
    // Simulate a delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
      GoRouter.of(context).push("/home");
    });
  }

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
        'courseCode': 'SPT101',
        'courseTitle': 'Sports and Physical Education',
        'creditValue': 2,
        'lecturers': ['Prof. Esuka'],
      },
      {
        'courseCode': 'FET301',
        'courseTitle': 'Calculus I',
        'creditValue': 3,
        'lecturers': ['Dr. Ngwa', 'Mr. Taku'],
      },
      {
        'courseCode': 'PHY101',
        'courseTitle': 'Physics for Engineering I',
        'creditValue': 4,
        'lecturers': ['Prof. Ekema', 'Dr. Ashu'],
      },
      {
        'courseCode': 'CEF231',
        'courseTitle': 'Introduction to Computer Science',
        'creditValue': 3,
        'lecturers': ['Dr. Tabi', 'Mr. Fon'],
      },
      {
        'courseCode': 'EEF267',
        'courseTitle': 'Circuit Analysis',
        'creditValue': 4,
        'lecturers': ['Prof. Agbor', 'Dr. Besingi'],
      },
      // Add more courses here...
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFCFFFF),
      body: SafeArea(
          child: SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: SingleChildScrollView(
                  child: StickyHeader(
                      header: Container(
                          height: 52,
                          width: screenWidth,
                          alignment: Alignment.centerLeft,
                          color: const Color(0xF0FCFFFF),
                          child: ElevatedButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                elevation: 0.0,
                                padding:
                                    const EdgeInsets.fromLTRB(24, 10, 24, 10),
                                backgroundColor: Colors.transparent),
                            child: const HugeIcon(
                              icon: HugeIcons.strokeRoundedArrowLeft02,
                              color: Color(0xFF222B45),
                              size: 32.0,
                            ),
                          )),
                      content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 24.0),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Register Courses",
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
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                child: Column(
                                  children: [
                                    for (var course in courseData) ...[
                                      RegisterCourseCard(
                                        courseCode: course['courseCode'],
                                        courseTitle: course['courseTitle'],
                                        creditValue: course['creditValue'],
                                        lecturers: List<String>.from(
                                            course['lecturers']),
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      )
                                    ],
                                  ],
                                )),
                            const SizedBox(height: 32.0),
                          ]))))),
      bottomNavigationBar: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
          child: SmoothContainer(
            borderRadius: BorderRadius.circular(12.0),
            smoothness: 1.0,
            color: const Color(0xFF735BF2),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0.0,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Proceed",
                    style: TextStyle(
                        color: backgroundColor,
                        fontFamily: "Satoshi",
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: _isLoading ? 8.0 : 0,
                  ),
                  _isLoading
                      ? const RotatingTwoArcLoader(
                          innerArcColor: backgroundColor,
                          outerArcColor: backgroundColor,
                          arcSize: 24,
                          arcWidth: 1.5,
                        )
                      : const SizedBox(
                          width: 0,
                        ),
                ],
              ),
              onPressed: () {
                _onRegisterPressed();
              },
            ),
          ),
        ),
      ),
    );
  }
}
