import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'ui/views/login/login.dart';

void main() {
  runApp(const Chefcito());
}

class Chefcito extends StatelessWidget {
  const Chefcito({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Chefcito',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      navigatorKey: StackedService.navigatorKey,
      home: LoginPage(),
    );
  }
}
