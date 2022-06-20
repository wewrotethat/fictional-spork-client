import 'package:fictional_spork/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:fictional_spork/features/auth/auth.dart';
import 'package:fictional_spork/features/home/domain/repositories/repositories.dart';

class GetLabTestEntriesRemoteRepo implements GetLabTestEntriesRepo {
  final _httpHelper = IntegrationIoc.httpHelper;
  static const _baseUrl = String.fromEnvironment('API_BASE_URL');
  @override
  Future<Either<GetLabTestEntriesFailure, List<LabTestEntry>>> get() async {
    try {
      final token = await TokenHelper.get();

      final response = await _httpHelper.get(
        headers: {
          'content-type': 'application/json',
          'Authorization': token,
        },
        url: '$_baseUrl/users/me/lab-test-entries',
      );
      if (response.isOk) {
        final labTestEntries = (response.data as List)
            .map((entry) => LabTestEntryMapper.labTestEntryFromMap(entry))
            .toList();
        return right(labTestEntries);
      }
      return left(GetLabTestEntriesFailure());
    } catch (e) {
      return left(GetLabTestEntriesFailure());
    }
  }
}
