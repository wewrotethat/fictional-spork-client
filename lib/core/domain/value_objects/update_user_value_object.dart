import 'dart:convert';

class UpdateUserValueObject {
  UpdateUserValueObject({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.medicalLicenseId,
    required this.phoneNumber,
  });

  final String email;
  final String firstName;
  final String lastName;
  final String medicalLicenseId;
  final String phoneNumber;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'first_name': firstName});
    result.addAll({'last_name': lastName});
    result.addAll({'medical_license_id': medicalLicenseId});
    result.addAll({'phone_number': phoneNumber});

    return result;
  }

  String toJson() => json.encode(toMap());
}
