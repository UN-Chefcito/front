import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({Key? key}) : super(key: key);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              gapPadding: 10,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
      ],
    );
  }
}
