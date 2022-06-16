import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/core.dart';

abstract class VerificationCheckRepo {
  Future<Either<VerificationCheckFailure, ProfileVerificationStatus>>
      checkProfileVerificationStatus();
}

class VerificationCheckFailure {}
