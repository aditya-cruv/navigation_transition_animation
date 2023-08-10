import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore page'),
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          // swipe down
          if (details.delta.dy > 6) {
            Navigator.of(context).pop();
          }
        },
        child: Container(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
