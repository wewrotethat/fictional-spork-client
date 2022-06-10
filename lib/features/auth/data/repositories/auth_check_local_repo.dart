import 'package:fictional_spork/core/constants/constants.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/domain/repostitories/repostitories.dart';

class AuthCheckLocalRepo implements AuthCheckRepo {
  @override
  Future<bool> isLoggedIn() async {
    try {
      final token = await IntegrationIoc.localStorage.getString(Keys.token);
      return token != null;
    } catch (e) {
      return false;
    }
  }
}
