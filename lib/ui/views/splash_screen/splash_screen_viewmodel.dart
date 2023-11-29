import 'package:chefcito/app/app.locator.dart';
import 'package:chefcito/app/app.router.dart';
import 'package:chefcito/services/secure_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreenViewModel extends BaseViewModel {

  final SecureStorageService _secureStorageService =
      locator<SecureStorageService>();
    
  final NavigationService _navigationService = locator<NavigationService>();

  SplashScreenViewModel() {
    _init();
  }

  /// Checks if the user is logged in or not and redirects to the appropriate page
  /// 
  _init() async {
    final token = await _secureStorageService.getStringValue(key: 'token');

    if (token != null) {
      _navigationService.clearStackAndShow(Routes.homePage);
    } else {
      _navigationService.clearStackAndShow(Routes.loginPage);
    }
  }
}