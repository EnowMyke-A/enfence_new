import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_corner/smooth_corner.dart';

class InternetConnectionChecker extends StatefulWidget {
  final Widget child;

  const InternetConnectionChecker({super.key, required this.child});

  @override
  _InternetConnectionCheckerState createState() =>
      _InternetConnectionCheckerState();
}

class _InternetConnectionCheckerState extends State<InternetConnectionChecker> {
  bool _isConnected = true;
  bool _isDialogVisible = false; // Track if a dialog is currently shown
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  Color primaryColor = const Color(0xFF735BF2);
  Color fontColor = const Color(0xFF222B45);
  Color backgroundColor = const Color(0xFFFCFFFF);
  Color grayColor = const Color(0xFF8F9BB3);
  Color errorColor = const Color(0xFFF25B5B);

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      bool wasConnected = _isConnected; // Store previous connection state
      setState(() {
        _isConnected =
            (result.isNotEmpty && result.first != ConnectivityResult.none);
      });

      if (!_isConnected && !_isDialogVisible) {
        // Show no internet dialog only if not already shown and disconnected
        _showNoInternetDialog(context);
      } else if (_isConnected && !wasConnected && _isDialogVisible) {
        // Show internet connected dialog only when reconnected from a disconnected state and if dialog was previously visible
        Navigator.of(context).pop(); // Close the no internet dialog
        _showInternetConnectedDialog(context);
      } else if (_isConnected && !wasConnected && !_isDialogVisible) {
        // Show internet connected dialog only when reconnected from a disconnected state and if dialog was not previously visible
        _showInternetConnectedDialog(context);
      }
    });
  }

  Future<void> _checkConnectivity() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      setState(() {
        _isConnected = (connectivityResult != ConnectivityResult.none);
      });

      if (!_isConnected && !_isDialogVisible && mounted) {
        _showNoInternetDialog(context);
      }
    } catch (e) {
      // Handle the exception (e.g., log it)
      print("Error checking connectivity: $e");
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void _showNoInternetDialog(BuildContext context) {
    if (!mounted) return; // Check if the widget is still mounted
    _isDialogVisible = true; // Set dialog visibility to true
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("No Internet Connection"),
          content: const Text(
              "Please check your internet connection and try again."),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                _isDialogVisible = false; // Reset dialog visibility when closed
              },
            ),
          ],
        );
      },
    );
  }

  void _showInternetConnectedDialog(BuildContext context) {
    if (!mounted) return; // Check if the widget is still mounted
    _isDialogVisible = true; // Set dialog visibility to true
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: 'logout',
      transitionDuration: const Duration(milliseconds: 5),
      barrierColor: const Color(0x80000000), // Optional barrier color
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
                    "Logout?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Satoshi',
                        color: fontColor,
                        height: 1.2),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothContainer(
                          borderRadius: BorderRadius.circular(12.0),
                          smoothness: 1.0,
                          color: errorColor,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0))),
                            child: const Text(
                              "Logout",
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
                          borderRadius: BorderRadius.circular(12.0),
                          smoothness: 1.0,
                          color: const Color(0x338F9BB3),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0))),
                            child: Text(
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
      transitionBuilder: (context, animation, secondaryAnimation, child) {
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
          final color = colorTween.evaluate(halfSecondaryAnimation)!;
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(systemNavigationBarColor: color),
          );
        });

        // Fade transition for dialog
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
