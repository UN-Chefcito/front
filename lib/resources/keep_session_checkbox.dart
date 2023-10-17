import 'package:chefcito/core/constants/strings.dart';
import 'package:flutter/material.dart';

class KeepSessionCheckbox extends StatefulWidget {
  const KeepSessionCheckbox({Key? key}) : super(key: key);

  @override
  _KeepSessionCheckboxState createState() => _KeepSessionCheckboxState();
}

class _KeepSessionCheckboxState extends State<KeepSessionCheckbox> {
  bool keepSession = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: keepSession,
          onChanged: (bool? value) {
            setState(() {
              keepSession = value!;
            });
          },
        ),
        const Text(Texts.keepSessionCheckbox)
      ],
    );
  }
}
