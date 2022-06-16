import 'dart:convert';

import 'package:fictional_spork/core/domain/entities/entities.dart';

class UserMapper {
  static User userFromMap(Map<String, dynamic> map) => User(
        id: map['id'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        medicalLicenseId: map['medicalLicenseId'],
        email: map['email'],
        phoneNumber: map['phoneNumber'],
        profileVerificationStatus: profileVerificationStatusFromString(
          map['profileVerificationStatus'],
        ),
        profilePictureUrl: map['profilePictureUrl'],
        phoneVerificationStatus: phoneVerificationStatusFromString(
          map['phoneVerificationStatus'],
        ),
        deviceTokens: List<String>.from(map['deviceTokens'].map((x) => x)),
        createdAt: DateTime.parse(map['createdAt']),
        updatedAt: DateTime.parse(map['updatedAt']),
      );

  static User userFromJson(String source) => userFromMap(json.decode(source));

  static ProfileVerificationStatus profileVerificationStatusFromString(
      String status) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return ProfileVerificationStatus.pending;
      case 'VERIFIED':
        return ProfileVerificationStatus.verified;
      case 'REJECTED':
        return ProfileVerificationStatus.rejected;
      default:
        return ProfileVerificationStatus.pending;
    }
  }

  static PhoneVerificationStatus phoneVerificationStatusFromString(
      String status) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return PhoneVerificationStatus.pending;
      case 'VERIFIED':
        return PhoneVerificationStatus.verified;
      case 'REJECTED':
        return PhoneVerificationStatus.rejected;
      default:
        return PhoneVerificationStatus.pending;
    }
  }
}
