import 'package:dartz/dartz.dart';

import 'package:fictional_spork/features/auth/domain/domain.dart';

abstract class AuthenticationRepository {
  Future<Either<AuthenticationRepositoryFailure, AuthenticationResponse>>
      authenticate(
    AuthenticationValueObject authenticationValueObject,
  );
}

class AuthenticationRepositoryFailure {
  final AuthenticationError error;
  AuthenticationRepositoryFailure({
    required this.error,
  });
}
