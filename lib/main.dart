import 'package:fictional_spork/app.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/create_test_entry/ioc/create_test_entry_ioc.dart';
import 'package:fictional_spork/features/features.dart';
import 'package:fictional_spork/features/home/ioc/home_ioc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  await IntegrationIoc.init();
  CoreFeaturesIoc.init();
  AuthenticationIoc.init();
  PhoneVerificationIoc.init();
  HomeIoc.init();
  TestEntryDetailIoc.init();
  CreateTestEntryIoc.init();
  runApp(
    Phoenix(
      child: const App(),
    ),
  );
}
