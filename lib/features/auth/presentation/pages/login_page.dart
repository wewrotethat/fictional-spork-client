import 'dart:developer';

import 'package:fictional_spork/core/core.dart';
import 'package:fictional_spork/features/home/presentation/pages/pages.dart';
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
    return SingleChildScrollView(
      child: CustomCard(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).backgroundColor,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
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

  // ignore: unused_element
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
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: const Text('Log in'),
    );
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPlatformButton(
          context,
          icon: const Icon(
            Icons.facebook,
            color: Colors.blue,
          ),
          onPressed: () {
            log('Icon tapped');
          },
        ),
        _buildPlatformButton(
          context,
          icon: const Icon(
            Icons.facebook,
            color: Colors.blue,
          ),
          onPressed: () {
            log('Icon tapped');
          },
        )
      ],
    );
  }

  Widget _buildPlatformButton(
    BuildContext context, {
    VoidCallback? onPressed,
    required Icon icon,
  }) {
    return IconButton(
      icon: icon,
      iconSize: 45,
      onPressed: onPressed,
      padding: const EdgeInsets.all(2.5),
      splashColor: Theme.of(context).primaryColorLight,
    );
  }
}
