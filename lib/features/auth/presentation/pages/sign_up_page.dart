import 'package:fictional_spork/core/presentation/widgets/widgets.dart';
import 'package:fictional_spork/features/auth/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const routeName = '/sign-up';

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
        _buildTitle(context),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          endIndent: 20,
          indent: 20,
        ),
        const SizedBox(
          height: 5,
        ),
        _buildFirstNameField(context),
        _buildSpacer(context),
        _buildLastNameField(context),
        _buildSpacer(context),
        _buildEmailField(context),
        _buildSpacer(context),
        _buildPasswordField(context),
        _buildSpacer(context),
        _buildConfirmPasswordField(context),
        _buildSpacer(context),
        const SizedBox(
          height: 30,
        ),
        _buildSubmitButton(context),
        _buildSpacer(context),
        _buildLoginButton(context),
        const SizedBox(
          width: double.infinity,
        )
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Please complete the form',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildFirstNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'John',
        labelText: 'First Name',
        prefixIcon: Icon(
          Icons.person_rounded,
        ),
      ),
    );
  }

  Widget _buildLastNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Doe',
        labelText: 'Last Name',
        prefixIcon: Icon(
          Icons.person_rounded,
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          hintText: 'john.doe@email.com',
          labelText: 'Email',
          prefixIcon: Icon(Icons.email_rounded)),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.password_rounded),
      ),
    );
  }

  Widget _buildConfirmPasswordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        prefixIcon: Icon(Icons.password_rounded),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.secondary,
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('Sign up'),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(
          LoginPage.routeName,
        );
      },
      child: const Text(
        'Already have an account?',
      ),
    );
  }

  Widget _buildSpacer(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}
