import 'package:flutter/material.dart';

class SplashUI extends StatelessWidget {
  const SplashUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
