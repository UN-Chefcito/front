import 'package:chefcito/services/auth_service.dart';
import 'package:chefcito/ui/views/login/login_view.dart';
import 'package:chefcito/ui/views/signup/signup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';


@StackedApp(

  routes: [
    MaterialRoute(page: LoginPage, path: '/login'),
    MaterialRoute(page: SignupView, path: '/signup'),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
  ]
)


class AppSetup {}