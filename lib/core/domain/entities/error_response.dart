import 'dart:convert';

import 'package:flutter/foundation.dart';

class ErrorResponse {
  ErrorResponse({
    this.error,
    this.validationErrors,
  });

  final String? error;
  final List<String>? validationErrors;

  factory ErrorResponse.fromMap(Map<String, dynamic> map) {
    return ErrorResponse(
      error: map['error'],
      validationErrors: map['validationErrors'] != null
          ? List<String>.from(map['validationErrors'])
          : null,
    );
  }
  factory ErrorResponse.fromJson(String source) =>
      ErrorResponse.fromMap(json.decode(source));

  ErrorResponse copyWith({
    String? error,
    List<String>? validationErrors,
  }) {
    return ErrorResponse(
      error: error ?? this.error,
      validationErrors: validationErrors ?? this.validationErrors,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (error != null) {
      result.addAll({'error': error});
    }
    if (validationErrors != null) {
      result.addAll({'validationErrors': validationErrors});
    }

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ErrorResponse(error: $error, validationErrors: $validationErrors)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorResponse &&
        other.error == error &&
        listEquals(other.validationErrors, validationErrors);
  }

  @override
  int get hashCode => error.hashCode ^ validationErrors.hashCode;
}
