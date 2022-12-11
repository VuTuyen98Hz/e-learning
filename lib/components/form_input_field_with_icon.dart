import 'package:flutter/material.dart';

class FormInputFieldWithIcon extends StatelessWidget {
  const FormInputFieldWithIcon(
      {super.key,
      required this.controller,
      required this.iconPrefix,
      required this.hintText,
      required this.validator,
      required this.obscureText,
      this.iconSuffix,
      this.keyboardType = TextInputType.text,
      this.minLines = 1,
      this.maxLines,
      required this.onChanged,
      required this.onSaved});

  final TextEditingController controller;
  final IconData iconPrefix;
  final Widget? iconSuffix;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int? maxLines;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(iconPrefix),
        suffixIcon: iconSuffix,
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 22.0, horizontal: 10.0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
    );
  }
}
