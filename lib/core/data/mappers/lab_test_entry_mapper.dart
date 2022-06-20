import 'package:fictional_spork/core/data/mappers/mappers.dart';
import 'package:fictional_spork/core/domain/domain.dart';

class LabTestEntryMapper {
  static LabTestEntry labTestEntryFromMap(Map<String, dynamic> map) {
    return LabTestEntry(
      bloodSmearImageUrl: map['bloodSmearImageUrl'],
      patientId: map['patientId'],
      technicianId: map['technicianId'],
      result: map['result'] != null
          ? LabResultMapper.labResultFromMap(map['result'])
          : null,
      status: map['status'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      patientInfo: map['patientInfo'] == null
          ? null
          : ProfileInfo.fromMap(map['patientInfo']),
    );
  }
}
