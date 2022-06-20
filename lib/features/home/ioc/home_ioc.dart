import 'package:fictional_spork/features/auth/data/data.dart';
import 'package:fictional_spork/features/auth/domain/domain.dart';
import 'package:fictional_spork/features/features.dart';
import 'package:get_it/get_it.dart';

class HomeIoc {
  static final _locator = GetIt.instance;

  static void init() {
    _locator.registerLazySingleton<GetLabTestEntriesRepo>(
      () => GetLabTestEntriesRemoteRepo(),
    );
  }

  static GetLabTestEntriesRepo get getLabTestEntriesRepo {
    return _locator.get<GetLabTestEntriesRepo>();
  }
}
