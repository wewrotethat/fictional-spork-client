import 'package:fictional_spork/core/presentation/presentation.dart';
import 'package:fictional_spork/features/phone_verification/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerificationPage extends StatefulWidget {
  static const routeName = '/phone-verification';
  const PhoneVerificationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneVerificationPage> createState() => _LiteOtpState();
}

class _LiteOtpState extends State<PhoneVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _otpController = TextEditingController();

  final _getOtpCubit = GetOtpCubit();
  final _confirmOtpCubit = ConfirmOtpCubit();

  @override
  void initState() {
    _confirmOtpCubit.stream.listen(_confirmOtpStateListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Fictional Spork - Phone Verification',
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
    return BlocBuilder<GetOtpCubit, GetOtpState>(
        bloc: _getOtpCubit..getOtp(),
        builder: (context, state) {
          if (state is GetOtpSuccess) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildForm(context),
                ],
              ),
            );
          } else if (state is GetOtpFailure) {
            return CustomErrorWidget(onRetryPressed: () {
              _getOtpCubit.getOtp();
            });
          }
          return const Center(
            child: CustomLoadingIndicator(),
          );
        });
  }

  Widget _buildForm(
    BuildContext context,
  ) {
    _otpController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: const [
                    TextSpan(
                      text: 'We have sent an SMS with a one time password '
                          'to your phone number.\n',
                    ),
                    TextSpan(text: 'Please enter it below.'),
                  ],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Change Number'),
          ),
          TextButton(
            onPressed: () {
              _getOtpCubit.getOtp();
            },
            child: const Text('Resend OTP'),
          ),
          PinCodeTextField(
            appContext: context,
            animationDuration: const Duration(milliseconds: 300),
            autoFocus: true,
            controller: _otpController,
            keyboardType: TextInputType.number,
            length: 4,
            enabled: _confirmOtpCubit.state is! ConfirmOtpLoading,
            onChanged: (_) {},
            onCompleted: (_) {
              _submit();
            },
            pinTheme: PinTheme(
              activeColor: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.circular(5),
              errorBorderColor: Colors.red,
              fieldHeight: 50,
              fieldOuterPadding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 15,
              ),
              fieldWidth: 40,
              inactiveColor: Theme.of(context).disabledColor,
              selectedColor: Theme.of(context).primaryColorDark,
              shape: PinCodeFieldShape.box,
            ),
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 25,
          ),
          BlocBuilder<ConfirmOtpCubit, ConfirmOtpState>(
              bloc: _confirmOtpCubit,
              builder: (context, state) {
                return ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state is ConfirmOtpLoading)
                        const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1,
                          ),
                        ),
                      if (state is ConfirmOtpLoading)
                        const SizedBox(
                          width: 20,
                        ),
                      const Text('Next'),
                    ],
                  ),
                  onPressed: state is! ConfirmOtpLoading ? _submit : null,
                );
              }),
        ],
      ),
    );
  }

  void _confirmOtpStateListener(ConfirmOtpState state) {
    if (state is ConfirmOtpSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'OTP confirmed successfully!',
          ),
        ),
      );
      Navigator.of(context).pop();
    } else if (state is ConfirmOtpFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'OTP confirmation failed!',
          ),
        ),
      );
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _confirmOtpCubit.verifyOtp(_otpController.text);
    }
  }
}
