import 'dart:convert';

class CreateUserValueObject {
  CreateUserValueObject({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.medicalLicenseId,
    required this.password,
    required this.phoneNumber,
    required this.profilePictureUrl,
  });

  final String email;
  final String firstName;
  final String lastName;
  final String medicalLicenseId;
  final String password;
  final String phoneNumber;
  final String profilePictureUrl;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'medicalLicenseId': medicalLicenseId});
    result.addAll({'password': password});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'profilePictureUrl': profilePictureUrl});

    return result;
  }

  String toJson() => json.encode(toMap());
}
