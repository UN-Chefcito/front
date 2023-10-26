import 'package:http/http.dart' as http;
import 'package:chefcito/core/constants/strings.dart';
import 'dart:convert';
class RequestChatGpt 
{
  Future<String> getRecipe(String requestPetition,String tipeOfPetition) async {
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
          {"role": "user", "content": Texts.chatgptUser1+requestPetition+tipeOfPetition+Texts.chatgptUser2}
        ]
      }),
    );
    final Map<String, dynamic> data = json.decode(response.body);
    return data['choices'][0]["message"]["content"].toString();
  }
}