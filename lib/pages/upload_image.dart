import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:micro_loaders/micro_loaders.dart';
import 'package:go_router/go_router.dart';

class ProfilePictureUploadScreen extends StatefulWidget {
  const ProfilePictureUploadScreen({super.key});

  @override
  _ProfilePictureUploadScreenState createState() =>
      _ProfilePictureUploadScreenState();
}

class _ProfilePictureUploadScreenState
    extends State<ProfilePictureUploadScreen> {
  // Placeholder for the uploaded image.
  // Replace this with your actual image handling logic.
  ImageProvider? _profileImage;

  bool _isLoading = false;
  bool _isUploading = false;

  void _onLoginPressed() async {
    setState(() {
      _isLoading = true;
    });
    // Simulate a delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
      GoRouter.of(context).push("/register_courses");
    });
  }

  void _onUploadPressed() async {
    setState(() {
      _isUploading = true;
    });
    // Simulate a delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isUploading = false;
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

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
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
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                        backgroundColor: Colors.transparent),
                    child: const HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowLeft02,
                      color: Color(0xFF222B45),
                      size: 32.0,
                    ),
                  )),
              SizedBox(
                height: screenHeight / 12,
              ),
              Image.asset(
                "assets/images/logo_login.png",
                width: 145.0,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text("Upload your photo",
                  style: TextStyle(
                    fontFamily: "Satoshi",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: fontColor,
                  )),
              const SizedBox(
                height: 8.0,
              ),
              const Text("Choose a photo from your gallery",
                  style: TextStyle(
                    fontFamily: "Satoshi",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: grayColor,
                  )),
              const SizedBox(
                height: 24.0,
              ),
              GestureDetector(
                // Make the circle tappable
                onTap: () {
                  // Implement image upload logic here
                  // For example, you can use the image_picker plugin
                  print('Uploading image');
                  setState(() {
                    _profileImage = const NetworkImage(
                        // Replace with your image source
                        'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png');
                  });
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 100, // Adjust the size as needed
                      backgroundColor: Colors.grey[300], // Background color
                      backgroundImage:
                          _profileImage, // Display the uploaded image
                      child: _profileImage ==
                              null // Show an icon if no image is uploaded
                          ? const Icon(Icons.person,
                              size: 60, color: Colors.white)
                          : null,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt,
                            color: fontColor, size: 24),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Upload Button (you might want to remove this if the circle is enough)
              SmoothContainer(
                borderRadius: BorderRadius.circular(12.0),
                smoothness: 1.0,
                color: fontColor,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0.0,
                      minimumSize: const Size(150.0, 55.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Upload picture",
                        style: TextStyle(
                            color: backgroundColor,
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: _isUploading ? 8.0 : 0,
                      ),
                      _isUploading
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
                    _isUploading ? null : _onUploadPressed();
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
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
                    "Proceed to Register Courses",
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
          ),
        ),
      ),
    );
  }
}
