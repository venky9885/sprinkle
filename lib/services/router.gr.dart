// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/Home/home_view.dart';
import '../ui/Login/login_view.dart';
import '../ui/Sign_up/sign_up_view.dart';
import '../ui/Startview/splash.dart';
import '../ui/page/page.dart';

class Routes {
  static const String signUpView = '/sign-up-view';
  static const String loginView = '/login-view';
  static const String secondPage = '/second-page';
  static const String home = '/Home';
  static const String splash = '/';
  static const all = <String>{
    signUpView,
    loginView,
    secondPage,
    home,
    splash,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.secondPage, page: SecondPage),
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.splash, page: Splash),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SecondPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SecondPage(),
        settings: data,
      );
    },
    Home: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Home(),
        settings: data,
      );
    },
    Splash: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Splash(),
        settings: data,
      );
    },
  };
}
