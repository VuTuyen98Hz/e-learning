import 'dart:math';
import 'package:flutter/material.dart';

class FlipAnimationController {
  _FlipAnimationState? _state;

  Future flipWidget() async => _state?.flipWidget();
}

class FlipAnimation extends StatefulWidget {
  const FlipAnimation(
      {super.key,
      required this.controller,
      required this.front,
      required this.back});

  final FlipAnimationController controller;
  final Widget front;
  final Widget back;

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isFront = true;
  double anglePlus = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    widget.controller._state = this;

  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    // controller.reset();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  Future flipWidget() async {
    if (controller.isAnimating) return;
    isFront = !isFront;
    await controller.forward(from: 0).then((value) => anglePlus = pi);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double angle = controller.value * pi;
        if (isFront) angle += anglePlus;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angle);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: isFrontWidget(angle.abs())
              ? widget.front
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(pi),
                  child: widget.back),
        );
      });

  bool isFrontWidget(double angle) {
    const degrees90 = pi / 2;
    const degrees270 = 3 * pi / 2;
    return angle <= degrees90 || angle >= degrees270;
  }
}
