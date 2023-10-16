import 'package:stacked/stacked.dart';
import 'package:chefcito/app/app.locator.dart';
import 'package:chefcito/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel 
{

  final _navigationService = locator<NavigationService>();

  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  bool responseError = false;
  int responseStatus = 0;
  String responseMessage = '';


  changeName(String value) {
    name = value;
    notifyListeners();
  }

  changeEmail(String value) {
    email = value;
    notifyListeners();
  }

  changePassword(String value) {
    password = value;
    notifyListeners();
  }

  changeConfirmPassword(String value) {
    confirmPassword = value;
    notifyListeners();
  }

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.loginPage);
  }

}