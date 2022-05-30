import 'package:fictional_spork/core/domain/entities/entities.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpProgressState extends SignUpState {}

class SignUpCompletedState extends SignUpState {
  SignUpCompletedState({
    required this.user,
  });

  final User user;
}

class SignUpErrorState extends SignUpState {}
