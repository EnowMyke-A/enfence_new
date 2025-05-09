import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:sticky_headers/sticky_headers.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
                          padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Privacy policy",
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
                                        height: 32.0,
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            "EnFence is deeply committed to protecting your privacy and ensuring transparency in how your information is collected, used, and safeguarded. By using the EnFence app, you acknowledge and agree to the practices outlined in this Privacy Policy.",
                                            style: TextStyle(
                                                fontFamily: "Satoshi",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF222B45),
                                                height: 1.5),
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Information We Collect",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "EnFence collects certain data to provide seamless and efficient attendance tracking. This includes real-time GPS location data to determine your presence in designated areas like classrooms. Additionally, we may collect basic user information, such as your name, email address, and institution details, to facilitate app functionality and user management. Device data, such as your operating system and unique identifiers, is also collected for diagnostic and troubleshooting purposes.",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "How We Use Your Data",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "The data we collect is exclusively used to enable and enhance the app’s functionality. Location data allows us to track attendance automatically when you are within specified geofenced areas. Personal and device information helps us improve the app, address issues, and communicate important updates.",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Location Data Handling",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "We understand the sensitivity of location data and handle it with the utmost care. Your location information is processed locally on your device and is never transmitted over a network or shared with third parties. This ensures that your GPS data remains private and secure.",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Data Sharing and Security",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "EnFence does not sell, rent, or share your personal information with any third parties, except as required by law or in compliance with legal obligations. We employ advanced security measures to protect your data from unauthorized access, ensuring your information is stored and managed securely. While no system is entirely immune to vulnerabilities, we continually enhance our practices to maintain your trust.",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Your Rights",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "You have full control over your personal data. You can request to access, modify, or delete your information at any time. Should you wish to withdraw your consent for data collection, you can do so by contacting our support team.",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Children’s Privacy",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "EnFence is designed for use in educational institutions. If you are under the age of 13, you must obtain permission from a parent or guardian before using the app.",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Updates to This Policy",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "This Privacy Policy may be updated periodically to reflect changes in our practices or legal requirements. Any updates will be communicated through the app, and your continued use of EnFence constitutes acceptance of the revised policy.",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Contact Us",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "If you have any questions or concerns about this Privacy Policy or how your data is managed, please reach out to us via email at infos@enfence.com.",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "EnFence is designed to respect your privacy while leveraging advanced geofencing technology to simplify attendance management. Thank you for trusting EnFence!",
                                                style: TextStyle(
                                                    fontFamily: "Satoshi",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222B45),
                                                    height: 1.5),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 32.0,
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              )))),
    );
  }
}
