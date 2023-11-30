import 'package:http/http.dart' as http;


class RecipesService {

  Future<http.Response> getRecipes() async
  {
    var url = Uri.parse('http://10.0.2.2:3000/recipes');

    final response = await http.get(url);

    return response;
  }

}