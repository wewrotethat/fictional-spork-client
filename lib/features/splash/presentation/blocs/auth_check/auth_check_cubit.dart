import 'package:fictional_spork/features/auth/ioc/ioc.dart';
import 'package:fictional_spork/features/splash/presentation/blocs/auth_check/auth_check.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCheckCubit extends Cubit<AuthCheckState> {
  AuthCheckCubit() : super(AuthCheckInitialState());
  final _authCheckRepo = AuthenticationIoc.authCheckRepo;

  Future<void> check() async {
    try {
      emit(AuthCheckInProgressState());
      final loggedIn = await _authCheckRepo.isLoggedIn();
      emit(AuthCheckCompletedState(loggedIn: loggedIn));
    } catch (e) {
      emit(AuthCheckFailedState());
    }
  }
}
