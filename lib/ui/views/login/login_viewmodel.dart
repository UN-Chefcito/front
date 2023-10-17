import 'package:chefcito/app/app.locator.dart';
import 'package:chefcito/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel
{
  final _navigationService = locator<NavigationService>();


  void navigateToSignup()
  {
    _navigationService.navigateTo(Routes.signupView);
  }
}