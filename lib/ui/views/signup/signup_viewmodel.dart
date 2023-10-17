import 'package:chefcito/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:chefcito/app/app.locator.dart';
import 'package:chefcito/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel 
{

  final _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

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


  Future<Set<Object>> signup() async
  {
    final response = await _authService.signup(name: name, email: email, password: password);

    print({name, email, password});
    print(response.statusCode);
    print(response.body);


    switch (response.statusCode)
    {
      case 201:
        responseError = false;
        responseStatus = response.statusCode;
        responseMessage = 'Te has registrado correctamente';

        _navigationService.clearStackAndShow(Routes.loginPage);
        break;
      
      case 400:
        responseError = true;
        responseStatus = response.statusCode;

        emailAlreadyExists(response);

        responseMessage = emailAlreadyExists(response) ? 'El correo electrónico ya existe' : 'Revisa los campos';
        break;
      
      default:
        responseError = true;
        responseStatus = response.statusCode;
        responseMessage = 'Error al conectar con el servidor';
        break;
    }


    return {responseError, responseStatus, responseMessage};
  }


  bool emailAlreadyExists(response)
  {
    return response.body.contains('Email already exists');
  }

}