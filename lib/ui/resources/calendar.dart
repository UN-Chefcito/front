import 'dart:convert';

import 'package:chefcito/core/constants/colors.dart' as colors;
import 'package:chefcito/core/constants/constraints.dart' as constraints;
import 'package:chefcito/core/constants/strings.dart';
import 'package:chefcito/ui/resources/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:chefcito/ui/resources/generate_recipe_by.dart';
import 'package:chefcito/ui/resources/generic_form_field.dart';
import 'package:http/http.dart' as http;
import 'package:chefcito/ui/views/request/request_view.dart';
import 'dart:math';

class Event {
  //Acomodarlo a la clase de receta
  final String title;
  final String tag;
  final String ingredients;
  final String intructions;

  Event(
    this.title,
    this.tag,
    this.ingredients,
    this.intructions,
  );
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String requestPetition = "";
  String tipeOfPetition = Labels.calories;
  List<String> itemsList = ['Calories', 'Buks', 'Protein'];
  List<Recipe> recipeList = [];
  int index = 0;
  Map<DateTime, List<Event>> selectedEvents = {};
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  Random random = Random();
  int randomNumber = 0;

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  Future<void> getRecipesByCost(String costType, double cost) async {
    final Uri uri = Uri.parse(
        'http://10.0.2.2:3000/recipes/cost?costType=$costType&cost=$cost');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> recipesJson = json.decode(response.body);

        // Mapea las recetas desde JSON a objetos Recipe
        recipeList = recipesJson.map((json) {
          return Recipe.fromJson(json, costType, cost);
        }).toList();

        // Haz algo con las recetas obtenidas
        print(recipeList.length);
        randomNumber = random.nextInt(recipeList.length);

        if (selectedEvents[selectedDay] != null) {
          selectedEvents[selectedDay]?.add(
            Event(
                recipeList[randomNumber].title.toString(),
                recipeList[randomNumber].description.toString(),
                recipeList[randomNumber].ingredients.toString(),
                recipeList[randomNumber].steps.toString()),
          );
        } else {
          selectedEvents[selectedDay] = [
            Event(
                recipeList[randomNumber].title.toString(),
                recipeList[randomNumber].description.toString(),
                recipeList[randomNumber].ingredients.toString(),
                recipeList[randomNumber].steps.toString()),
          ];
        }
      } else {
        print(
            'Error al obtener recetas. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> getRecipesByCostWeek(String costType, double cost) async {
    final Uri uri = Uri.parse(
        'http://10.0.2.2:3000/recipes/cost?costType=$costType&cost=$cost');
    List<Recipe> done = [];

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> recipesJson = json.decode(response.body);

        // Mapea las recetas desde JSON a objetos Recipe
        recipeList = recipesJson.map((json) {
          return Recipe.fromJson(json, costType, cost);
        }).toList();

        // Haz algo con las recetas obtenidas
        print(recipeList.length);

        for (var i = 0; i < 7; i++) {
          randomNumber = random.nextInt(recipeList.length);
          DateTime currentDay = selectedDay.add(Duration(days: i));
          if (selectedEvents[currentDay] != null) {
            selectedEvents[currentDay]?.add(
              Event(
                  recipeList[randomNumber].title.toString(),
                  recipeList[randomNumber].description.toString(),
                  recipeList[randomNumber].ingredients.toString(),
                  recipeList[randomNumber].steps.toString()),
            );

            done.add(recipeList[randomNumber]);
            recipeList.removeAt(randomNumber);

            if (recipeList.isEmpty) {
              recipeList = done;
            }
          } else {
            selectedEvents[currentDay] = [
              Event(
                  recipeList[randomNumber].title.toString(),
                  recipeList[randomNumber].description.toString(),
                  recipeList[randomNumber].ingredients.toString(),
                  recipeList[randomNumber].steps.toString()),
            ];
            done.add(recipeList[randomNumber]);
            recipeList.removeAt(randomNumber);

            if (recipeList.isEmpty) {
              recipeList = done;
            }
          }
        }
      } else {
        print(
            'Error al obtener recetas. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  Texts.foodSchedule,
                  style: TextStyle(
                      color: colors.background,
                      fontFamily: constraints.fontFamily,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: colors.secondary,
                shape: BoxShape.rectangle,
              ),
              selectedTextStyle: TextStyle(color: colors.white),
              todayDecoration: BoxDecoration(
                color: colors.background,
                shape: BoxShape.rectangle,
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: colors.secondary,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => Card(
              child: ListTile(
                title: Column(children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23
                    ),
                  ),
                 const SizedBox(height: 8.0),
                ]),
                subtitle: Column(children: [
                  Text(
                    style: const TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500
                      
                    ),
                    event.tag,

                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    event.ingredients,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    event.intructions,
                     style: const TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: GenerateRecipeBy(
              items: itemsList,
              selectedItem: itemsList[index], // Valor seleccionado inicial
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
              text: Texts.generateFoodSchedule,
              onPressed: () {
                setState(() {
                  if (requestPetition.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Please Enter a Value'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Cerrar la alerta
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    getRecipesByCost(
                        tipeOfPetition, double.parse(requestPetition));
                  }
                });
              },
              textColor: colors.white,
              buttonColor: colors.background,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 30),
            child: RoundedButton(
              text: Texts.generateFoodScheduleSevenDays,
              onPressed: () {
                setState(() {
                  if (requestPetition.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Please Enter a Value'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Cerrar la alerta
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    getRecipesByCostWeek(
                        tipeOfPetition, double.parse(requestPetition));
                  }
                });
              },
              textColor: colors.white,
              buttonColor: colors.background,
            ),
          ),
        ],
      ),
    ));
  }
}
