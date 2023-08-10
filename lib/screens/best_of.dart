import 'package:animations/screens/search.dart';
import 'package:animations/screens/videos.dart';
import 'package:animations/animations/vertical_swipe.dart';
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
            Navigator.of(context).push(VerticalSwipeNavigation(
                widget: const SearchScreen(), swipeDirection: 'down'));
          }

          // swipe up
          if (details.delta.dy < -6) {
            Navigator.of(context).push(VerticalSwipeNavigation(
                widget: const VideosScreen(), swipeDirection: 'up'));
          }
        },
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
