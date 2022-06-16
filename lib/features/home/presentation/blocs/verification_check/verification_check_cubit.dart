import 'package:fictional_spork/features/auth/domain/repostitories/repostitories.dart';
import 'package:fictional_spork/features/auth/ioc/ioc.dart';
import 'package:fictional_spork/features/home/presentation/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCheckCubit extends Cubit<VerificationCheckState> {
  VerificationCheckCubit() : super(VerificationCheckInitialState());
  final _profileVerificationStatusRepo =
      AuthenticationIoc.verificationCheckRepo;

  Future<void> check() async {
    emit(VerificationCheckingState());
    final result =
        await _profileVerificationStatusRepo.checkProfileVerificationStatus();
    result.fold(
      (l) => emit(VerificationCheckFailureState()),
      (r) => emit(
        VerificationCheckedState(status: r),
      ),
    );
  }
}
