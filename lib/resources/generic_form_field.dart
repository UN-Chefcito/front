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
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            gapPadding: 10,
            borderSide: BorderSide(color: Colors.grey.shade400),
            // Add the color property to set the background color of the TextFormField
            // to white
            // You can change the color to any color you want
            // For example, Colors.blue, Colors.red, etc.
            // If you want to set a transparent background, you can use Colors.transparent
            // instead of Colors.white
            //color: Colors.white,
          ),
        ),
        validator: validator,
      )
    ]);
  }
}
