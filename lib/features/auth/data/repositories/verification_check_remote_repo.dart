import 'package:fictional_spork/core/data/mappers/mappers.dart';
import 'package:fictional_spork/core/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/ioc/integration_ioc.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/domain/repostitories/repostitories.dart';
import 'package:fictional_spork/features/auth/helpers/helpers.dart';

class VerificationCheckRemoteRepo implements VerificationCheckRepo {
  static const _baseUrl = String.fromEnvironment('API_BASE_URL');
  final _httpHelper = IntegrationIoc.httpHelper;
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
