import 'package:fictional_spork/features/create_test_entry/ioc/create_test_entry_ioc.dart';
import 'package:fictional_spork/features/create_test_entry/presentation/blocs/create_test_entry/create_test_entry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTestEntryCubit extends Cubit<CreateTestEntryState> {
  CreateTestEntryCubit() : super(CreateTestEntryInitialState());

  Future<void> create(String id) async {
    emit(CreateTestEntryProgressState());
    final result = await CreateTestEntryIoc.createTestEntryRepo.create(id);

    result.fold(
      (l) => emit(
        CreateTestEntryErrorState(error: l.error),
      ),
      (r) {
        emit(CreateTestEntryCompletedState(id: r));
      },
    );
  }
}
