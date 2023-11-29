import 'package:http/http.dart' as http;
import 'package:chefcito/core/constants/strings.dart';
import 'dart:convert';
import 'package:chefcito/ui/views/request/request_view.dart';
import 'package:chefcito/core/constants/strings.dart';

class RequestChatGpt {

  int responseStatus = 0;


  Future<String> getRecipe(
      String requestPetition, String tipeOfPetition) async {
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
    return data['choices'][0]["message"]["content"].toString();
  }

  Future<void> saveRecipe(String token, Recipe recipe) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/recipes'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(recipe.toJson()),
    );

  responseStatus = responseStatus;
  }
}
