import 'package:chefcito/app/app.locator.dart';
import 'package:chefcito/app/app.router.dart';
import 'package:chefcito/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  String email = '';
  String password = '';

  bool responseError = false;
  int responseStatus = 0;
  String responseMessage = '';

  void navigateToSignup() {
    _navigationService.navigateTo(Routes.signupView);
  }

  void navigateToHome() {
    _navigationService.navigateTo(Routes.homePage);
  }

  changeEmail(String value) {
    email = value;
    notifyListeners();
  }

  changePassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<Set<Object>> login() async {
    final response = await _authService.login(email: email, password: password);

    print({email, password});
    print(response.statusCode);
    print(response.body);

    switch (response.statusCode) {
      case 200:
        responseError = false;
        responseStatus = response.statusCode;
        responseMessage = 'Te has logeado correctamente';

        _navigationService.clearStackAndShow(Routes.homePage);
        break;

      case 400:
        responseError = true;
        responseStatus = response.statusCode;

        responseMessage = 'Invalid email or password';
        break;

      case 401:
        responseError = true;
        responseStatus = response.statusCode;

        responseMessage = 'Invalid email or password';
        break;

      default:
        responseError = true;
        responseStatus = response.statusCode;
        responseMessage = 'Error al conectar con el servidor';
        break;
    }

    return {responseError, responseStatus, responseMessage};
  }
}
