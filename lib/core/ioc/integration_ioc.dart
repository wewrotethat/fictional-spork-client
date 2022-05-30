import 'package:fictional_spork/core/abstractions/abstractions.dart';
import 'package:fictional_spork/core/integrations/integrations.dart';
import 'package:get_it/get_it.dart';

class IntegrationIOC {
  static final _locator = GetIt.instance;

  static Future<void> init() async {
    await HiveLocalStorage.init();
    _locator
      ..registerLazySingleton<HttpHelper>(
        () => DioHttpHelper(),
      )
      ..registerLazySingleton<LocalStorage>(
        HiveLocalStorage.getInstance,
      );
  }

  static HttpHelper httpHelper() {
    return _locator.get<HttpHelper>();
  }

  static LocalStorage localStorage() {
    return _locator.get<LocalStorage>();
  }
}
