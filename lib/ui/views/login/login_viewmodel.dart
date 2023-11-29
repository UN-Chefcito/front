import 'dart:convert';

import 'package:chefcito/app/app.locator.dart';
import 'package:chefcito/app/app.router.dart';
import 'package:chefcito/services/auth_service.dart';
import 'package:chefcito/services/secure_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final SecureStorageService _secureStorageService =
      locator<SecureStorageService>();

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

  /// Handles the login process of the user and redirects to the home page if the login is successful
  /// or shows an error message if the login fails
  /// 
  Future<Set<Object>> login() async {
    final response = await _authService.login(email: email, password: password);

    switch (response.statusCode) {
      case 200:
        responseError = false;
        responseStatus = response.statusCode;
        responseMessage = 'Te has logeado correctamente';

        final message = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

        String token = message['token'];

        await setAccessToken(token);

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


  /// Stores the access token in the secure storage
  setAccessToken(String token) async {
    await _secureStorageService.storeStringValue(key: 'token', value: token);

    final tokenValue = await _secureStorageService.getStringValue(key: 'token');
  }
}
