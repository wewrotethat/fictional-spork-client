import 'package:fictional_spork/features/auth/helpers/helpers.dart';
import 'package:fictional_spork/features/phone_verification/ioc/ioc.dart';
import 'package:fictional_spork/features/phone_verification/presentation/blocs/get_otp/get_otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOtpCubit extends Cubit<GetOtpState> {
  GetOtpCubit() : super(GetOtpInitial());

  Future<void> getOtp() async {
    emit(GetOtpLoading());
    try {
      final result = await PhoneVerificationIoc.phoneVerificationRepo.getOtp();
      result.fold(
        (failure) => emit(GetOtpFailure()),
        (success) => emit(GetOtpSuccess()),
      );
    } catch (e) {
      emit(GetOtpFailure());
    }
  }
}
