import 'dart:convert';

import 'package:fictional_spork/features/auth/domain/entities/entities.dart';

class AuthenticationResponseMapper {
  static AuthenticationResponse responseFromMap(Map<String, dynamic> json) {
    return AuthenticationResponse(
      id: json['id'],
      token: json['token'],
    );
  }

  static AuthenticationResponse responseFromJson(String source) {
    return responseFromMap(json.decode(source));
  }
}
