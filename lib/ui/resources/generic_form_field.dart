import 'package:flutter/material.dart';

import 'package:chefcito/core/constants/colors.dart' as colors;
import 'package:chefcito/core/constants/constraints.dart' as constraints;


class GenericFormField extends StatelessWidget {

  final String labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double paddingTop;

  final Function(String)? onChanged;
  final TextInputType keyboardType;

  const GenericFormField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.paddingTop = 0.0,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: paddingTop),
        child: TextFormField(

          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,

          style: const TextStyle(
            color: colors.black,
            fontFamily: constraints.fontFamily,
            fontWeight: FontWeight.w700
          ),

          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: labelText,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: const EdgeInsets.only(top: 2),

            labelStyle: const TextStyle(
              color: colors.primary,
              fontFamily: constraints.fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 16
            ),

            hintStyle: const TextStyle(
              color: colors.primary,
              fontFamily: constraints.fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 16
            ),

            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: colors.primary,
              )
            ),

            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: colors.primary,
              )
            )
          ),
          validator: validator,
        )
      )
    );
  }
}
