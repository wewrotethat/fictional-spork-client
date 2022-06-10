import 'package:fictional_spork/core/domain/value_objects/value_objects.dart';
import 'package:fictional_spork/core/extensions/extensions.dart';
import 'package:fictional_spork/core/presentation/widgets/widgets.dart';
import 'package:fictional_spork/features/auth/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_form_field/phone_form_field.dart';

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
  final _phoneController = PhoneController(null);

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final _formKey = GlobalKey<FormState>();

  final _selectorNavigator = const CountrySelectorNavigator.modalBottomSheet();

  @override
  void initState() {
    _signUpCubit.stream.listen(_signUpStateListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Fictional Spork - Sign Up',
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
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.password_rounded),
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
      obscureText: _obscurePassword,
      validator: ValidationBuilder().minLength(8).build(),
    );
  }

  Widget _buildConfirmPasswordField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _confirmPasswordController,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        prefixIcon: const Icon(Icons.password_rounded),
        suffixIcon: CustomIconButton(
          backgroundColor: Colors.transparent,
          height: 20,
          icon: Icon(
            _obscureConfirmPassword
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
          ),
          onTap: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
          width: 20,
        ),
      ),
      obscureText: _obscureConfirmPassword,
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
    return PhoneFormField(
      autofillHints: const [AutofillHints.telephoneNumber],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _phoneController,
      countryCodeStyle: Theme.of(context).textTheme.subtitle1,
      countrySelectorNavigator: _selectorNavigator,
      cursorColor: Theme.of(context).colorScheme.primary,
      defaultCountry: IsoCode.ET,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Phone Number',
      ),
      showFlagInInput: true,
      textDirection: TextDirection.ltr,
      validator: _getValidator(),
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

  PhoneNumberInputValidator? _getValidator() {
    List<PhoneNumberInputValidator> validators = [];
    validators.add(
      PhoneValidator.required(
        errorText: 'Phone number is required',
      ),
    );

    validators.add(PhoneValidator.validMobile(
      errorText: 'Please input a valid phone number',
    ));

    validators.add(PhoneValidator.validCountry(
      [IsoCode.ET],
      errorText: 'Please enter a phone number from Ethiopia',
    ));

    return validators.isNotEmpty ? PhoneValidator.compose(validators) : null;
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final createUserValueObject = CreateUserValueObject(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          medicalLicenseId: _medicalLicenseIdController.text,
          phoneNumber: _phoneController.value!.international);
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
      late String message;
      if (state.error == null) {
        message = 'An error occurred while trying to sign you up!';
      } else if (state.error!.error != null) {
        message = state.error!.error!.capitalize();
      } else if (state.error!.validationErrors != null) {
        message = state.error!.validationErrors!
            .map((error) => error.capitalize())
            .join(', ');
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
          ),
        ),
      );
    }
  }
}
