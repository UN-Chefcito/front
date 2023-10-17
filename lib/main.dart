import 'package:flutter/material.dart';
import './pages/login_2.dart';

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
      title: 'Chefcito',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
