import 'package:fictional_spork/features/features.dart';
import 'package:fictional_spork/features/test_entry_detail/data/repositories/upload_sample_image_remote_repo.dart';
import 'package:fictional_spork/features/test_entry_detail/domain/repositories/upload_sample_image_repo.dart';
import 'package:get_it/get_it.dart';

class TestEntryDetailIoc {
  static final _locator = GetIt.instance;

  static void init() {
    _locator
      ..registerLazySingleton<GetTestEntryRepo>(
        () => GetTestEntryRemoteRepo(),
      )
      ..registerLazySingleton<UploadSampleImageRepo>(
        () => UploadSampleImageRemoteRepo(),
      );
  }

  static GetTestEntryRepo get getTestEntryRepo {
    return _locator.get<GetTestEntryRepo>();
  }

  static UploadSampleImageRepo get uploadSampleImageRepo {
    return _locator.get<UploadSampleImageRepo>();
  }
}
