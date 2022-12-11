import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  const LabelButton({super.key, required this.labelText, required this.onPressed});

  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        labelText,
        style: const TextStyle(
            color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 17),
      ),
    );
  }
}
