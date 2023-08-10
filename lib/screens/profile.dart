import 'package:animations/screens/explore.dart';
import 'package:animations/screens/best_of.dart';
import 'package:animations/screens/orders.dart';
import 'package:animations/screens/search.dart';
import 'package:animations/animations/vertical_swipe.dart';
import 'package:animations/animations/horizontal_swipe.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  void swipeUp(BuildContext context) {
    Navigator.of(context).push(
        VerticalSwipeNavigation(widget: const Explore(), swipeDirection: 'up'));
  }

  void swipeDown(BuildContext context) {
    Navigator.of(context).push(
      VerticalSwipeNavigation(
          widget: const SearchScreen(), swipeDirection: 'down'),
    );
  }

  void swipeLeft(BuildContext context) {
    Navigator.of(context).push(
      HorizontalSwipeNavigation(
          widget: const BestOfScreen(), swipeDirection: 'left'),
    );
  }

  void swipeRight(BuildContext context) {
    Navigator.of(context).push(
      HorizontalSwipeNavigation(
          widget: const OrdersScreen(), swipeDirection: 'right'),
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
          if (details.delta.dy < -6) {
            swipeUp(context);
          }

          // swipe down
          if (details.delta.dy > 6) {
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
