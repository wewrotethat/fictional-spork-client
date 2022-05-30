import 'package:fictional_spork/core/constants/constants.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';

class TokenHelper {
  static String getToken() {
    final token = IntegrationIoc.localStorage.getString(Keys.token);
    return 'Bearer $token';
  }
}
