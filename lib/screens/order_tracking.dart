import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracking Screen'),
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          // swipe down
          if (details.delta.dy > 6) {
            Navigator.of(context).pop();
          }
        },
        child: Container(
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
