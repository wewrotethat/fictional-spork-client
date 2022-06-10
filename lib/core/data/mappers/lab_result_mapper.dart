import 'package:fictional_spork/core/domain/entities/entities.dart';

class LabResultMapper {
  static labResultFromMap(Map<String, dynamic> map) {
    return LabResult(
      status: map['status'],
      stage: map['stage'],
      segmentedImageUrl: map['segmentedImageUrl'],
      extra: map['extra'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }
}
