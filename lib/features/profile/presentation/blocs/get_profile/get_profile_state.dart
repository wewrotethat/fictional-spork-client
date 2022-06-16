import 'package:fictional_spork/core/domain/domain.dart';

abstract class GetProfileState {}

class GetProfileInitial extends GetProfileState {}

class GetProfileLoading extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  GetProfileSuccess({required this.user});

  final User user;
}

class GetProfileFailure extends GetProfileState {}
