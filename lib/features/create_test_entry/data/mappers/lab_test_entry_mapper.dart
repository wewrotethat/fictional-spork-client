import 'package:fictional_spork/core/data/mappers/mappers.dart';
import 'package:fictional_spork/features/create_test_entry/domain/entities/entities.dart';

class LabTestEntryMapper {
  static labTestEntryFromMap(Map<String, dynamic> map) {
    return LabTestEntry(
      bloodSmearImageUrl: map['bloodSmearImageUrl'],
      patientId: map['patientId'],
      technicianId: map['technicianId'],
      result: LabResultMapper.labResultFromMap(map['result']),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }
}
