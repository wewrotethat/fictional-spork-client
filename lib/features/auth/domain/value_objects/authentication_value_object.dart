import 'dart:convert';

class AuthenticationValueObject {
  AuthenticationValueObject({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  String toJson() => json.encode(toMap());
}
