import 'package:fictional_spork/core/core.dart';
import 'package:fictional_spork/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';

class CreateTestEntryPage extends StatefulWidget {
  const CreateTestEntryPage({Key? key}) : super(key: key);

  static const routeName = '/cerate-test-entry';

  @override
  State<CreateTestEntryPage> createState() => _CreateTestEntryPageState();
}

class _CreateTestEntryPageState extends State<CreateTestEntryPage> {
  final _createTestEntryCubit = CreateTestEntryCubit();
  final _idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
      padding: const EdgeInsets.all(20),
      child: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildIdField(context),
          const SizedBox(
            height: 20,
          ),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget _buildIdField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _idController,
      decoration: const InputDecoration(
        hintText: '1234567',
        labelText: 'Patient ID/Card Number',
        prefixIcon: Icon(
          Icons.person_rounded,
        ),
      ),
      validator: ValidationBuilder().minLength(5).build(),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return BlocConsumer<CreateTestEntryCubit, CreateTestEntryState>(
      bloc: _createTestEntryCubit,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _createTestEntryCubit.create(_idController.text);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary,
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 40),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state is CreateTestEntryProgressState)
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                ),
              if (state is CreateTestEntryProgressState)
                const SizedBox(
                  width: 20,
                ),
              const Text('Create'),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is CreateTestEntryErrorState) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.toString()),
              ),
            );
          }
        }

        if (state is CreateTestEntryCompletedState) {
          Navigator.of(context).pushReplacementNamed(
              TestEntryDetailPage.routeName,
              arguments: state.id);
        }
      },
    );
  }
}
