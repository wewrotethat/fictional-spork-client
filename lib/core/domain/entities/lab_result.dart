class LabResult {
  LabResult({
    required this.status,
    required this.stage,
    required this.segmentedImageUrl,
    required this.extra,
    required this.createdAt,
    required this.updatedAt,
  });

  final String status;
  final String? stage;
  final String? segmentedImageUrl;
  final Map<String, dynamic>? extra;
  final DateTime createdAt;
  final DateTime updatedAt;
}
