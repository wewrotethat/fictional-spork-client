import 'package:fictional_spork/features/phone_verification/data/data.dart';
import 'package:fictional_spork/features/phone_verification/domain/domain.dart';
import 'package:get_it/get_it.dart';

class PhoneVerificationIoc {
  static final _locator = GetIt.instance;

  static void init() {
    _locator.registerLazySingleton<PhoneVerficationRepo>(
      () => PhoneVerificationRemoteRepo(),
    );
  }

  static PhoneVerficationRepo get phoneVerificationRepo {
    return _locator.get<PhoneVerficationRepo>();
  }
}
