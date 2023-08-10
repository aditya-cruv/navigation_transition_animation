import 'package:flutter/material.dart';

class HorizontalSwipeNavigation extends PageRouteBuilder {
  final Widget widget;
  final String swipeDirection;
  HorizontalSwipeNavigation(
      {required this.widget, required this.swipeDirection})
      : super(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final begin = swipeDirection == 'left'
                ? const Offset(1.0, 0.0)
                : const Offset(-1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
