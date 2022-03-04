import 'package:fictional_spork/features/home/home.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static Map<String, WidgetBuilder> get generateRoutes => {
        HomePage.routeName: (context) => const HomePage(),
      };
}
