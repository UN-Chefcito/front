import 'package:chefcito/core/constants/image_assets.dart';
import 'package:chefcito/resources/generic_form_field.dart';
import 'package:chefcito/resources/password_formfield.dart';
import 'package:chefcito/resources/rounded_button.dart';
import 'package:chefcito/validators/email_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const String routeName = '/login';

  final double maxWidth =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(20
        child: Column(children: [
          const SizedBox(height: 20),
          const Text(
            'Chefcito',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                // color: Colors.black38,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: const AssetImage(ImageAssets.chefcitoLogo),
                width: (maxWidth - 930),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Form(
              child: Column(
            children: [
              const SizedBox(height: 20),
              GenericFormField(
                hintText: 'Email',
                labelText: 'Email',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                obscureText: false,
                suffixIcon: null,
              ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     hintText: 'Email',
              //     labelText: 'Email',
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter your email';
              //     }
              //     if (!isValidEmail(value)) {
              //       return 'Please enter a valid email';
              //     }
              //     return null;
              //   },
              // ),
              const PasswordFormField(),
              const SizedBox(height: 50),
              RoundedButton(innerText: "Login", trigger: () {}),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FilledButton(
                  onPressed: () {},
                  child: const Text("Signup"),
                ),
              )
            ],
          )),
        ]),
      ),
    );
  }
}
