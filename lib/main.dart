import 'package:flutter/material.dart';
import './pages/login.dart';

void main() {
  runApp(const Chefcito());
}

class Chefcito extends StatelessWidget {
  const Chefcito({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Chefcito',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
