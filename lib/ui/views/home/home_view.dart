import 'package:chefcito/ui/resources/tab_bar.dart';
import 'package:chefcito/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, HomeViewModel model, child) => const Scaffold(
          body : TabBarApp(),
    ));
  }
}
