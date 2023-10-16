import 'package:chefcito/core/constants/image_assets.dart';
import 'package:chefcito/ui/resources/account_question.dart';
import 'package:chefcito/ui/resources/generic_form_field.dart';
import 'package:chefcito/ui/resources/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:chefcito/ui/views/signup/signup_viewmodel.dart';
import 'package:chefcito/core/constants/colors.dart' as colors;
import 'package:chefcito/core/constants/constraints.dart' as constraints;

class SignupView extends StatefulWidget 
{
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();

}


class _SignupViewState extends State<SignupView>
{
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context)
  {
    final screenSize = MediaQuery.of(context).size;
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
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage(ImageAssets.chefcitoLogo),
                      )
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Crea una cuenta",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: colors.background,
                            fontFamily: constraints.fontFamily,
                            fontSize: 30,
                            fontWeight: FontWeight.w900                      
                          ),
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
                          labelText: "Nombre",
                          hintText: "Nombre",
                          keyboardType: TextInputType.name,
                          onChanged: model.changeName,
                        ),

                        GenericFormField(
                          paddingTop: 16,
                          labelText: "Correo electrónico",
                          hintText: "Correo electrónico",
                          keyboardType: TextInputType.emailAddress,
                          onChanged: model.changeEmail,
                        ),


                        GenericFormField(
                          paddingTop: 16,
                          labelText: "Contraseña",
                          hintText: "Contraseña",
                          obscureText: !_passwordVisible,
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
                          labelText: "Confirmar contraseña",
                          hintText: "Confirmar contraseña",
                          obscureText: !_confirmPasswordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: colors.primary,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmPasswordVisible = !_confirmPasswordVisible;
                              });
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: RoundedButton(
                            text: "Registrate",
                            onPressed: () {},
                            textColor: colors.white,
                            buttonColor: colors.background,
                          ),
                        )
                      ],
                    ),
                  ),

                  AccountQuestion(
                    question: "¿Ya tienes una cuenta?",
                    acction: "Inicia sesión",
                    onPressed: () => model.navigateToLogin(),
                    padding: 20
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}