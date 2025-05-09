import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:micro_loaders/micro_loaders.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  bool _isObscure = true;
  bool _isLoading = false;

  void _onLoginPressed() async {
    setState(() {
      _isLoading = true;
    });
    // Simulate a delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
      GoRouter.of(context).push("/upload_photo");
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
    //Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
              child: SizedBox(
                  width: screenWidth,
                  height: screenHeight - 12,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(28, screenHeight / 8, 28, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Image.asset(
                            "assets/images/logo_login.png",
                            width: 145.0,
                          ),
                          const SizedBox(
                            height: 48.0,
                          ),
                          const Text("Let's kick start!",
                              style: TextStyle(
                                fontFamily: "Satoshi",
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: fontColor,
                              )),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text("Please enter your details",
                              style: TextStyle(
                                fontFamily: "Satoshi",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: grayColor,
                              )),
                          const SizedBox(height: 48.0),
                          SizedBox(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14.0, horizontal: 20.0),
                                hintText: 'Name',
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  color: grayColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: Color(0x338F9BB3),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w500,
                                  color: fontColor,
                                  fontSize: 16.0),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14.0, horizontal: 20.0),
                                hintText: 'Matricule',
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  color: grayColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: Color(0x338F9BB3),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w500,
                                  color: fontColor,
                                  fontSize: 16.0),
                            ),
                          ),
                          const SizedBox(height: 16), // Space between fields
                          // Password Input Field
                          SizedBox(
                            child: TextField(
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 20.0),
                                  hintStyle: const TextStyle(
                                    fontSize: 16,
                                    color: grayColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                      color: primaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                      splashColor: Colors
                                          .transparent, // Disable the splash effect
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                      icon: HugeIcon(
                                        icon: _isObscure
                                            ? HugeIcons
                                                .strokeRoundedViewOffSlash
                                            : HugeIcons.strokeRoundedView,
                                        color: const Color(0xFF8F9BB3),
                                        size: 24.0,
                                      )),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      color: Color(0x338F9BB3),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                style: const TextStyle(
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                    color: fontColor,
                                    fontSize: 16.0)),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SmoothContainer(
                            borderRadius: BorderRadius.circular(12.0),
                            smoothness: 1.0,
                            color: primaryColor,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  elevation: 0.0,
                                  minimumSize:
                                      const Size(double.infinity, 55.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16.0))),
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
                                _isLoading ? null : _onLoginPressed();
                              },
                            ),
                          )
                        ]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Have an account already?",
                              style: TextStyle(
                                  fontFamily: "Satoshi",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: fontColor),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            TextButton(
                                onPressed: () {
                                  context.push('/login');
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
                                      color: primaryColor),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ))),
        ));
  }
}
