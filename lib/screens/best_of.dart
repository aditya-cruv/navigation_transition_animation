import 'package:animations/animations/navigation_transition.dart';
import 'package:animations/screens/search.dart';
import 'package:animations/screens/videos.dart';
import 'package:flutter/material.dart';

class BestOfScreen extends StatelessWidget {
  const BestOfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best of Screen'),
      ),
      body: GestureDetector(
        // swipe right
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 6) {
            Navigator.of(context).pop();
          }
        },
        onVerticalDragUpdate: (details) {
          // swipe down
          if (details.delta.dy > 6) {
            Navigator.of(context).push(NavigationTransition(
                nextScreen: const SearchScreen(),
                currentScreen: this,
                swipeDirection: 'down'));
          }

          // swipe up
          if (details.delta.dy < -6) {
            Navigator.of(context).push(NavigationTransition(
                nextScreen: const VideosScreen(),
                currentScreen: this,
                swipeDirection: 'up'));
          }
        },
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
