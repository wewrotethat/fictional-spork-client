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
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 40,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.secondaryColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize:
                  MaterialStateProperty.all(const Size(double.infinity, 50)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              textStyle: MaterialStateProperty.all(
                Theme.of(context).textTheme.subtitle1,
              )),
        ),
        colorScheme: const ColorScheme.light(
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
        ),
        dividerColor: AppColors.secondaryColorDark,
        primaryColor: AppColors.primaryColor,
        primaryColorDark: AppColors.primaryColorDark,
        primaryColorLight: AppColors.primaryColorLight,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        shadowColor: AppColors.shadowColor,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      darkTheme: ThemeData.dark().copyWith(
        backgroundColor: AppColors.backgroundColor,
        colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
        dividerColor: AppColors.secondaryColorDark,
        primaryColor: AppColors.primaryColor,
        primaryColorDark: AppColors.primaryColorDark,
        primaryColorLight: AppColors.primaryColorLight,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      title: 'Fictional Spork',
    );
  }
}
