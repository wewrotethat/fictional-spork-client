import 'package:fictional_spork/core/core.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileInProgress extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {}

class UpdateProfileFailure extends UpdateProfileState {
  UpdateProfileFailure({
    this.error,
  });
  final ErrorResponse? error;
}
