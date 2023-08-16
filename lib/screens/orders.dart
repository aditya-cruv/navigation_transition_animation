import 'package:animations/screens/order_tracking.dart';
import 'package:animations/screens/search.dart';
import 'package:animations/animations/vertical_swipe.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Screen'),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // swipe left
          if (details.delta.dx > -10) {
            Navigator.of(context).pop();
          }
        },
        onVerticalDragUpdate: (details) {
          // swipe down
          if (details.delta.dy > 10) {
            Navigator.of(context).push(VerticalSwipeNavigation(
                nextScreen: const SearchScreen(),currentScreen: this, swipeDirection: 'down'));
          }

          if (details.delta.dy < -6) {
            Navigator.of(context).push(VerticalSwipeNavigation(
                swipeDirection: 'up', nextScreen: const OrderTrackingScreen(),currentScreen: this,));
          }
        },
        
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
