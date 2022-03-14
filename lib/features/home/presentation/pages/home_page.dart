import 'package:fictional_spork/core/presentation/widgets/widgets.dart';
import 'package:fictional_spork/features/auth/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Spacer(),
          Text(
            'Fictional Spork',
            style: GoogleFonts.pacifico(
              color: Theme.of(context).colorScheme.primary,
              textStyle: Theme.of(context).textTheme.headline4,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginPage.routeName);
                },
                child: const Text('Log in'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Sign up'),
              )
            ],
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
