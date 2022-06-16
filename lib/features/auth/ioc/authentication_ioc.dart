import 'package:fictional_spork/features/auth/data/data.dart';
import 'package:fictional_spork/features/auth/domain/domain.dart';
import 'package:get_it/get_it.dart';

class AuthenticationIoc {
  static final _locator = GetIt.instance;

  static void init() {
    _locator
      ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRemoteRepo(),
      )
      ..registerLazySingleton<AuthCheckRepo>(
        () => AuthCheckLocalRepo(),
      )
      ..registerLazySingleton<VerificationCheckRepo>(
          () => VerificationCheckRemoteRepo());
  }

  static AuthenticationRepository get authRepo {
    return _locator.get<AuthenticationRepository>();
  }

  static AuthCheckRepo get authCheckRepo {
    return _locator.get<AuthCheckRepo>();
  }

  static VerificationCheckRepo get verificationCheckRepo {
    return _locator.get<VerificationCheckRepo>();
  }
}
