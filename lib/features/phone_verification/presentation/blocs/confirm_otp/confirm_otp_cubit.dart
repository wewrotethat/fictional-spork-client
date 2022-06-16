import 'package:fictional_spork/features/phone_verification/ioc/ioc.dart';
import 'package:fictional_spork/features/phone_verification/presentation/blocs/confirm_otp/confirm_otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmOtpCubit extends Cubit<ConfirmOtpState> {
  ConfirmOtpCubit() : super(ConfirmOtpInitial());

  Future<void> verifyOtp(String otp) async {
    emit(ConfirmOtpLoading());
    try {
      final result =
          await PhoneVerificationIoc.phoneVerificationRepo.verifyOtp(otp);
      result.fold(
        (failure) => emit(ConfirmOtpFailure()),
        (success) => emit(ConfirmOtpSuccess()),
      );
    } catch (e) {
      emit(ConfirmOtpFailure());
    }
  }
}
