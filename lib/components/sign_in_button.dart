import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, required this.labelText, required this.onPressed});

  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(0, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20))),
      onPressed: onPressed,
      child: Text(
        labelText.toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
