import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:sticky_headers/sticky_headers.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    //Orientation orientation = MediaQuery.of(context).orientation;

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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 72.0,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 24),
                              child: SizedBox(
                                width: screenWidth - 48,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "About Enfence",
                                          style: TextStyle(
                                              fontFamily: "Satoshi",
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF222B45)),
                                        ),
                                        const SizedBox(
                                          height: 48.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/enfence_v1.png",
                                              width: 137.0,
                                            ),
                                            const SizedBox(
                                              height: 16.0,
                                            ),
                                            const Text(
                                              "Enfence v1.00, the first version in it’s series to track and manage attendance using geofencing",
                                              style: TextStyle(
                                                  fontFamily: "Satoshi",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF222B45),
                                                  height: 1.5),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 32.0,
                                    ),
                                    SmoothContainer(
                                        color: const Color(0xFF735BF2),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        smoothness: 1.0,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                padding:
                                                    const EdgeInsets.all(16.0)),
                                            child: const Text(
                                              "Check for updates",
                                              style: TextStyle(
                                                  fontFamily: 'Satoshi',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFFFCFFFF)),
                                            ))),
                                  ],
                                ),
                              ))
                        ],
                      )))),
        ));
  }
}
