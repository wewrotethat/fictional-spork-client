import 'dart:convert';

class ProfileInfo {
  ProfileInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthDate,
    required this.address,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String gender;
  final String birthDate;
  final String address;

  ProfileInfo copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? gender,
    String? birthDate,
    String? address,
  }) {
    return ProfileInfo(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'gender': gender});
    result.addAll({'birthDate': birthDate});
    result.addAll({'address': address});

    return result;
  }

  factory ProfileInfo.fromMap(Map<String, dynamic> map) {
    return ProfileInfo(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      gender: map['gender'] ?? '',
      birthDate: map['birthDate'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileInfo.fromJson(String source) =>
      ProfileInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileInfo(id: $id, firstName: $firstName, lastName: $lastName, gender: $gender, birthDate: $birthDate, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileInfo &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.gender == gender &&
        other.birthDate == birthDate &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        gender.hashCode ^
        birthDate.hashCode ^
        address.hashCode;
  }
}
