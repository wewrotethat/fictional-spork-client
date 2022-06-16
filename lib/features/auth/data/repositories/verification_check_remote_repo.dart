import 'package:fictional_spork/core/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/domain/repostitories/repostitories.dart';

class VerificationCheckRemoteRepo implements VerificationCheckRepo {
  @override
  Future<Either<VerificationCheckFailure, ProfileVerificationStatus>>
      checkProfileVerificationStatus() async {
    try {
      final user = await CoreFeaturesIoc.userRepo.getUser();
      return user.fold(
        (l) => left(VerificationCheckFailure()),
        (r) => right(r.profileVerificationStatus),
      );
    } catch (e) {
      return left(
        VerificationCheckFailure(),
      );
    }
  }
}
