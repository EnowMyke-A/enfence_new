import 'package:enfence_new/pages/attendance_detail.dart';
import 'package:enfence_new/pages/register_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import './pages/welcome_screen.dart';
import './pages/about_app.dart';
import './pages/privacy_policy.dart';
import './pages/login.dart';
import './pages/tab_pages/bottom_nav.dart';
import './pages/tab_pages/compaints_screen.dart';
import './pages/tab_pages/home_screen.dart';
import './pages/tab_pages/profile_screen.dart';
import './pages/tab_pages/course_screen.dart';
import './pages/notification.dart';
import './pages/class_detail.dart';
import './pages/signup.dart';
import './pages/upload_image.dart';

void main() {
  runApp(
    const Enfence(),
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0x00FCFFFF),
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Color(0xFFFCFFFF),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

final GoRouter router =
    GoRouter(initialLocation: "/welcome", routes: <RouteBase>[
  GoRoute(
    path: "/login",
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: "/signup",
    builder: (context, state) => const SignUpScreen(),
  ),
  ShellRoute(
    builder: (context, state, child) {
      final currentRoute = state.uri.toString();
      return Scaffold(
        backgroundColor: const Color(0xFFFCFFFF),
        body: child,
        bottomNavigationBar: BottomNavigation(link: currentRoute),
      );
    },
    routes: <RouteBase>[
      GoRoute(
        path: "/home",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
          );
        },
      ),
      GoRoute(
        path: "/statistics",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const StatsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return child;
            },
          );
        },
      ),
      GoRoute(
        path: "/complaints",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const ComplaintScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return child;
            },
          );
        },
      ),
      GoRoute(
        path: "/profile",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ProfileScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return child;
            },
          );
        },
      ),
    ],
  ),
  GoRoute(
    path: "/about_app",
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const AboutApp(),
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Change the opacity of the screen using a Curve based on the the animation's
          // value
          return SlideTransition(
            position: Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: "/upload_photo",
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const ProfilePictureUploadScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Change the opacity of the screen using a Curve based on the the animation's
          // value
          return SlideTransition(
            position: Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: "/register_courses",
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const RegisterCourse(),
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Change the opacity of the screen using a Curve based on the the animation's
          // value
          return SlideTransition(
            position: Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: "/attendance",
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const AttendanceScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Change the opacity of the screen using a Curve based on the the animation's
          // value
          return SlideTransition(
            position: Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: "/privacy_policy",
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const PrivacyPolicy(),
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Change the opacity of the screen using a Curve based on the the animation's
          // value
          return SlideTransition(
            position: Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: "/notifications",
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const NotificationScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Change the opacity of the screen using a Curve based on the the animation's
          // value
          return SlideTransition(
            position: Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: "/class_today",
    builder: (context, state) {
      final data = state.extra as Object;
      return ClassDetailScreen(data: data);
    },
  ),
  GoRoute(
    path: "/welcome",
    builder: (context, state) => const WelcomeScreen(),
  ),
]);

class Enfence extends StatelessWidget {
  const Enfence({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Satoshi',
      ),
      routerConfig: router,
    );
  }
}
