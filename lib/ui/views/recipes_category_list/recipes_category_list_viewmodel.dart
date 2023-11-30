import 'package:chefcito/app/app.locator.dart';
import 'package:chefcito/services/recipes_service.dart';
import 'package:stacked/stacked.dart';

import 'dart:convert';

class RecipesCategoryListViewModel extends BaseViewModel {
  final _recipeService = locator<RecipesService>();

  Map<dynamic, dynamic> recipes = {};

  bool responseError = false;
  int responseStatus = 0;


  Future<Map<dynamic, dynamic>> getRecipes() async {
    final response = await _recipeService.getRecipes();

    switch (response.statusCode) {
      case 200:

        final message = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

        recipes = message;
        break;
    }

    return recipes;
  }
}
