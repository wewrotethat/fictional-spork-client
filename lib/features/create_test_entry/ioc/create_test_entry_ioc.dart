import 'package:fictional_spork/features/create_test_entry/data/repositories/create_test_entry_remote_repo.dart';
import 'package:fictional_spork/features/create_test_entry/domain/repositories/create_test_entry_repo.dart';
import 'package:get_it/get_it.dart';

class CreateTestEntryIoc {
  static final _locator = GetIt.instance;

  static void init() {
    _locator.registerLazySingleton<CreateTestEntryRepo>(
      () => CreateTestEntryRemoteRepo(),
    );
  }

  static CreateTestEntryRepo get createTestEntryRepo {
    return _locator.get<CreateTestEntryRepo>();
  }
}
