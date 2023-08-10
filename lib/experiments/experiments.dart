import 'package:flutter/material.dart';

class Experiments extends StatefulWidget {
  const Experiments({super.key});

  @override
  State<Experiments> createState() => _ExperimentsState();
}

class _ExperimentsState extends State<Experiments> {
  double _sliderValue = 0;
  Color _newColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TweenAnimationBuilder(
                duration: const Duration(seconds: 5),
                tween: ColorTween(begin: Colors.white, end: _newColor),
                builder: (context, Color, child) {
                  return ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Colors.orange, BlendMode.modulate),
                    child: Image.asset(
                      'assets/images/star.jpg',
                      fit: BoxFit.cover,
                      width: 300,
                    ),
                  );
                }),
            Slider.adaptive(
                value: _sliderValue,
                onChanged: (double value) {
                  setState(() {
                    _sliderValue = value;
                    _newColor =
                        Color.lerp(Colors.white, Colors.orange, _sliderValue)!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
