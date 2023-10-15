import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key, required this.innerText, required this.trigger})
      : super(key: key);

  final String innerText;
  final void Function() trigger;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            // height: 50,
            // width: 200,
            // color: Colors.blue,
            child: ElevatedButton(
              onPressed: trigger,
              child: Text(innerText),
            ),
          ),
        ),
      ],
    );
  }
}
