import 'package:chefcito/ui/views/recipe_info/recipe_info_view.dart';
import 'package:chefcito/ui/views/recipes_list/recipes_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:chefcito/core/constants/colors.dart' as colors;

class RecipeListView extends StatefulWidget {
  const RecipeListView({Key? key, required this.recipes}) : super(key: key);

  final List<dynamic> recipes;

  @override
  State<RecipeListView> createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {

  final RecipeListViewModel viewModel = RecipeListViewModel();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => viewModel,
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: 
          const Text(
            'Recetas',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: colors.background,
                fontFamily: 'Roboto',
                fontSize: 30,
                fontWeight: FontWeight.w900),
          ),
        ),

          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          itemCount: widget.recipes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeInfoView(recipe: widget.recipes[index].values.toList() as List<dynamic>)
                    )
                  );
                },
                child: Card(
              color: colors.background,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                  widget.recipes[index].values.elementAt(1),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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