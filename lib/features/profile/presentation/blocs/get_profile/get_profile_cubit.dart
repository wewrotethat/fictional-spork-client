import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/profile/presentation/blocs/get_profile/get_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit() : super(GetProfileInitial());

  Future<void> get() async {
    emit(GetProfileLoading());
    try {
      final result = await CoreFeaturesIoc.userRepo.getUser();
      result.fold(
        (l) => emit(GetProfileFailure()),
        (r) => emit(GetProfileSuccess(user: r)),
      );
    } catch (e) {
      emit(GetProfileFailure());
    }
  }
}
