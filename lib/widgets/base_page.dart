import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:smooth_corner/smooth_corner.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({super.key});
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  bool _isConnected = true;
  bool _isDialogVisible = false;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  Color primaryColor = const Color(0xFF735BF2);
  Color fontColor = const Color(0xFF222B45);
  Color backgroundColor = const Color(0xFFFCFFFF);
  Color grayColor = const Color(0xFF8F9BB3);
  Color errorColor = const Color(0xFFF25B5B);

  @override
  void initState() {
    super.initState();
    _startConnectivityListener();
    _checkInitialConnectivity();
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  Future<void> _checkInitialConnectivity() async {
    try {
      List<ConnectivityResult>
          connectivityResultList = // Variable declared as List<ConnectivityResult>
          await Connectivity()
              .checkConnectivity(); // await keyword is used to get the List from the Future
      _updateConnectionStatus(connectivityResultList);
    } catch (e) {
      _logError("Error during initial connectivity check", e);
    }
  }

  void _startConnectivityListener() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
        (List<ConnectivityResult> resultList) {
      // Updated parameter type
      _updateConnectionStatus(resultList);
    }, onError: (error) {
      _logError("Error in connectivity stream", error);
    });
  }

  void _updateConnectionStatus(List<ConnectivityResult> resultList) {
    // Updated parameter type
    if (mounted) {
      setState(() {
        _isConnected = resultList.isNotEmpty &&
            resultList.any((result) => result != ConnectivityResult.none);
      });

      if (_isConnected) {
        _showInternetConnectedDialog();
      } else {
        _showNoInternetDialog();
      }
    } else {
      _logWarning(
          "setState called after widget was disposed in _updateConnectionStatus");
    }
  }

  Future<void> _showNoInternetDialog() async {
    if (!mounted || _isDialogVisible) return;
    _isDialogVisible = true;
    await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: 'internet_connection',
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
                    "assets/images/wifi-circle.png",
                    width: 72,
                    height: 72,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "You're Offline",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Satoshi',
                        color: fontColor,
                        height: 1.2),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Connection is slow or unstable. Switch to offline mode",
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothContainer(
                          borderRadius: BorderRadius.circular(12.0),
                          smoothness: 1.0,
                          color: primaryColor,
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
                              "Switch to Offline Mode",
                              style: TextStyle(
                                  color: backgroundColor,
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
    _isDialogVisible =
        false; // Reset here as well in case dialog is dismissed by other means
  }

  Future<void> _showInternetConnectedDialog() async {
    if (!mounted || _isDialogVisible) return;
    _isDialogVisible = true;
    await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: 'internet_connection',
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
                    "assets/images/checkmark-circle-02.png",
                    width: 72,
                    height: 72,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "You're online",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Satoshi',
                        color: fontColor,
                        height: 1.2),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Offline activities will be synchronised in background",
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothContainer(
                          borderRadius: BorderRadius.circular(12.0),
                          smoothness: 1.0,
                          color: primaryColor,
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
                              "Ok",
                              style: TextStyle(
                                  color: backgroundColor,
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

    _isDialogVisible =
        false; // Reset here as well in case dialog is dismissed by other means
  }

  void _logError(String message, dynamic error) {
    if (kDebugMode) {
      debugPrint('$message: $error');
    }
    // In production, you might want to use a more sophisticated logging mechanism
  }

  void _logWarning(String message) {
    if (kDebugMode) {
      debugPrint(message);
    }
    // In production, you might want to use a more sophisticated logging mechanism
  }
}
