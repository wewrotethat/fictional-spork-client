import 'package:fictional_spork/core/presentation/widgets/widgets.dart';
import 'package:fictional_spork/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
          backgroundColor: Colors.transparent,
          height: 20,
          icon: const Icon(Icons.menu),
          onTap: () {},
          padding: const EdgeInsets.all(10),
          width: 20,
        ),
        title: Text(
          'Fictional Spork',
          style: GoogleFonts.pacifico(
            color: Theme.of(context).colorScheme.secondary,
            textStyle: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      body: _buildBody(context),
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(
        Icons.add,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          _buildEntryCard(context, testStatus: TestStatus.resultReady),
          _buildEntryCard(context, testStatus: TestStatus.queued),
          _buildEntryCard(context, testStatus: TestStatus.pending),
        ],
      ),
    );
  }

  Widget _buildEntryCard(
    BuildContext context, {
    required TestStatus testStatus,
  }) {
    return TestEntryCard(
      testStatus: testStatus,
    );
  }
}
