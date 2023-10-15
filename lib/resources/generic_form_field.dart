import 'package:flutter/material.dart';

class GenericFormField extends StatelessWidget {
  const GenericFormField(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.validator,
      required this.obscureText,
      required this.suffixIcon})
      : super(key: key);

  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            gapPadding: 10,
          )),
      validator: validator,
    );
  }
}
