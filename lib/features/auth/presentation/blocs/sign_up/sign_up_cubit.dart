import 'package:fictional_spork/core/domain/value_objects/value_objects.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/presentation/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());
  final _userRepo = CoreFeaturesIoc.userRepo;

  Future<void> signUp(CreateUserValueObject createUserValueObject) async {
    emit(SignUpProgressState());
    final result = await _userRepo.createUser(createUserValueObject);
    result.fold(
      (l) => emit(
        SignUpErrorState(error: l.error),
      ),
      (user) => emit(SignUpCompletedState(user: user)),
    );
  }
}
