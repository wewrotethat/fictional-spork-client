import 'package:fictional_spork/features/auth/data/data.dart';
import 'package:fictional_spork/features/auth/domain/domain.dart';
import 'package:get_it/get_it.dart';

class AuthenticationIoc {
  static final _locator = GetIt.instance;

  static Future<void> init() async {
    _locator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRemoteRepo(),
    );
  }

  static AuthenticationRepository get authRepo {
    return _locator.get<AuthenticationRepository>();
  }
}
