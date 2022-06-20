import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/domain/entities/entities.dart';

abstract class GetLabTestEntriesRepo {
  Future<Either<GetLabTestEntriesFailure, List<LabTestEntry>>> get();
}

class GetLabTestEntriesFailure {}
