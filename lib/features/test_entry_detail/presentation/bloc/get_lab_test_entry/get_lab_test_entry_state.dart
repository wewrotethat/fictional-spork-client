import 'package:fictional_spork/core/domain/entities/entities.dart';

abstract class GetLabTestEntryState {}

class GetLabTestEntryInitial extends GetLabTestEntryState {}

class GetLabTestEntryLoading extends GetLabTestEntryState {}

class GetLabTestEntrySuccess extends GetLabTestEntryState {
  final LabTestEntry labTestEntry;
  GetLabTestEntrySuccess(this.labTestEntry);
}

class GetLabTestEntryFailure extends GetLabTestEntryState {}
