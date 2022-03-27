import 'package:fictional_spork/core/core.dart';
import 'package:fictional_spork/features/home/presentation/pages/pages.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 10,
              )
            ],
            color: Theme.of(context).backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: _buildForm(context),
          ),
        ),
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
        Navigator.of(context).pushNamedAndRemoveUntil(
          HomePage.routeName,
          (route) => false,
        );
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('Create'),
    );
  }
}
