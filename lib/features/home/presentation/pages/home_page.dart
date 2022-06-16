import 'package:fictional_spork/core/domain/entities/entities.dart';
import 'package:fictional_spork/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:fictional_spork/core/presentation/widgets/widgets.dart';
import 'package:fictional_spork/features/create_test_entry/presentation/pages/pages.dart';
import 'package:fictional_spork/features/home/home.dart';
import 'package:fictional_spork/features/profile/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _verificationCheckCubit = VerificationCheckCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
      onPressed: () {
        Navigator.of(context).pushNamed(CreateTestEntryPage.routeName);
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<VerificationCheckCubit, VerificationCheckState>(
      bloc: _verificationCheckCubit..check(),
      builder: (context, state) {
        if (state is VerificationCheckedState) {
          if (state.status == ProfileVerificationStatus.verified) {
            return _buildVerifiedBody(context);
          } else {
            return _buildUnverifiedBody(context);
          }
        } else if (state is VerificationCheckFailureState) {
          return _buildErrorBody(context);
        }

        return const Center(
          child: CustomLoadingIndicator(),
        );
      },
    );
  }

  Widget _buildUnverifiedBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Text(
            'You are not verified yet',
            style: GoogleFonts.pacifico(
              color: Theme.of(context).colorScheme.primary,
              textStyle: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Please make sure that you have verified your phone number and '
            'inputted the correct personal and medical license number. '
            'Your profile will be resubmitted for review once you '
            'update your info',
            style: GoogleFonts.abel(
              color: Theme.of(context).colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ProfilePage.routeName);
            },
            child: const Text('Update Profile'),
          )
        ],
      ),
    );
  }

  Widget _buildVerifiedBody(BuildContext context) {
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

  Widget _buildErrorBody(BuildContext context) {
    return CustomErrorWidget(
      onRetryPressed: () {
        _verificationCheckCubit.check();
      },
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
