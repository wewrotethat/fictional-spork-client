import 'package:fictional_spork/core/abstractions/abstractions.dart';
import 'package:fictional_spork/core/integrations/integrations.dart';
import 'package:fictional_spork/features/auth/helpers/helpers.dart';
import 'package:get_it/get_it.dart';

class IntegrationIoc {
  static final _locator = GetIt.instance;

  static Future<void> init() async {
    await HiveLocalStorage.init();
    _locator
      ..registerLazySingleton<HttpHelper>(
        () => DioHttpHelper(
          onResponse: SessionHelper.reponseProcessor
        ),
      )
      ..registerLazySingleton<LocalStorage>(
        HiveLocalStorage.getInstance,
      );
  }

  static HttpHelper get httpHelper {
    return _locator.get<HttpHelper>();
  }

  static LocalStorage get localStorage {
    return _locator.get<LocalStorage>();
  }
}
