import 'package:fictional_spork/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetLabTestEntryCubit extends Cubit<GetLabTestEntryState> {
  GetLabTestEntryCubit() : super(GetLabTestEntryInitial());

  Future<void> getLabTestEntry(String id) async {
    emit(GetLabTestEntryLoading());
    try {
      final result = await TestEntryDetailIoc.getTestEntryRepo.get(id);
      result.fold(
        (failure) => emit(GetLabTestEntryFailure()),
        (entry) => emit(GetLabTestEntrySuccess(entry)),
      );
    } catch (e) {
      emit(GetLabTestEntryFailure());
    }
  }
}
