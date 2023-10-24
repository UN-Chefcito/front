import 'package:chefcito/core/constants/image_assets.dart';
import 'package:chefcito/core/constants/strings.dart';
import 'package:chefcito/resources/form_fields.dart';
import 'package:chefcito/resources/login_button.dart';
import 'package:chefcito/resources/recovery_password_ink_well.dart';
import 'package:chefcito/resources/signup_inkwell.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const String routeName = '/login';

  final double maxWidth =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage(ImageAssets.chefcitoLogo)),
            const Text(Texts.welcomeBack),
            const Text(Texts.enterLoginDetails),
            Form(
                child: Column(
              children: [
                const EmailFormField(),
                const PasswordFormField(),
                const RecoveryPasswordInkWell(),
                LoginButton(maxWidth: maxWidth),
                const SignUpInkWell(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
