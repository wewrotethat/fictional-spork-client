import 'package:fictional_spork/features/features.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static Map<String, WidgetBuilder> get generateRoutes => {
        CreateTestEntryPage.routeName: (context) => const CreateTestEntryPage(),
        HomePage.routeName: (context) => const HomePage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        WelcomePage.routeName: (context) => const WelcomePage(),
      };
}
