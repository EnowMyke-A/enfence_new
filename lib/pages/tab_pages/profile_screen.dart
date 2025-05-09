import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  bool darkMode = false;
  bool notification = false;

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

    return SafeArea(
        child: Container(
      color: backgroundColor,
      width: screenWidth,
      height: screenHeight,
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 48, 18, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border(
                          top: BorderSide(width: 5.0, color: primaryColor),
                          left: BorderSide(width: 5.0, color: primaryColor),
                          bottom: BorderSide(width: 5.0, color: primaryColor),
                          right: BorderSide(width: 5.0, color: primaryColor))),
                  child: ClipOval(
                      child: /*Image.network(
                    'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  )*/
                          Image.asset(
                    'assets/images/avatar.jpeg',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  )),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Oliver Twist",
                  style: TextStyle(
                    color: fontColor,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text("FE21A183",
                    style: TextStyle(
                      color: grayColor,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    )),
                const SizedBox(
                  height: 16.0,
                ),
                SmoothContainer(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12.0),
                    smoothness: 1.0,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.all(16.0)),
                        child: const Text(
                          "Edit profile",
                          style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFCFFFF)),
                        ))),
                const SizedBox(
                  height: 48.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 8.0),
                  child: Column(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              darkMode = !darkMode;
                            });
                          },
                          splashColor: const Color(0x1A8F9BB3),
                          borderRadius: BorderRadius.circular(12.0),
                          child: Container(
                            height: 55.0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            decoration: ShapeDecoration(
                              shape: SmoothRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                smoothness: 1.0,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HugeIcon(
                                        icon: HugeIcons.strokeRoundedMoon02,
                                        size: 24.0,
                                        color: grayColor),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Text(
                                      "Dark mode",
                                      style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: fontColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  child: AnimatedToggleSwitch<bool>.dual(
                                    current: darkMode,
                                    first: false,
                                    second: true,
                                    spacing: 0.0,
                                    height: 34.0,
                                    borderWidth: 3.0,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    animationCurve: Curves.easeInOutCirc,
                                    onChanged: (b) =>
                                        setState(() => darkMode = b),
                                    styleBuilder: (b) => ToggleStyle(
                                        indicatorColor: backgroundColor,
                                        borderColor: Colors.transparent,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100.0)),
                                        indicatorBoxShadow: [
                                          const BoxShadow(
                                              color: Color(0x0F000000),
                                              offset: Offset(0, 3),
                                              spreadRadius: 0,
                                              blurRadius: 1.0),
                                          const BoxShadow(
                                              color: Color(0x26000000),
                                              offset: Offset(0, 3),
                                              spreadRadius: 0,
                                              blurRadius: 8.0),
                                          const BoxShadow(
                                              color: Color(0x0A000000),
                                              offset: Offset(0, 0),
                                              spreadRadius: 1.0,
                                              blurRadius: 0.0),
                                        ],
                                        backgroundColor: b
                                            ? primaryColor
                                            : const Color(0x298F9BB3)),
                                    indicatorSize: const Size(27.0, 27.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              notification = !notification;
                            });
                          },
                          splashColor: const Color(0x1A8F9BB3),
                          borderRadius: BorderRadius.circular(12.0),
                          child: Container(
                            height: 55.0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 8.0),
                            decoration: ShapeDecoration(
                              shape: SmoothRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                smoothness: 1.0,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HugeIcon(
                                        icon: HugeIcons
                                            .strokeRoundedNotification02,
                                        size: 24.0,
                                        color: grayColor),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Text(
                                      "Push notification",
                                      style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: fontColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  child: AnimatedToggleSwitch<bool>.dual(
                                    current: notification,
                                    first: false,
                                    second: true,
                                    spacing: 1.0,
                                    height: 34.0,
                                    borderWidth: 3.0,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    animationCurve: Curves.easeInOutCirc,
                                    onChanged: (b) =>
                                        setState(() => notification = b),
                                    styleBuilder: (b) => ToggleStyle(
                                        indicatorColor: backgroundColor,
                                        borderColor: Colors.transparent,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100.0)),
                                        indicatorBoxShadow: [
                                          const BoxShadow(
                                              color: Color(0x0F000000),
                                              offset: Offset(0, 3),
                                              spreadRadius: 0,
                                              blurRadius: 1.0),
                                          const BoxShadow(
                                              color: Color(0x26000000),
                                              offset: Offset(0, 3),
                                              spreadRadius: 0,
                                              blurRadius: 8.0),
                                          const BoxShadow(
                                              color: Color(0x0A000000),
                                              offset: Offset(0, 0),
                                              spreadRadius: 1.0,
                                              blurRadius: 0.0),
                                        ],
                                        backgroundColor: b
                                            ? primaryColor
                                            : const Color(0x298F9BB3)),
                                    indicatorSize: const Size(27.0, 27.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          splashColor: const Color(0x1A8F9BB3),
                          borderRadius: BorderRadius.circular(12.0),
                          child: Container(
                            height: 55.0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 8.0),
                            decoration: ShapeDecoration(
                              shape: SmoothRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                smoothness: 1.0,
                              ),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HugeIcon(
                                        icon: HugeIcons.strokeRoundedComment01,
                                        size: 24.0,
                                        color: grayColor),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Text(
                                      "Feedback",
                                      style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: fontColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  child: HugeIcon(
                                      size: 24.0,
                                      icon: HugeIcons.strokeRoundedArrowRight02,
                                      color: fontColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            GoRouter.of(context).push("/privacy_policy");
                          },
                          splashColor: const Color(0x1A8F9BB3),
                          borderRadius: BorderRadius.circular(12.0),
                          child: Container(
                            height: 55.0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 8.0),
                            decoration: ShapeDecoration(
                              shape: SmoothRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                smoothness: 1.0,
                              ),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HugeIcon(
                                        icon: HugeIcons
                                            .strokeRoundedSecurityCheck,
                                        size: 24.0,
                                        color: grayColor),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Text(
                                      "Privacy policy",
                                      style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: fontColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  child: HugeIcon(
                                      size: 24.0,
                                      icon: HugeIcons.strokeRoundedArrowRight02,
                                      color: fontColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: const Color(0x1A8F9BB3),
                          onTap: () {
                            GoRouter.of(context).push("/about_app");
                          },
                          borderRadius: BorderRadius.circular(12.0),
                          child: Container(
                            height: 55.0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 8.0),
                            decoration: ShapeDecoration(
                              shape: SmoothRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                smoothness: 1.0,
                              ),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HugeIcon(
                                        icon: HugeIcons
                                            .strokeRoundedInformationCircle,
                                        size: 24.0,
                                        color: grayColor),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Text(
                                      "About app",
                                      style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: fontColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  child: HugeIcon(
                                      size: 24.0,
                                      icon: HugeIcons.strokeRoundedArrowRight02,
                                      color: fontColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              showGeneralDialog(
                                context: context,
                                barrierDismissible: false,
                                barrierLabel: 'logout',
                                transitionDuration:
                                    const Duration(milliseconds: 5),
                                barrierColor: const Color(
                                    0x80000000), // Optional barrier color
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
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
                                            const Text(
                                              "Logout?",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Satoshi',
                                                  color: fontColor,
                                                  height: 1.2),
                                            ),
                                            const SizedBox(height: 4.0),
                                            const Text(
                                              "Are you sure you want logout?",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Satoshi',
                                                  color: grayColor),
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
                                                        BorderRadius.circular(
                                                            12.0),
                                                    smoothness: 1.0,
                                                    color: errorColor,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          shadowColor: Colors
                                                              .transparent,
                                                          elevation: 0.0,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      24,
                                                                  vertical: 12),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0))),
                                                      child: const Text(
                                                        "Logout",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFCFFFF),
                                                            fontFamily:
                                                                "Satoshi",
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                        BorderRadius.circular(
                                                            12.0),
                                                    smoothness: 1.0,
                                                    color:
                                                        const Color(0x338F9BB3),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          shadowColor: Colors
                                                              .transparent,
                                                          elevation: 0.0,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      24,
                                                                  vertical: 12),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0))),
                                                      child: const Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: fontColor,
                                                            fontFamily:
                                                                "Satoshi",
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                transitionBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final ColorTween colorTween = ColorTween(
                                    begin: const Color(0xFFFCFFFF),
                                    end: const Color(0x80FCFFFF),
                                  );

                                  final halfAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: const Interval(0.0, 0.57),
                                  );

                                  final halfSecondaryAnimation =
                                      CurvedAnimation(
                                    parent: secondaryAnimation,
                                    curve: const Interval(0.57, 0.0),
                                  );

                                  halfAnimation.addListener(() {
                                    final color =
                                        colorTween.evaluate(halfAnimation)!;
                                    SystemChrome.setSystemUIOverlayStyle(
                                      SystemUiOverlayStyle(
                                        systemNavigationBarColor: color,
                                      ),
                                    );
                                  });

                                  // Reverse color animation on dialog close
                                  halfSecondaryAnimation.addListener(() {
                                    final color = colorTween
                                        .evaluate(halfSecondaryAnimation)!;
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

                              // Ensure navigation bar returns to the initial color as a fallback
                              SystemChrome.setSystemUIOverlayStyle(
                                const SystemUiOverlayStyle(
                                    systemNavigationBarColor:
                                        Color(0xFFFCFFFF)),
                              );
                            },
                            splashColor: const Color(0x1A8F9BB3),
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              height: 55.0,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6.0, horizontal: 8.0),
                              decoration: ShapeDecoration(
                                shape: SmoothRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  smoothness: 1.0,
                                ),
                              ),
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      HugeIcon(
                                          icon: HugeIcons.strokeRoundedLogout03,
                                          size: 24.0,
                                          color: errorColor),
                                      SizedBox(
                                        width: 16.0,
                                      ),
                                      Text(
                                        "Logout",
                                        style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: errorColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    ));
  }
}
