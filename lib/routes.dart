import 'package:fictional_spork/features/features.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static Map<String, WidgetBuilder> get generateRoutes => {
        CreateTestEntryPage.routeName: (context) => const CreateTestEntryPage(),
        HomePage.routeName: (context) => const HomePage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        TestEntryDetailPage.routeName: (context) {
          final id = ModalRoute.of(context)?.settings.arguments as String;
          return TestEntryDetailPage(
            id: id,
          );
        },
        WelcomePage.routeName: (context) => const WelcomePage(),
        PhoneVerificationPage.routeName: (context) =>
            const PhoneVerificationPage(),
        SplashPage.routeName: (context) => const SplashPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
      };
}
