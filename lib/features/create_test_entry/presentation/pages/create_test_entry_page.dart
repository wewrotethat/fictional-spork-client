import 'package:fictional_spork/core/core.dart';
import 'package:fictional_spork/features/home/domain/value_objects/test_status.dart';
import 'package:fictional_spork/features/test_entry_detail/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

class CreateTestEntryPage extends StatelessWidget {
  const CreateTestEntryPage({Key? key}) : super(key: key);

  static const routeName = '/cerate-test-entry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: _buildCard(context),
    );
  }

  Widget _buildCard(BuildContext context) {
    return SingleChildScrollView(
      child: CustomCard(
        color: Theme.of(context).backgroundColor,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        child: _buildForm(context),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        _buildIdField(context),
        const SizedBox(
          height: 20,
        ),
        _buildSubmitButton(context),
      ],
    );
  }

  Widget _buildIdField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: '1234567',
        labelText: 'Patient ID/Card Number',
        prefixIcon: Icon(
          Icons.person_rounded,
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          TestEntryDetailPage.routeName,
          arguments: TestStatus.pending,
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.secondary,
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('Create'),
    );
  }
}
