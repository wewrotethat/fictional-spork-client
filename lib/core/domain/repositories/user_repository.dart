import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/domain/entities/entities.dart';
import 'package:fictional_spork/core/domain/value_objects/value_objects.dart';

abstract class UserRepository {
  Future<Either<UserRepositoryFailure, User>> getUser(String id);
  Future<Either<UserRepositoryFailure, User>> createUser(
    CreateUserValueObject createUserValueObject,
  );
  Future<Either<UserRepositoryFailure, User>> updateUser(
    String id,
    UpdateUserValueObject updateUserValueObject,
  );
}

class UserRepositoryFailure {}
