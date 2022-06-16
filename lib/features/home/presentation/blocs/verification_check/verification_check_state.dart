import 'package:fictional_spork/core/domain/entities/entities.dart';

abstract class VerificationCheckState {}

class VerificationCheckInitialState extends VerificationCheckState {}

class VerificationCheckingState extends VerificationCheckState {}

class VerificationCheckedState extends VerificationCheckState {
  VerificationCheckedState({required this.status});

  final ProfileVerificationStatus status;
}

class VerificationCheckFailureState extends VerificationCheckState {}
