import 'package:fictional_spork/features/features.dart';
import 'package:fictional_spork/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/core.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomePage.routeName,
      routes: Routes.generateRoutes,
      theme: ThemeData.light().copyWith(
        backgroundColor: AppColors.backgroundColor,
        colorScheme: const ColorScheme.light(
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          primary: AppColors.primaryColor,
          primaryContainer: AppColors.primaryColorLight,
          secondary: AppColors.secondaryColor,
          secondaryContainer: AppColors.secondaryColorLight,
        ),
        primaryColor: AppColors.primaryColor,
        primaryColorDark: AppColors.primaryColorDark,
        primaryColorLight: AppColors.primaryColorLight,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        shadowColor: AppColors.shadowColor,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      darkTheme: ThemeData.dark().copyWith(
        backgroundColor: AppColors.backgroundColor,
        colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
        primaryColor: AppColors.primaryColor,
        primaryColorDark: AppColors.primaryColorDark,
        primaryColorLight: AppColors.primaryColorLight,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      title: 'Fictional Spork',
    );
  }
}
