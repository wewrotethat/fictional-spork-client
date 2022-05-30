import 'package:fictional_spork/features/auth/domain/entities/entities.dart';
import 'package:fictional_spork/features/auth/domain/value_objects/value_objects.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginProgressState extends LoginState {}

class LoginCompletedState extends LoginState {
  LoginCompletedState({
    required this.authenticationResponse,
  });

  final AuthenticationResponse authenticationResponse;
}

class LoginErrorState extends LoginState {
  LoginErrorState({
    required this.error,
  });

  final AuthenticationError error;
}
