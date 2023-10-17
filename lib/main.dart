import 'package:chefcito/app/app.locator.dart';
import 'package:chefcito/app/app.router.dart';
import 'package:flutter/material.dart';

import 'package:stacked_services/stacked_services.dart';
import 'ui/views/login/login_view.dart';

void main() {
  setupLocator();
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
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      home: const LoginPage(),
    );
  }
}
