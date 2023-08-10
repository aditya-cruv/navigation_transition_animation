import 'package:flutter/material.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos Screen'),
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          // swipe down
          if (details.delta.dy > 6) {
            Navigator.of(context).pop();
          }
        },
        child: Container(
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
