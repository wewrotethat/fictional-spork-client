import 'package:fictional_spork/features/auth/domain/value_objects/value_objects.dart';
import 'package:fictional_spork/features/auth/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/presentation/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  final _authRepo = AuthenticationIoc.authRepo;

  Future<void> login(
      AuthenticationValueObject authenticationValueObject) async {
    emit(LoginProgressState());
    final result = await _authRepo.authenticate(authenticationValueObject);
    result.fold(
      (l) => emit(
        LoginErrorState(
          error: l.error,
        ),
      ),
      (authenticationResponse) => emit(
        LoginCompletedState(
          authenticationResponse: authenticationResponse,
        ),
      ),
    );
  }
}
