import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key, required this.innerText, required this.trigger})
      : super(key: key);

  final String innerText;
  final void Function() trigger;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ElevatedButton(
            onPressed: trigger,
            child: Text(innerText),
          ),
        ),
      ],
    );
  }
}
