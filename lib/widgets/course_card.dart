import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:flutter/services.dart';

class CourseCard extends StatelessWidget {
  final String courseCode;
  final String courseTitle;
  final int creditValue;
  final List<String> lecturers;

  const CourseCard({
    super.key,
    required this.courseCode,
    required this.courseTitle,
    required this.creditValue,
    required this.lecturers,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF735BF2);
    const fontColor = Color(0xFF222B45);
    const backgroundColor = Color(0xFFFCFFFF);
    const grayColor = Color(0xFF8F9BB3);
    const errorColor = Color(0xFFF25B5B);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
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
              SmoothContainer(
                smoothness: 1.0,
                borderRadius: BorderRadius.circular(8.0),
                padding: const EdgeInsets.all(8.0),
                color: const Color(0x33735BF2),
                child: Text(
                  '$creditValue Credit',
                  style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierLabel: 'logout',
                      transitionDuration: const Duration(milliseconds: 5),
                      barrierColor:
                          const Color(0x80000000), // Optional barrier color
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Dialog(
                          child: Material(
                            color: const Color(0xFFFCFFFF),
                            borderRadius: BorderRadius.circular(16.0),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    "assets/images/alert-circle.png",
                                    width: 72,
                                    height: 72,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    "Drop $courseCode?",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Satoshi',
                                        color: fontColor,
                                        height: 1.2),
                                  ),
                                  const SizedBox(height: 4.0),
                                  const Text(
                                    "All attendance data will be erased for this course.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Satoshi',
                                        color: grayColor),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 32),
                                  SizedBox(
                                    width: 250,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SmoothContainer(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          smoothness: 1.0,
                                          color: errorColor,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                elevation: 0.0,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24,
                                                        vertical: 12),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0))),
                                            child: const Text(
                                              "Drop",
                                              style: TextStyle(
                                                  color: Color(0xFFFCFFFF),
                                                  fontFamily: "Satoshi",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        SmoothContainer(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          smoothness: 1.0,
                                          color: const Color(0x338F9BB3),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                elevation: 0.0,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24,
                                                        vertical: 12),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0))),
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: fontColor,
                                                  fontFamily: "Satoshi",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ); // Your custom dialog content
                      },
                      transitionBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final ColorTween colorTween = ColorTween(
                          begin: const Color(0xFFFCFFFF),
                          end: const Color(0x80FCFFFF),
                        );

                        final halfAnimation = CurvedAnimation(
                          parent: animation,
                          curve: const Interval(0.0, 0.57),
                        );

                        final halfSecondaryAnimation = CurvedAnimation(
                          parent: secondaryAnimation,
                          curve: const Interval(0.57, 0.0),
                        );

                        halfAnimation.addListener(() {
                          final color = colorTween.evaluate(halfAnimation)!;
                          SystemChrome.setSystemUIOverlayStyle(
                            SystemUiOverlayStyle(
                              systemNavigationBarColor: color,
                            ),
                          );
                        });

                        // Reverse color animation on dialog close
                        halfSecondaryAnimation.addListener(() {
                          final color =
                              colorTween.evaluate(halfSecondaryAnimation)!;
                          SystemChrome.setSystemUIOverlayStyle(
                            SystemUiOverlayStyle(
                                systemNavigationBarColor: color),
                          );
                        });

                        // Fade transition for dialog
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    );
                  },
                  icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedDelete02,
                      color: errorColor)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Image.asset(
                'assets/images/course_icon.png',
                height: 48.0,
                width: 48.0,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseCode,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: fontColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 200.0,
                    child: Text(
                      courseTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14,
                          color: fontColor,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 14,
                backgroundColor: grayColor,
                child: Icon(Icons.person, color: backgroundColor, size: 18),
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: SizedBox(
                width: 100.0,
                child: Text(
                  lecturers.join(', '),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: grayColor),
                ),
              )),
              TextButton(
                onPressed: () {
                  context.push("/attendance");
                },
                child: const Text(
                  'Attendance',
                  style: TextStyle(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    decorationColor: primaryColor,
                    decorationThickness: 1.5,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
