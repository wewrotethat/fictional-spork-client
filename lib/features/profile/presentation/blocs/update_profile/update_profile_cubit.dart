import 'package:fictional_spork/core/domain/value_objects/value_objects.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/profile/presentation/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  Future<void> updateProfile(
      UpdateUserValueObject updateUserValueObject) async {
    emit(UpdateProfileInProgress());
    try {
      final result =
          await CoreFeaturesIoc.userRepo.updateUser(updateUserValueObject);
      result.fold(
        (l) => emit(UpdateProfileFailure(error: l.error)),
        (r) => emit(UpdateProfileSuccess()),
      );
    } catch (e) {
      emit(UpdateProfileFailure());
    }
  }
}
