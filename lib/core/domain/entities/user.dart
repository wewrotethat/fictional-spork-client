class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.medicalLicenseId,
    required this.email,
    required this.phoneNumber,
    required this.profileVerificationStatus,
    required this.profilePictureUrl,
    required this.phoneVerificationStatus,
    required this.deviceTokens,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String medicalLicenseId;
  final String email;
  final String phoneNumber;
  final ProfileVerificationStatus profileVerificationStatus;
  final String profilePictureUrl;
  final PhoneVerificationStatus phoneVerificationStatus;
  final List<String> deviceTokens;
  final DateTime createdAt;
  final DateTime updatedAt;
}

enum ProfileVerificationStatus { pending, verified, rejected }
enum PhoneVerificationStatus { pending, verified, rejected }
