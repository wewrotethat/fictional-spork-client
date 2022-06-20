import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/core.dart';
import 'package:fictional_spork/features/auth/helpers/helpers.dart';
import 'package:fictional_spork/features/create_test_entry/domain/repositories/create_test_entry_repo.dart';

class CreateTestEntryRemoteRepo implements CreateTestEntryRepo {
  final _httpHelper = IntegrationIoc.httpHelper;
  static const _baseUrl = String.fromEnvironment('API_BASE_URL');
  @override
  Future<Either<CreateTestEntryFailure, String>> create(
    String id,
  ) async {
    try {
      final token = await TokenHelper.get();

      final response = await _httpHelper.post(
        headers: {
          'content-type': 'application/json',
          'Authorization': token,
        },
        url: '$_baseUrl/lab-test-entries',
        data: {
          'patientId': id,
        },
      );
      if (response.isOk) {
        return right(response.data['id']);
      }
      return left(
          CreateTestEntryFailure(error: ErrorResponse.fromMap(response.data)));
    } catch (e) {
      return left(CreateTestEntryFailure());
    }
  }
}
