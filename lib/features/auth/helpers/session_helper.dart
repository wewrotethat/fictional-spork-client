import 'package:fictional_spork/app.dart';
import 'package:fictional_spork/core/abstractions/abstractions.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';

abstract class SessionHelper {
  static void reponseProcessor(HttpResponse response) {
    if (response.statusCode == 401) {
      IntegrationIoc.localStorage.clear();
      authStream.add(true);
    }
  }

  static void logOut() {
    IntegrationIoc.localStorage.clear();
    authStream.add(true);
  }
}
