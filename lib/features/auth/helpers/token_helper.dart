import 'package:fictional_spork/core/constants/constants.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';

class TokenHelper {
  static Future<String> get() async {
    final token = await IntegrationIoc.localStorage.getString(Keys.token);
    return 'Bearer $token';
  }
}
