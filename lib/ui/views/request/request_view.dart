import 'package:chefcito/core/constants/strings.dart';
import 'package:chefcito/ui/resources/generate_recipe_by.dart';
import 'package:chefcito/ui/resources/generic_form_field.dart';
import 'package:chefcito/ui/views/request/request_viewmodel.dart';
import 'package:chefcito/ui/resources/rounded_button.dart';
import 'package:chefcito/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chefcito/core/constants/colors.dart' as colors;
import 'package:chefcito/core/constants/constraints.dart' as constraints;
import 'package:stacked/stacked.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  //static const String routeName = '/request';
  bool sendEnabled = true;
  String requestPetition = "";
  String resultPetition = Texts.calories;
  String tipeOfPetition = Labels.calories;
  List<String> itemsList = ['Calories', 'Buks', 'Protein'];
  int index = 0;

  Future<void> getRecipe() async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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'
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content": Texts.chatgptUser1 +
                requestPetition +
                tipeOfPetition +
                Texts.chatgptUser2
          }
        ]
      }),
    );
    final Map<String, dynamic> data = json.decode(response.body);
    print(Texts.chatgptUser1 +
        requestPetition +
        tipeOfPetition +
        Texts.chatgptUser2);
    setState(() {
      resultPetition = data['choices'][0]["message"]["content"].toString();
      sendEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => RequestViewModel(),
        builder: (context, RequestViewModel model, child) => Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Texts.generateARecipe,
                          style: TextStyle(
                              color: colors.background,
                              fontFamily: constraints.fontFamily,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage(ImageAssets.olla),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: GenerateRecipeBy(
                      items: itemsList,
                      selectedItem:
                          itemsList[index], // Valor seleccionado inicial
                      onChanged: (values) {
                        setState(() {
                          index = itemsList.indexOf(values!);
                          tipeOfPetition = itemsList[index];
                        });
                      },
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        GenericFormField(
                          paddingTop: 10,
                          hintText: tipeOfPetition,
                          labelText: tipeOfPetition,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              requestPetition = value;
                            });
                          },
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 30),
                    child: RoundedButton(
                      text: Texts.send,
                      enabled: sendEnabled,
                      onPressed: () {
                        setState(() {
                          sendEnabled = !sendEnabled;
                          getRecipe();
                        });
                      },
                      textColor: colors.white,
                      buttonColor: colors.background,
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Text(
                        resultPetition,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  )
                ]),
              ),
            ));
  }
}
