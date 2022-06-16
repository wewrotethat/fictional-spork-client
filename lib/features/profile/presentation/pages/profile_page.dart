import 'package:fictional_spork/core/domain/entities/entities.dart';
import 'package:fictional_spork/core/presentation/presentation.dart';
import 'package:fictional_spork/features/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_form_field/phone_form_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _getProfileCubit = GetProfileCubit();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _medicalLicenseIdController = TextEditingController();
  final _phoneController = PhoneController(null);

  final _formKey = GlobalKey<FormState>();

  final _selectorNavigator = const CountrySelectorNavigator.modalBottomSheet();

  @override
  void initState() {
    _getProfileCubit.stream.listen(_getProfileCubitListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Fictional Spork - Profile',
          style: GoogleFonts.pacifico(
            color: Theme.of(context).colorScheme.secondary,
            textStyle: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
        builder: ((context, state) {
      if (state is GetProfileSuccess) {
        return _buildForm(state.user);
      } else if (state is GetProfileFailure) {
        return _buildErrorBody();
      }

      return const Center(
        child: CustomLoadingIndicator(),
      );
    }));
  }

  Widget _buildForm(User user) {
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
          _buildMedicalLicenseIdField(context),
          _buildSpacer(context),
          _buildPhoneField(context),
          const SizedBox(
            height: 30,
          ),
          _buildSignUpButton(context),
          _buildSpacer(context),
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

  void _getProfileCubitListener(GetProfileState state) {
    if (state is GetProfileSuccess) {
      final user = state.user;
      _firstNameController.text = user.firstName;
      _lastNameController.text = user.lastName;
      _emailController.text = user.email;
      _medicalLicenseIdController.text = user.medicalLicenseId;
      _phoneController.value = PhoneNumber.fromRaw(user.phoneNumber);
    }
  }

  Widget _buildErrorBody() {
    return CustomErrorWidget(onRetryPressed: () {
      _getProfileCubit.getProfile();
    });
  }
}
