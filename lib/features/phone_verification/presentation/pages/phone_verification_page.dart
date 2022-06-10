import 'package:fictional_spork/core/presentation/presentation.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
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
  }

  Widget _buildForm(
    BuildContext context,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: const [
                    TextSpan(
                        text:
                            'We have sent an SMS with a one time password to '),
                    TextSpan(
                      text: '+251 987654321',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '. '),
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
            onPressed: () {},
            child: const Text('Change Number'),
          ),
          PinCodeTextField(
            appContext: context,
            animationDuration: const Duration(milliseconds: 300),
            autoFocus: true,
            controller: _otpController,
            keyboardType: TextInputType.number,
            length: 5,
            onChanged: (_) {},
            onCompleted: (v) async {},
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
          ElevatedButton(
            child: const Text('Next'),
            onPressed: _submit,
          ),
        ],
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {}
  }
}
