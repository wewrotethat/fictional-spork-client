import 'package:fictional_spork/core/domain/value_objects/value_objects.dart';
import 'package:fictional_spork/core/presentation/widgets/widgets.dart';
import 'package:fictional_spork/features/auth/presentation/blocs/blocs.dart';
import 'package:fictional_spork/features/auth/presentation/pages/pages.dart';
import 'package:fictional_spork/features/auth/presentation/presentation.dart';
import 'package:fictional_spork/features/home/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const routeName = '/sign-up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpCubit _signUpCubit = SignUpCubit();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _medicalLicenseIdController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _signUpCubit.stream.listen(_signUpStateListener);
    super.initState();
  }

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
          _buildMedicalLicenseIdField(context),
          _buildSpacer(context),
          _buildPhoneField(context),
          const SizedBox(
            height: 30,
          ),
          _buildSignUpButton(context),
          _buildSpacer(context),
          _buildSignInButton(context),
          const SizedBox(
            width: double.infinity,
          )
        ],
      ),
    );
  }

  Widget _buildFirstNameField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _firstNameController,
      decoration: const InputDecoration(
        hintText: 'John',
        labelText: 'First Name',
        prefixIcon: Icon(
          Icons.person_rounded,
        ),
      ),
      validator: ValidationBuilder().minLength(3).maxLength(50).build(),
    );
  }

  Widget _buildLastNameField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _lastNameController,
      decoration: const InputDecoration(
        hintText: 'Doe',
        labelText: 'Last Name',
        prefixIcon: Icon(
          Icons.person_rounded,
        ),
      ),
      validator: ValidationBuilder().minLength(3).maxLength(50).build(),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'john.doe@email.com',
        labelText: 'Email',
        prefixIcon: Icon(Icons.email_rounded),
      ),
      validator: ValidationBuilder().email().build(),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.password_rounded),
      ),
      validator: ValidationBuilder().minLength(8).build(),
    );
  }

  Widget _buildConfirmPasswordField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _confirmPasswordController,
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        prefixIcon: Icon(Icons.password_rounded),
      ),
      validator: ValidationBuilder()
          .add((value) {
            if (value != _passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          })
          .minLength(8)
          .build(),
    );
  }

  Widget _buildMedicalLicenseIdField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _medicalLicenseIdController,
      decoration: const InputDecoration(
        labelText: 'Medical License ID',
        prefixIcon: Icon(Icons.card_membership_rounded),
      ),
      validator: ValidationBuilder().minLength(5).maxLength(50).build(),
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _phoneNumberController,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        prefixIcon: Icon(
          Icons.phone_android_rounded,
        ),
      ),
      validator: ValidationBuilder().minLength(10).maxLength(13).build(),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(LoginPage.routeName);
      },
      child: const Text(
        'Already have an account?',
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      bloc: _signUpCubit,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is SignUpProgressState ? null : _onSubmit,
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
              if (state is SignUpProgressState)
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
                ),
              if (state is SignUpProgressState)
                const SizedBox(
                  width: 20,
                ),
              const Text('Sign up'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSpacer(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final createUserValueObject = CreateUserValueObject(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        medicalLicenseId: _medicalLicenseIdController.text,
        phoneNumber: _phoneNumberController.text,
        //TODO(Yabsra): remove this from the api or do upload prior to sign up
        profilePictureUrl: 'https://google.com',
      );
      _signUpCubit.signUp(createUserValueObject);
    }
  }

  void _signUpStateListener(SignUpState state) {
    if (state is SignUpCompletedState) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Sign up successful!',
          ),
        ),
      );
      Navigator.of(context).pushNamed(LoginPage.routeName);
    }
    if (state is SignUpErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'An error occurred while trying to sign you up!',
          ),
        ),
      );
    }
  }
}
