import 'package:fictional_spork/core/data/repositories/repositories.dart';
import 'package:fictional_spork/core/domain/domain.dart';
import 'package:get_it/get_it.dart';

class CoreFeaturesIoc {
  static final _locator = GetIt.instance;

  static Future<void> init() async {
    _locator.registerLazySingleton<UserRepository>(
      () => UserRemoteRepository(),
    );
  }

  static UserRepository get userRepo {
    return _locator.get<UserRepository>();
  }
}
