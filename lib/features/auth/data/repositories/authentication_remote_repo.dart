import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/data/mappers/mappers.dart';
import 'package:fictional_spork/features/auth/domain/domain.dart';

class AuthenticationRemoteRepo implements AuthenticationRepository {
  static const _baseUrl = String.fromEnvironment('API_BASE_URL');
  final _httpHelper = IntegrationIoc.httpHelper;

  @override
  Future<Either<AuthenticationRepositoryFailure, AuthenticationResponse>>
      authenticate(
    AuthenticationValueObject authenticationValueObject,
  ) async {
    try {
      final response = await _httpHelper.post(
        data: authenticationValueObject.toMap(),
        headers: {
          'content-type': 'application/json',
        },
        url: '$_baseUrl/auth',
      );

      if (response.isOk) {
        final authResponse = AuthenticationResponseMapper.responseFromMap(
          response.data,
        );
        return right(authResponse);
      }
      return left(
        AuthenticationRepositoryFailure(
          error: AuthenticationError.invalidCredentials,
        ),
      );
    } catch (e) {
      return left(
        AuthenticationRepositoryFailure(
          error: AuthenticationError.systemError,
        ),
      );
    }
  }
}
