import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:chefcito/ui/views/splash_screen/splash_screen_viewmodel.dart';

class SplashScreenView extends StatelessWidget {

  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, SplashScreenViewModel model, child) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}