import 'package:fictional_spork/features/create_test_entry/presentation/blocs/create_test_entry/create_test_entry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTestEntryCubit extends Cubit<CreateTestEntryState> {
  CreateTestEntryCubit() : super(CreateTestEntryInitialState());

  Future<void> create() async {}
}
