import 'package:fictional_spork/core/core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = false;

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
    return Container(
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
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: _buildForm(context),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitle(context),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          endIndent: 20,
          indent: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        _buildEmailField(context),
        const SizedBox(
          height: 20,
        ),
        _buildPasswordField(context),
        const SizedBox(
          height: 30,
        ),
        _buildSubmitButton(context),
      ],
    );
  }

  Widget _buildTitle(context) {
    return Text(
      'Please enter your credentials',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_rounded),
        hintText: 'john.doe@email.com',
        labelText: 'Email',
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.password_rounded),
        labelText: 'Password',
        suffixIcon: CustomIconButton(
          backgroundColor: Colors.transparent,
          height: 20,
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
          ),
          onTap: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          width: 20,
        ),
      ),
      obscureText: !_obscurePassword,
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('Log in'),
    );
  }
}
