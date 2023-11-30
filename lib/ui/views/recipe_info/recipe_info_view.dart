import 'package:flutter/material.dart';

class RecipeInfoView extends StatefulWidget {
  const RecipeInfoView({Key? key, required this.recipe}) : super(key: key);

  final dynamic recipe;

  @override
  _RecipeInfoViewState createState() => _RecipeInfoViewState();
}

class _RecipeInfoViewState extends State<RecipeInfoView> {
  @override
  Widget build(BuildContext context) {
    var a = widget.recipe.toList();
    var ingredientes = a[3].split(',');
    var steps = a[4].split('----');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Info'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    a[1],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    a[2].trim(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lato',
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      const Text(
                        'Ingredients',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: ingredientes.length,
                        itemBuilder: (context, index) {
                          return Text(
                            ingredientes[index].trim(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lato',
                              fontSize: 16,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      const Text(
                        'Steps',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: steps.length,
                        itemBuilder: (context, index) {
                          return Text(
                            "${index + 1}: ${steps[index]}\n",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lato',
                              fontSize: 16,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
