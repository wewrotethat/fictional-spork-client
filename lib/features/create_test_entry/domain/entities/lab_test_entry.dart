import 'package:fictional_spork/core/core.dart';

class LabTestEntry {
  LabTestEntry({
    this.bloodSmearImageUrl,
    required this.patientId,
    required this.technicianId,
    required this.result,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? bloodSmearImageUrl;
  final String patientId;
  final String technicianId;
  final LabResult result;
  final DateTime createdAt;
  final DateTime updatedAt;
}
