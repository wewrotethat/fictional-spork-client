import 'package:fictional_spork/core/core.dart';

abstract class CreateTestEntryState {}

class CreateTestEntryInitialState implements CreateTestEntryState {}

class CreateTestEntryProgressState implements CreateTestEntryState {}

class CreateTestEntryCompletedState implements CreateTestEntryState {
  CreateTestEntryCompletedState({
    required this.id,
  });
  final String id;
}

class CreateTestEntryErrorState implements CreateTestEntryState {
  final ErrorResponse? error;
  CreateTestEntryErrorState({
    this.error,
  });
}
