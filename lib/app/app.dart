import 'package:chefcito/services/auth_service.dart';
import 'package:chefcito/services/recipes_service.dart';
import 'package:chefcito/services/request_chatGpt.dart';
import 'package:chefcito/services/secure_storage.dart';
import 'package:chefcito/ui/views/login/login_view.dart';
import 'package:chefcito/ui/views/recipe_info/recipe_info_view.dart';
import 'package:chefcito/ui/views/recipes_list/recipes_list_view.dart';
import 'package:chefcito/ui/views/signup/signup_view.dart';
import 'package:chefcito/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:chefcito/ui/views/recipes_category_list/recipes_category_list_view.dart';


@StackedApp(

  routes: [
    MaterialRoute(page: LoginPage, path: '/login'),
    MaterialRoute(page: SignupView, path: '/signup'),
    MaterialRoute(page: HomePage, path: '/home'),
    MaterialRoute(page: RecipesCategoryListView, path: '/recipes-category-list'),
    MaterialRoute(page: RecipeListView, path: '/recipes-list'),
    MaterialRoute(page: RecipeInfoView, path: '/recipe-info')
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: RequestChatGpt),
    LazySingleton(classType: SecureStorageService),
    LazySingleton(classType: RecipesService),
  ]
)


class AppSetup {}