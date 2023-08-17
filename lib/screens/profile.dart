import 'package:animations/animations/navigation_transition.dart';
import 'package:animations/screens/explore.dart';
import 'package:animations/screens/best_of.dart';
import 'package:animations/screens/orders.dart';
import 'package:animations/screens/search.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  void swipeUp(BuildContext context) {
    Navigator.of(context).push(NavigationTransition(
        nextScreen: const Explore(),
        currentScreen: this,
        swipeDirection: 'up'));
  }

  void swipeDown(BuildContext context) {
    Navigator.of(context).push(
      NavigationTransition(
          nextScreen: const SearchScreen(),
          currentScreen: this,
          swipeDirection: 'down'),
    );
  }

  void swipeLeft(BuildContext context) {
    Navigator.of(context).push(
      NavigationTransition(
          nextScreen: const BestOfScreen(),
          currentScreen: this,
          swipeDirection: 'left'),
    );
  }

  void swipeRight(BuildContext context) {
    Navigator.of(context).push(
      NavigationTransition(
          nextScreen: const OrdersScreen(),
          currentScreen: this,
          swipeDirection: 'right'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          // swipe up
          if (details.delta.dy < -10) {
            swipeUp(context);
          }

          // swipe down
          if (details.delta.dy > 10) {
            swipeDown(context);
          }
        },
        onHorizontalDragUpdate: (details) {
          // swipe left
          if (details.delta.dx < -6) {
            swipeLeft(context);
          }

          // swipe right
          if (details.delta.dx > 6) {
            swipeRight(context);
          }
        },
        child: Container(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
