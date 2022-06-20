import 'package:dartz/dartz.dart';

import 'package:fictional_spork/core/core.dart';

abstract class CreateTestEntryRepo {
  Future<Either<CreateTestEntryFailure, String>> create(
    String id,
  );
}

class CreateTestEntryFailure {
  final ErrorResponse? error;
  CreateTestEntryFailure({
    this.error,
  });
}
