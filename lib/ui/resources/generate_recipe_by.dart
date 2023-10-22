import 'package:chefcito/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:chefcito/core/constants/colors.dart' as colors;
import 'package:chefcito/core/constants/constraints.dart' as constraints;

class GenerateRecipeBy extends StatefulWidget {
  final List<String> items;
  String? selectedItem;
  final Function(String)? onChanged;
  GenerateRecipeBy({
    Key? key,
    required this.items,
    required this.selectedItem,
    this.onChanged,
  }) : super(key: key);

  @override
  State<GenerateRecipeBy> createState() => _GenerateRecipeByState();
}

class _GenerateRecipeByState extends State<GenerateRecipeBy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          Texts.generateBy,
          textAlign: TextAlign.left,
          style: TextStyle(
          color: colors.background,
          fontFamily: constraints.fontFamily,
          fontSize: 30,
          fontWeight: FontWeight.w900),
        ),
        DropdownButton<String>(
          isExpanded: true,
          value: widget.selectedItem,
          onChanged: (String? newValue) {
            setState(() {
              widget.selectedItem = newValue;
            });
          },
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    );
  }
}