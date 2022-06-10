import 'package:fictional_spork/features/features.dart';
import 'package:fictional_spork/features/phone_verification/phone_verification.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static Map<String, WidgetBuilder> get generateRoutes => {
        CreateTestEntryPage.routeName: (context) => const CreateTestEntryPage(),
        HomePage.routeName: (context) => const HomePage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        TestEntryDetailPage.routeName: (context) {
          final testStatus =
              ModalRoute.of(context)?.settings.arguments as TestStatus;
          return TestEntryDetailPage(
            testStatus: testStatus,
          );
        },
        WelcomePage.routeName: (context) => const WelcomePage(),
        PhoneVerificationPage.routeName: (context) =>
            const PhoneVerificationPage(),
      };
}
