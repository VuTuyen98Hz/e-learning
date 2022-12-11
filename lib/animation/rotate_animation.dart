import 'dart:math';

import 'package:flutter/material.dart';

class RotateAnimation extends StatefulWidget {
  const RotateAnimation({super.key, required this.front, required this.back});
  final Widget front;
  final Widget back;

  @override
  State<RotateAnimation> createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  bool isFront = true;
  double horizontalDrag = 0;

  @override
  initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animationController.reset();
    _animationController.forward();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void setWidgetSide() {
    if (horizontalDrag <= 90 || horizontalDrag >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onHorizontalDragStart: (details) {
          _animationController.reset();
          setState(() {
            isFront = true;
            horizontalDrag = 0;
          });
        },
        onHorizontalDragUpdate: (details) {
          setState(() {
            horizontalDrag += details.delta.dx;
            horizontalDrag %= 360;
          });

          setWidgetSide();
        },
        onHorizontalDragEnd: (details) {
          final double end = 360 - horizontalDrag >= 180 ? 0 : 360;
          _animation = Tween<double>(begin: horizontalDrag, end: end)
              .animate(_animationController)
            ..addListener(() {
              setState(() {
                horizontalDrag = _animation.value;
                setWidgetSide();
              });
            });
          _animationController.forward();
        },
        child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(2, 3, 0.001)
              ..rotateY(horizontalDrag / 180 * pi),
            child: isFront
                ? widget.front
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: widget.back)),
      );
}
