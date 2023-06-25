import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial27_mvvm/utils/routes/routes_name.dart';
import 'package:tutorial27_mvvm/view/home_screen.dart';
import 'package:tutorial27_mvvm/view/login_view.dart';
import 'package:tutorial27_mvvm/view/signup_view.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginView());

      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => SignUpView());


      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Text("No Route defined"),
            );
          },
        );

    }
  }
}
