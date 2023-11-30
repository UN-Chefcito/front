// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chefcito/ui/views/home/home_view.dart' as _i4;
import 'package:chefcito/ui/views/login/login_view.dart' as _i2;
import 'package:chefcito/ui/views/recipe_info/recipe_info_view.dart' as _i7;
import 'package:chefcito/ui/views/recipes_category_list/recipes_category_list_view.dart'
    as _i5;
import 'package:chefcito/ui/views/recipes_list/recipes_list_view.dart' as _i6;
import 'package:chefcito/ui/views/signup/signup_view.dart' as _i3;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const loginPage = '/login';

  static const signupView = '/signup';

  static const homePage = '/home';

  static const recipesCategoryListView = '/recipes-category-list';

  static const recipeListView = '/recipes-list';

  static const recipeInfoView = '/recipe-info';

  static const all = <String>{
    loginPage,
    signupView,
    homePage,
    recipesCategoryListView,
    recipeListView,
    recipeInfoView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginPage,
      page: _i2.LoginPage,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i3.SignupView,
    ),
    _i1.RouteDef(
      Routes.homePage,
      page: _i4.HomePage,
    ),
    _i1.RouteDef(
      Routes.recipesCategoryListView,
      page: _i5.RecipesCategoryListView,
    ),
    _i1.RouteDef(
      Routes.recipeListView,
      page: _i6.RecipeListView,
    ),
    _i1.RouteDef(
      Routes.recipeInfoView,
      page: _i7.RecipeInfoView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginPage: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginPage(),
        settings: data,
      );
    },
    _i3.SignupView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.SignupView(),
        settings: data,
      );
    },
    _i4.HomePage: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.HomePage(),
        settings: data,
      );
    },
    _i5.RecipesCategoryListView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.RecipesCategoryListView(),
        settings: data,
      );
    },
    _i6.RecipeListView: (data) {
      final args = data.getArgs<RecipeListViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.RecipeListView(key: args.key, recipes: args.recipes),
        settings: data,
      );
    },
    _i7.RecipeInfoView: (data) {
      final args = data.getArgs<RecipeInfoViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.RecipeInfoView(key: args.key, recipe: args.recipe),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class RecipeListViewArguments {
  const RecipeListViewArguments({
    this.key,
    required this.recipes,
  });

  final _i8.Key? key;

  final List<dynamic> recipes;

  @override
  String toString() {
    return '{"key": "$key", "recipes": "$recipes"}';
  }

  @override
  bool operator ==(covariant RecipeListViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.recipes == recipes;
  }

  @override
  int get hashCode {
    return key.hashCode ^ recipes.hashCode;
  }
}

class RecipeInfoViewArguments {
  const RecipeInfoViewArguments({
    this.key,
    required this.recipe,
  });

  final _i8.Key? key;

  final dynamic recipe;

  @override
  String toString() {
    return '{"key": "$key", "recipe": "$recipe"}';
  }

  @override
  bool operator ==(covariant RecipeInfoViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.recipe == recipe;
  }

  @override
  int get hashCode {
    return key.hashCode ^ recipe.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToLoginPage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginPage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomePage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homePage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRecipesCategoryListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.recipesCategoryListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRecipeListView({
    _i8.Key? key,
    required List<dynamic> recipes,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.recipeListView,
        arguments: RecipeListViewArguments(key: key, recipes: recipes),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRecipeInfoView({
    _i8.Key? key,
    required dynamic recipe,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.recipeInfoView,
        arguments: RecipeInfoViewArguments(key: key, recipe: recipe),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginPage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginPage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomePage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homePage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRecipesCategoryListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.recipesCategoryListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRecipeListView({
    _i8.Key? key,
    required List<dynamic> recipes,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.recipeListView,
        arguments: RecipeListViewArguments(key: key, recipes: recipes),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRecipeInfoView({
    _i8.Key? key,
    required dynamic recipe,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.recipeInfoView,
        arguments: RecipeInfoViewArguments(key: key, recipe: recipe),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
