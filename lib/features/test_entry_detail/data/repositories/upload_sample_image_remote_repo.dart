import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fictional_spork/features/auth/auth.dart';
import 'package:fictional_spork/features/test_entry_detail/domain/repositories/upload_sample_image_repo.dart';

class UploadSampleImageRemoteRepo implements UploadSampleImageRepo {
  static const _baseUrl = String.fromEnvironment('API_BASE_URL');
  @override
  Future<Either<UploadSampleImageFailure, bool>> upload(
      String id, String filePath) async {
    try {
      final token = await TokenHelper.get();
      final formData = FormData.fromMap(
        {
          "file": await MultipartFile.fromFile(filePath),
        },
      );
      final response = await Dio().put(
        "$_baseUrl/lab-test-entries/$id/sample-image",
        data: formData,
        options: Options(
          headers: {
            Headers.contentTypeHeader: "multipart/form-data",
            Headers.acceptHeader: "*/*",
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode! < 400 && response.statusCode! >= 200) {
        return right(true);
      }
      return left(UploadSampleImageFailure());
    } catch (e) {
      return left(UploadSampleImageFailure());
    }
  }
}
