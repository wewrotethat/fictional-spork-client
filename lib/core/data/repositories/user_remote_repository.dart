import 'package:fictional_spork/core/data/mappers/mappers.dart';
import 'package:fictional_spork/core/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/domain/repositories/repositories.dart';
import 'package:fictional_spork/core/domain/value_objects/update_user_value_object.dart';
import 'package:fictional_spork/core/domain/value_objects/create_user_value_object.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/helpers/helpers.dart';

class UserRemoteRepository implements UserRepository {
  final _httpHelper = IntegrationIoc.httpHelper;
  static const _baseUrl = String.fromEnvironment('API_BASE_URL');

  @override
  Future<Either<UserRepositoryFailure, User>> createUser(
      CreateUserValueObject createUserValueObject) async {
    try {
      final response = await _httpHelper.post(
        data: createUserValueObject.toMap(),
        url: '$_baseUrl/users',
      );

      if (response.isOk) {
        final user = UserMapper.userFromMap(response.data);
        return right(user);
      }
      final errorResponse = ErrorResponse.fromMap(response.data);
      return left(UserRepositoryFailure(error: errorResponse));
    } catch (e) {
      return left(UserRepositoryFailure());
    }
  }

  @override
  Future<Either<UserRepositoryFailure, User>> getUser() async {
    try {
      final token = await TokenHelper.get();
      final response = await _httpHelper.get(
        headers: {
          'content-type': 'application/json',
          'Authorization': token,
        },
        url: '$_baseUrl/users/me',
      );

      if (response.isOk) {
        final user = UserMapper.userFromMap(response.data);
        return right(user);
      }
      return left(UserRepositoryFailure());
    } catch (e) {
      return left(UserRepositoryFailure());
    }
  }

  @override
  Future<Either<UserRepositoryFailure, User>> updateUser(
    UpdateUserValueObject updateUserValueObject,
  ) async {
    try {
      final token = await TokenHelper.get();

      final response = await _httpHelper.put(
        data: updateUserValueObject.toMap(),
        headers: {
          'content-type': 'application/json',
          'Authorization': token,
        },
        url: '$_baseUrl/users/me',
      );

      if (response.isOk) {
        final user = UserMapper.userFromMap(response.data);
        return right(user);
      }
      return left(UserRepositoryFailure());
    } catch (e) {
      return left(UserRepositoryFailure());
    }
  }
}
