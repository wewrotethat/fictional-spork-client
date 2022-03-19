import 'package:fictional_spork/features/features.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static Map<String, WidgetBuilder> get generateRoutes => {
        WelcomePage.routeName: (context) => const WelcomePage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
      };
}
