import 'package:flutter/material.dart';

class NavigationTransition extends PageRouteBuilder {
  final Widget nextScreen;
  final Widget currentScreen;
  final String swipeDirection;

  NavigationTransition(
      {required this.nextScreen,
      required this.currentScreen,
      required this.swipeDirection})
      : super(
            transitionDuration: const Duration(seconds: 1),
            reverseTransitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              Offset begin;
              const end = Offset.zero;
              Offset reverseEnd;

              if (swipeDirection == 'up') {
                begin = const Offset(0, 1);
                reverseEnd = const Offset(0, -1);
              } else if (swipeDirection == 'down') {
                begin = const Offset(0, -1);
                reverseEnd = const Offset(0, 1);
              } else if (swipeDirection == 'left') {
                begin = const Offset(1, 0);
                reverseEnd = const Offset(-1, 0);
              } else {
                begin = const Offset(-1, 0);
                reverseEnd = const Offset(1, 0);
              }

              const curve = Curves.ease;

              var tween = Tween(begin: begin, end: end).chain(
                CurveTween(curve: curve),
              );

              var reverseTween = Tween(begin: Offset.zero, end: reverseEnd)
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
