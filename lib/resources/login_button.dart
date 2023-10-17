import 'package:chefcito/core/constants/strings.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.maxWidth});

  double maxWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(maxWidth, 50),
        ),
        // minimumSize: MaterialStateProperty.all<Size>(
        //   const Size(maxWidth),
        // ),
      ),
      onPressed: () {},
      child: const Text(Texts.login),
    );
  }
}
