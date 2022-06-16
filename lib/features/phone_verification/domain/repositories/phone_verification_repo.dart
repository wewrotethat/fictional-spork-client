import 'package:dartz/dartz.dart';

abstract class PhoneVerficationRepo {
  Future<Either<PhoneVerificationFailure, bool>> getOtp();
  Future<Either<PhoneVerificationFailure, bool>> verifyOtp(String otp);
}

class PhoneVerificationFailure {}
