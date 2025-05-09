import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavBarColorDialog extends StatefulWidget {
  final Color initialNavBarColor;
  final Color targetNavBarColor;
  final Widget dialogContent;
  final Duration dialogAnimationDuration;
  final Duration colorTransitionDuration;

  const NavBarColorDialog({
    super.key,
    required this.initialNavBarColor,
    required this.targetNavBarColor,
    required this.dialogContent,
    this.dialogAnimationDuration = const Duration(milliseconds: 300),
    this.colorTransitionDuration = const Duration(milliseconds: 500),
  });

  @override
  State<NavBarColorDialog> createState() => _NavBarColorDialogState();
}

class _NavBarColorDialogState extends State<NavBarColorDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _colorController = AnimationController(
      duration: widget.colorTransitionDuration,
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: widget.initialNavBarColor,
      end: widget.targetNavBarColor,
    ).animate(_colorController);

    _colorController.addListener(() {
      final color = _colorAnimation.value!;
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: color),
      );
    });

    _colorController.forward();
  }

  @override
  void dispose() {
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: 'Dismiss',
        transitionDuration: widget.dialogAnimationDuration,
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget.dialogContent;
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ).then((_) {
        _colorController.reverse();
      }),
      builder: (context, snapshot) {
        return const SizedBox(); // Empty container as placeholder
      },
    );
  }
}
