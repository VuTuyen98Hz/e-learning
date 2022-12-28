import 'package:flutter/material.dart';

class BouncingAnimation extends StatefulWidget {
  const BouncingAnimation({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  State<BouncingAnimation> createState() => _BouncingAnimationState();
}

class _BouncingAnimationState extends State<BouncingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final double scale;

  @override
  initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
    scale = 1 - _animationController.value;
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (PointerDownEvent event) {
          _animationController.forward();
        },
        onPointerUp: (PointerUpEvent event) {
          _animationController.reverse();
        },
        child: Transform.scale(scale: scale, child: widget.child));
  }
}
