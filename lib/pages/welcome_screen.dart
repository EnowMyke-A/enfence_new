import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 48, 18, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Image.asset("assets/images/girl_welcome.png"),
                      const SizedBox(height: 48.0),
                      const Text(
                        "Step in, we’ve got you counted!",
                        style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 32.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.1,
                            color: Color(0xFF222B45),
                            height: 1.30),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        "Just walk into your classroom. Our smart geofencing tech does the rest—no attendance signing, no stress, just effortless tracking.",
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16.0,
                          height: 1.50,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.1,
                          color: Color(0xFF222B45),
                        ),
                        textAlign: TextAlign.center,
                      )
                    ]),
                    Column(
                      children: [
                        SmoothContainer(
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
                            child: const Text(
                              "Get started",
                              style: TextStyle(
                                  color: Color(0xFFFCFFFF),
                                  fontFamily: "Satoshi",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            onPressed: () {
                              context.push('/signup');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontFamily: "Satoshi",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF222B45)),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            TextButton(
                                onPressed: () {
                                  GoRouter.of(context).push('/login');
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize:
                                      Size.zero, // Ensures no extra space
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontFamily: "Satoshi",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF735BF2)),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
