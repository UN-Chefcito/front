import 'package:chefcito/core/constants/image_assets.dart';
import 'package:chefcito/resources/password_formfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const String routeName = '/login';
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  final double maxWidth =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const SizedBox(height: 100),
          Image(
              image: const AssetImage(ImageAssets.chefcitoLogo),
              width: (maxWidth - 800)),
          Form(
              child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const PasswordFormField(),
            ],
          ))
        ]),
      ),
    );
  }
}
