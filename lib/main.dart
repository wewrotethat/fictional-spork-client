import 'package:fictional_spork/app.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/ioc/ioc.dart';
import 'package:flutter/material.dart';

void main() {
  IntegrationIoc.init();
  CoreFeaturesIoc.init();
  AuthenticationIoc.init();
  runApp(
    const App(),
  );
}
