import 'dart:convert';

class CreateUserValueObject {
  CreateUserValueObject({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.medicalLicenseId,
    required this.password,
    required this.phoneNumber,
  });

  final String email;
  final String firstName;
  final String lastName;
  final String medicalLicenseId;
  final String password;
  final String phoneNumber;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'medicalLicenseId': medicalLicenseId});
    result.addAll({'password': password});
    result.addAll({'phoneNumber': phoneNumber});

    return result;
  }

  String toJson() => json.encode(toMap());
}
