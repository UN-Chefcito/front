import 'package:chefcito/core/constants/image_assets.dart';
import 'package:chefcito/core/constants/strings.dart';
import 'package:chefcito/ui/resources/account_question.dart';
import 'package:chefcito/ui/resources/generic_form_field.dart';
import 'package:chefcito/ui/resources/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:chefcito/ui/views/signup/signup_viewmodel.dart';
import 'package:chefcito/core/constants/colors.dart' as colors;
import 'package:chefcito/core/constants/constraints.dart' as constraints;

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    SnackBar snackBar;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, SignupViewModel model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
              child: Column(
                children: <Widget>[
                  Container(
                    height: screenSize.height * 0.2,
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
                  const Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Texts.signUp,
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
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        GenericFormField(
                          paddingTop: 22,
                          labelText: Labels.name,
                          hintText: HintTexts.name,
                          keyboardType: TextInputType.name,
                          onChanged: model.changeName,
                        ),
                        GenericFormField(
                          paddingTop: 16,
                          labelText: Labels.email,
                          hintText: HintTexts.email,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: model.changeEmail,
                        ),
                        GenericFormField(
                          paddingTop: 16,
                          labelText: Labels.password,
                          hintText: HintTexts.password,
                          obscureText: !_passwordVisible,
                          onChanged: model.changePassword,
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
                        GenericFormField(
                          paddingTop: 16,
                          labelText: Labels.confirmPassword,
                          hintText: HintTexts.confirmPassword,
                          obscureText: !_passwordVisible,
                          onChanged: model.changeConfirmPassword,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: RoundedButton(
                            text: Texts.signUp,
                            textColor: colors.white,
                            buttonColor: colors.background,
                            onPressed: () async {
                              Set<Object> response = await model.signup();

                              if (response.contains(201)) {
                                snackBar = SnackBar(
                                  content:
                                      Text(response.elementAt(2).toString()),
                                  backgroundColor: colors.background,
                                );
                              } else {
                                snackBar = SnackBar(
                                  content:
                                      Text(response.elementAt(2).toString()),
                                  backgroundColor: colors.warning,
                                );
                              }

                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  AccountQuestion(
                      question: Texts.alreadyHaveAnAccount,
                      acction: Texts.login,
                      onPressed: () => model
                          .navigateToLogin(), // Pops out to the login page (as return not as a new view)
                      padding: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
