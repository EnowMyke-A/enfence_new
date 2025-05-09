import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smooth_corner/smooth_corner.dart';

class BottomNavigation extends StatefulWidget {
  final String link;
  const BottomNavigation({super.key, required this.link});
  int setCurrentIndex() {
    switch (link) {
      case '/home':
        return 0;
      case '/statistics':
        return 1;
      case '/complaints':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }

  @override
  // ignore: library_private_types_in_public_api
  _ButtonNavigationState createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFFCFDFD),
        shape: SmoothRectangleBorder(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero),
          smoothness: 1.0,
        ),
        shadows: const [
          BoxShadow(
              color: Color(0x1A8F9BB3),
              offset: Offset(0, 1),
              blurRadius: 25,
              spreadRadius: 0),
          BoxShadow(
              color: Color(0x1A8F9BB3),
              offset: Offset(0, 4),
              blurRadius: 25,
              spreadRadius: 0)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: GNav(
          haptic: false,
          textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Satoshi',
              color: Color(0xFFFCFFFF)),
          tabBorderRadius: 12,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCirc,
          gap: 5,
          color: const Color(0xFF8F9BB3),
          activeColor: const Color(0xFFFCFFFF),
          iconSize: 24,
          textSize: 16.0,
          tabBackgroundColor:
              const Color(0xFF735BF2), // selected tab background color
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          backgroundColor: const Color(0xFFFCFEFE),
          tabs: [
            GButton(
              icon: HugeIcons.strokeRoundedHome02,
              onPressed: () {
                GoRouter.of(context).go('/home');
              },
              text: "Home",
            ),
            GButton(
                icon: HugeIcons.strokeRoundedLibrary,
                onPressed: () {
                  GoRouter.of(context).go('/statistics');
                },
                text: "Courses"),
            GButton(
              icon: HugeIcons.strokeRoundedMessage01,
              onPressed: () {
                GoRouter.of(context).go('/complaints');
              },
              text: "Chats",
            ),
            GButton(
              icon: HugeIcons.strokeRoundedUserCircle,
              onPressed: () {
                GoRouter.of(context).go('/profile');
              },
              text: "Profile",
            )
          ],
          selectedIndex: widget.setCurrentIndex(),
        ),
      ),
    );
  }
}
