import 'package:fictional_spork/core/core.dart';
import 'package:fictional_spork/features/auth/auth.dart';
import 'package:fictional_spork/features/features.dart';
import 'package:fictional_spork/features/phone_verification/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _loginCubit = LoginCubit();

  @override
  void initState() {
    _loginCubit.stream.listen(_loginStateListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Fictional Spork - Login',
          style: GoogleFonts.pacifico(
            color: Theme.of(context).colorScheme.secondary,
            textStyle: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildEmailField(context),
          const SizedBox(
            height: 20,
          ),
          _buildPasswordField(context),
          const SizedBox(
            height: 50,
          ),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email_rounded),
        hintText: 'john.doe@email.com',
        labelText: 'Email',
      ),
      validator: ValidationBuilder().email().build(),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
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

  Widget _buildLoginButton(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: _loginCubit,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is LoginProgressState ? null : _onSubmit,
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
              if (state is LoginProgressState)
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
                ),
              if (state is LoginProgressState)
                const SizedBox(
                  width: 20,
                ),
              const Text('Log in'),
            ],
          ),
        );
      },
    );
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      _loginCubit.login(
        AuthenticationValueObject(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  void _loginStateListener(LoginState state) {
    if (state is LoginCompletedState) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Login successful!',
          ),
        ),
      );
      Navigator.of(context).pushNamedAndRemoveUntil(
        HomePage.routeName,
        ((route) => false),
      );
    }
    if (state is LoginErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            getErrorMessage(state.error),
          ),
        ),
      );
    }
  }

  String getErrorMessage(AuthenticationError error) {
    switch (error) {
      case AuthenticationError.invalidCredentials:
        return 'Invalid credentials';
      default:
        return 'An error occurred while authenticating';
    }
  }
}
