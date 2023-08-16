import 'package:flutter/material.dart';

class HorizontalSwipeNavigation extends PageRouteBuilder {
  final Widget nextScreen;
  final Widget currentScreen;
  final String swipeDirection;

  HorizontalSwipeNavigation(
      {required this.nextScreen,
      required this.currentScreen,
      required this.swipeDirection})
      : super(
            transitionDuration: const Duration(seconds: 1),
            reverseTransitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final begin = swipeDirection == 'left'
                  ? const Offset(1, 0)
                  : const Offset(-1, 0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween = Tween(begin: begin, end: end).chain(
                CurveTween(curve: curve),
              );
              var reverseTween = Tween(
                      begin: Offset.zero,
                      end: swipeDirection == 'left'
                          ? const Offset(-1, 0)
                          : const Offset(1, 0))
                  .chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              var reverseOffsetAnimation = animation.drive(reverseTween);
              return Stack(
                children: [
                  // incoming animation
                  SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),

                  // outgoing animation
                  SlideTransition(
                    position: reverseOffsetAnimation,
                    child: currentScreen,
                  )
                ],
              );
            });
}
