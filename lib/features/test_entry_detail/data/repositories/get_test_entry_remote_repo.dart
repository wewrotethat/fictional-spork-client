import 'package:fictional_spork/core/data/mappers/mappers.dart';
import 'package:fictional_spork/core/domain/entities/lab_test_entry.dart';
import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/helpers/helpers.dart';
import 'package:fictional_spork/features/test_entry_detail/test_entry_detail.dart';

class GetTestEntryRemoteRepo implements GetTestEntryRepo {
  final _httpHelper = IntegrationIoc.httpHelper;
  static const _baseUrl = String.fromEnvironment('API_BASE_URL');
  @override
  Future<Either<GetTestEntryFailure, LabTestEntry>> get(
    String id,
  ) async {
    try {
      final token = await TokenHelper.get();
      final response = await _httpHelper.get(
        headers: {
          'content-type': 'application/json',
          'Authorization': token,
        },
        url: '$_baseUrl/lab-test-entries/$id',
      );
      if (response.isOk) {
        final labTestEntry = LabTestEntryMapper.labTestEntryFromMap(
          response.data,
        );
        return right(labTestEntry);
      }
      return left(GetTestEntryFailure());
    } catch (e) {
      return left(GetTestEntryFailure());
    }
  }
}
