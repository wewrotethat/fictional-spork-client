import 'package:fictional_spork/features/features.dart';
import 'package:get_it/get_it.dart';

class TestEntryDetailIoc {
  static final _locator = GetIt.instance;

  static void init() {
    _locator.registerLazySingleton<GetTestEntryRepo>(
      () => GetTestEntryRemoteRepo(),
    );
  }

  static GetTestEntryRepo get getTestEntryRepo {
    return _locator.get<GetTestEntryRepo>();
  }
}
