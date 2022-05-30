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
        profileVerificationStatus: map['profileVerificationStatus'],
        profilePictureUrl: map['profilePictureUrl'],
        phoneVerificationStatus: map['phoneVerificationStatus'],
        deviceTokens: List<String>.from(map['deviceTokens'].map((x) => x)),
        createdAt: DateTime.parse(map['createdAt']),
        updatedAt: DateTime.parse(map['updatedAt']),
      );

  static User userFromJson(String source) => userFromMap(json.decode(source));
}
