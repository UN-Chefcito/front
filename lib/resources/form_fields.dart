import 'package:chefcito/core/constants/strings.dart';
import 'package:chefcito/validators/email_validator.dart';
import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction, //* OPTIONAL
      decoration: const InputDecoration(
        hintText: HintTexts.email, //* OPTIONAL
        labelText: Labels.email,
      ),
      validator: (email) {
        return emailValidator(email: email);
      },
    );
  }
}

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({Key? key}) : super(key: key);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: HintTexts.password,
        labelText: Labels.password,
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
          return ErrorTexts.emptyPassword;
        }
        return null;
      },
    );
  }
}
