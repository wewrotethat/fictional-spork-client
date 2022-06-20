import 'package:fictional_spork/features/test_entry_detail/ioc/ioc.dart';
import 'package:fictional_spork/features/test_entry_detail/presentation/bloc/upload_sample_image/upload_sample_image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadSampleImageCubit extends Cubit<UploadSampleImageState> {
  UploadSampleImageCubit() : super(UploadSampleImageInitial());

  Future<void> upload(String id, String filePath) async {
    emit(UploadSampleImageLoading());
    final result =
        await TestEntryDetailIoc.uploadSampleImageRepo.upload(id, filePath);

    result.fold((l) => emit(UploadSampleImageFailure()), (r) {
      if (r) {
        emit(UploadSampleImageSuccess());
      } else {
        emit(UploadSampleImageFailure());
      }
    });
  }
}
