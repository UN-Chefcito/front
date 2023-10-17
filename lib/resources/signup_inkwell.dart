import 'package:chefcito/core/constants/strings.dart';
import 'package:flutter/material.dart';

class SignUpInkWell extends StatelessWidget {
  const SignUpInkWell({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: const Text.rich(TextSpan(children: <TextSpan>[
          TextSpan(text: "${Texts.dontHaveAnAccount} "),
          TextSpan(
              text: Texts.signUp,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))
        ])),
        onTap: () {});
  }
}
