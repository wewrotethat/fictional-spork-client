import 'package:fictional_spork/features/home/home.dart';
import 'package:fictional_spork/features/splash/presentation/blocs/blocs.dart';
import 'package:fictional_spork/features/welcome/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authCheckCubit = AuthCheckCubit();

  @override
  void initState() {
    _authCheckCubit.stream.listen(_authCheckStateListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCheckCubit, AuthCheckState>(
        bloc: _authCheckCubit..check(),
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'Fictional Spork',
                  style: GoogleFonts.pacifico(
                    color: Theme.of(context).colorScheme.secondary,
                    textStyle: Theme.of(context).textTheme.headline4,
                  ),
                ),
                const Spacer(),
                const CircularProgressIndicator(),
                const SizedBox(
                  height: 50,
                  width: double.infinity,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _authCheckStateListener(AuthCheckState state) {
    if (state is AuthCheckCompletedState) {
      if (state.loggedIn) {
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(WelcomePage.routeName);
      }
    } else if (state is AuthCheckFailedState) {
      Navigator.of(context).pushReplacementNamed(WelcomePage.routeName);
    }
  }
}
