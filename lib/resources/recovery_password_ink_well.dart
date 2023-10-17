import 'package:chefcito/core/constants/strings.dart';
import 'package:chefcito/resources/keep_session_checkbox.dart';
import 'package:flutter/material.dart';

class RecoveryPasswordInkWell extends StatelessWidget {
  const RecoveryPasswordInkWell({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const KeepSessionCheckbox(),
        InkWell(
          child: const Text(Texts.forgotPassword),
          onTap: () {},
        ),
      ],
    );
  }
}
