import 'package:fictional_spork/app.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/ioc/ioc.dart';
import 'package:fictional_spork/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  await IntegrationIoc.init();
  CoreFeaturesIoc.init();
  AuthenticationIoc.init();
  PhoneVerificationIoc.init();
  runApp(
    Phoenix(
      child: const App(),
    ),
  );
}
