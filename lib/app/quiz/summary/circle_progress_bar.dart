import 'package:flutter/material.dart';

class CircleProgressBar extends StatefulWidget {
  const CircleProgressBar({Key? key, this.stopValue = 1.0}) : super(key: key);
  final double stopValue;

  @override
  State<CircleProgressBar> createState() => _CircleProgressBarState();
}

class _CircleProgressBarState extends State<CircleProgressBar>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..addListener(() {
        // if (!mounted) return;
        setState(() {

          double currentValue = animationController.value;
          if (currentValue > widget.stopValue) {
            animationController.stop();
          }
        });
      });
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: animationController.value,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
      backgroundColor: const Color(0xffD6D6D6),
      strokeWidth: 20,
    );
  }
}
