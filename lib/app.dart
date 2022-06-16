import 'dart:async';

import 'package:fictional_spork/features/splash/presentation/pages/pages.dart';
import 'package:fictional_spork/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/core.dart';

StreamController authStream = StreamController<bool>.broadcast();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    authStream.stream.listen((loggedOut) {
      if (loggedOut) {
        Phoenix.rebirth(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashPage.routeName,
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
