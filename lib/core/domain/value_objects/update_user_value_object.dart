import 'dart:convert';

class UpdateUserValueObject {
  UpdateUserValueObject({
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
    result.addAll({'first_name': firstName});
    result.addAll({'last_name': lastName});
    result.addAll({'medical_license_id': medicalLicenseId});
    result.addAll({'password': password});
    result.addAll({'phone_number': phoneNumber});
    result.addAll({'profile_picture_url': profilePictureUrl});

    return result;
  }

  String toJson() => json.encode(toMap());
}
