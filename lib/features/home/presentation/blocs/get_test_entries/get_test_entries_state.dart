import 'package:fictional_spork/core/domain/entities/entities.dart';

abstract class GetTestEntriesState {}

class GetTestEntriesInitial extends GetTestEntriesState {}

class GetTestEntriesLoading extends GetTestEntriesState {}

class GetTestEntriesLoaded extends GetTestEntriesState {
  final List<LabTestEntry> testEntries;

  GetTestEntriesLoaded({required this.testEntries});
}

class GetTestEntriesError extends GetTestEntriesState {}
