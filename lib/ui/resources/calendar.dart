import 'package:chefcito/core/constants/colors.dart' as colors;
import 'package:chefcito/core/constants/constraints.dart' as constraints;
import 'package:chefcito/core/constants/strings.dart';
import 'package:chefcito/ui/resources/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
  Map<DateTime, List<Event>> selectedEvents = {};
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
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
                  ),
                ]),
                subtitle: Column(children: [
                  Text(
                    event.tag,
                  ),
                  Text(
                    event.ingredients,
                  ),
                  Text(
                    event.intructions,
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 30),
            child: RoundedButton(
              text: Texts.generateFoodSchedule,
              onPressed: () {
                setState(() {
                  if (selectedEvents[selectedDay] != null) {
                    selectedEvents[selectedDay]?.add(
                      Event("Scrambled Eggs", "Breakfast",
                          "List of Ingredients", "List of Instructions"),
                    );
                  } else {
                    selectedEvents[selectedDay] = [
                      Event("Scrambled Eggs", "Breakfast",
                          "List of Ingredients", "List of Instructions")
                    ];
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
                  for (var i = 0; i < 7; i++) {
                    DateTime currentDay = selectedDay.add(Duration(days: i));
                    if (selectedEvents[currentDay] != null) {
                      selectedEvents[currentDay]?.add(
                        Event("Scrambled Eggs", "Breakfast",
                            "List of Ingredients", "List of Instructions"),
                      );
                    } else {
                      selectedEvents[currentDay] = [
                        Event("Scrambled Eggs", "Breakfast",
                            "List of Ingredients", "List of Instructions")
                      ];
                    }
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
