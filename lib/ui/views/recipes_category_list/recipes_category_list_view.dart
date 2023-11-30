import 'package:chefcito/ui/views/recipes_category_list/recipes_category_list_viewmodel.dart';
import 'package:chefcito/ui/views/recipes_list/recipes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:chefcito/core/constants/colors.dart' as colors;

class RecipesCategoryListView extends StatefulWidget {
  const RecipesCategoryListView({Key? key}) : super(key: key);

  @override
  State<RecipesCategoryListView> createState() => _RecipesCategoryListViewState();
}

class _RecipesCategoryListViewState extends State<RecipesCategoryListView> {
  final RecipesCategoryListViewModel viewModel = RecipesCategoryListViewModel();
  Map<dynamic, dynamic> recipes = {};

  @override
  void initState() {
    super.initState();
    getRecipies();
  }

  void getRecipies() async {
    final response = await viewModel.getRecipes();
    setState(() {
      recipes = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    var recipesCategory = recipes.keys.toList();

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RecipesCategoryListViewModel(),
      builder: (context, viewModel, child) => Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          itemCount: recipesCategory.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  var recipesSelected = recipes.values.elementAt(index);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeListView(recipes: recipesSelected)
                    )
                  );
                },
                child: Card(
              color: colors.background,
              child: Center(
                child: Text(
                  recipesCategory[index],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colors.white,
                  ),
                ),
              ),
            ));
          },
        ),
      )),
    );
  }
}
