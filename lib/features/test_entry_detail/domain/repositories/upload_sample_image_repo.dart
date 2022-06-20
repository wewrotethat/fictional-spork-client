import 'package:dartz/dartz.dart';

abstract class UploadSampleImageRepo {
  Future<Either<UploadSampleImageFailure, bool>> upload(
    String id,
    String filePath,
  );
}

class UploadSampleImageFailure {}
