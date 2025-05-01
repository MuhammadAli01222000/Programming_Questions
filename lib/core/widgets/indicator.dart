import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
class CountdownIndicator extends StatelessWidget {
  final int durationInSeconds;

  CountdownIndicator({required this.durationInSeconds});

  @override
  Widget build(BuildContext context) {
    final CountDownController _controller = CountDownController();

    return Center(
      child: CircularCountDownTimer(
        duration: durationInSeconds,
        initialDuration: 0,
        controller: _controller,
        width: 100,
        height: 100,
        ringColor: Colors.grey[300]!,
        fillColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        strokeWidth: 10.0,
        strokeCap: StrokeCap.round,
        textStyle: const TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        isReverse: true,
        isReverseAnimation: true,
        isTimerTextShown: true,
        autoStart: true,
        onComplete: () {
          print("Taymer tugadi");
        },
      ),
    );
  }
}
