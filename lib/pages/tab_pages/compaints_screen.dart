import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../widgets/avatar.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:go_router/go_router.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    //Orientation orientation = MediaQuery.of(context).orientation;
    const primaryColor = Color(0xFF735BF2);
    const fontColor = Color(0xFF222B45);
    const backgroundColor = Color(0xFFFCFFFF);
    const grayColor = Color(0xFF8F9BB3);
    const errorColor = Color(0xFFF25B5B);

// Sample dataset
    final List<Profile> profiles = [
      Profile(
        imageUrl: 'https://example.com/image1.jpg', // Replace with actual URLs
        name: 'EEF467 F...',
      ),
      Profile(
        imageUrl: 'https://example.com/image2.jpg',
        name: 'John Doe',
      ),
      Profile(
        imageUrl: 'https://example.com/image3.jpg',
        name: 'Jane Smith',
      ),
      Profile(
        imageUrl: 'https://example.com/image4.jpg',
        name: 'Alex Carter',
      ),
    ];

    return SafeArea(
      child: Container(
          width: screenWidth,
          height: screenHeight,
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
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
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 48, 10, 28),
                    child: Column(
                      children: [
                        Image.asset('assets/images/coming_soon_final.png',
                            width: screenWidth),
                        const Text(
                          "Complaint feature will enable students provide complaints directly for missig classes to lecturers",
                          style: TextStyle(
                            fontFamily: "Satoshi",
                            fontSize: 16.0,
                            color: fontColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}

class Profile {
  final String imageUrl;
  final String name;

  Profile({required this.imageUrl, required this.name});
}
