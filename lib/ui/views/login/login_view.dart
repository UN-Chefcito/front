import 'package:chefcito/core/constants/image_assets.dart';
import 'package:chefcito/ui/resources/account_question.dart';
import 'package:chefcito/ui/resources/generic_form_field.dart';
import 'package:chefcito/ui/resources/rounded_button.dart';
import 'package:chefcito/ui/views/login/login_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:chefcito/core/constants/colors.dart' as colors;
import 'package:chefcito/core/constants/constraints.dart' as constraints;
import 'package:stacked/stacked.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  static const String routeName = '/login';

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _passwordVisible = false;

  final double maxWidth =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, LoginViewModel model, child) => Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const SizedBox(height: 100),

                  Container(
                    height: screenSize.height * 0.25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage(ImageAssets.chefcitoLogo),
                        )),
                  ),

                  // Image(
                  //     image: const AssetImage(ImageAssets.chefcitoLogo),
                  //     width: (maxWidth - 800)),

                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Iniciar Sesión",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: colors.background,
                              fontFamily: constraints.fontFamily,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),

                  Form(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        GenericFormField(
                          paddingTop: 32,
                          hintText: 'Correo electrónico',
                          labelText: 'Correo electrónico',
                          keyboardType: TextInputType.emailAddress,
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
                        GenericFormField(
                          paddingTop: 24,
                          labelText: "Contraseña",
                          hintText: "Contraseña",
                          obscureText: !_passwordVisible,
                          onChanged: (value) {},
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: colors.primary,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: RoundedButton(
                      text: "Login",
                      onPressed: () {},
                      textColor: colors.white,
                      buttonColor: colors.background,
                    ),
                  ),

                  AccountQuestion(
                      question: "¿Aún no tienes una cuenta?",
                      acction: "Registrate",
                      onPressed: () {
                        model.navigateToSignup();
                      },
                      padding: 28)
                ]),
              ),
            ));
  }
}
