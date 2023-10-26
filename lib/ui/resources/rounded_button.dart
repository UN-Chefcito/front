import 'package:flutter/material.dart';

import 'package:chefcito/core/constants/constraints.dart' as constraints;

class RoundedButton extends StatefulWidget {

  final String text;
  final Function()? onPressed;
  final Color textColor;
  final Color buttonColor;
  final bool? withSuffixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  const RoundedButton({
    Key? key, 
    required this.text, 
    required this.onPressed,
    required this.textColor,
    required this.buttonColor,
    this.withSuffixIcon,
    this.suffixIcon,
    this.enabled = true,
  }): super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {


  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: widget.enabled ? widget.onPressed : null,
      
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: widget.buttonColor,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(constraints.btnRadius)
        ),

        textStyle: TextStyle(
          color: widget.textColor,
          fontFamily: constraints.fontFamily,
          fontSize: constraints.btnFontSize,
          fontWeight: FontWeight.w700,
        ),
      ),

      child: Ink(
        child: Container(
          width: double.infinity,
          height: constraints.btnHeight,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontFamily: constraints.fontFamily,
                  fontSize: constraints.btnFontSize,
                  fontWeight: FontWeight.w700
                ),
              ),

              if(widget.withSuffixIcon != null && widget.withSuffixIcon == true)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: widget.suffixIcon,
                )
            ],
          ),
        ),
      ),
    );
  }
}
