import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/domain/entities/entities.dart';

abstract class GetTestEntryRepo {
  Future<Either<GetTestEntryFailure, LabTestEntry>> get(String id);
}

class GetTestEntryFailure {}
