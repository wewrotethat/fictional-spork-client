import 'package:fictional_spork/features/home/ioc/home_ioc.dart';
import 'package:fictional_spork/features/home/presentation/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetTestEntriesCubit extends Cubit<GetTestEntriesState> {
  GetTestEntriesCubit() : super(GetTestEntriesInitial());

  Future<void> get() async {
    emit(GetTestEntriesLoading());
    final result = await HomeIoc.getLabTestEntriesRepo.get();
    emit(result.fold(
      (failure) => GetTestEntriesError(),
      (testEntries) => GetTestEntriesLoaded(testEntries: testEntries),
    ));
  }
}
