import 'dart:convert';

import 'package:fictional_spork/core/domain/entities/entities.dart';

class UserMapper {
  static User fromMap(Map<String, dynamic> map) => User(
        id: map['id'],
        firstName: map['first_name'],
        lastName: map['last_name'],
        medicalLicenseId: map['medical_license_id'],
        email: map['email'],
        phoneNumber: map['phone_number'],
        profileVerificationStatus: map['profile_verification_status'],
        profilePictureUrl: map['profile_picture_url'],
        phoneVerificationStatus: map['phone_verification_status'],
        deviceTokens: List<String>.from(map['device_tokens'].map((x) => x)),
        createdAt: DateTime.parse(map['created_at']),
        updatedAt: DateTime.parse(map['updated_at']),
      );

  static User fromJson(String source) => fromMap(json.decode(source));
}
