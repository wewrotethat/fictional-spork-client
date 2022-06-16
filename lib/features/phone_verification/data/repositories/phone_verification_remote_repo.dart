import 'package:dartz/dartz.dart';
import 'package:fictional_spork/core/ioc/ioc.dart';
import 'package:fictional_spork/features/auth/helpers/helpers.dart';
import 'package:fictional_spork/features/phone_verification/domain/repositories/phone_verification_repo.dart';

class PhoneVerificationRemoteRepo extends PhoneVerficationRepo {
  static const _baseUrl = String.fromEnvironment('API_BASE_URL');
  final _httpHelper = IntegrationIoc.httpHelper;

  @override
  Future<Either<PhoneVerificationFailure, bool>> getOtp() async {
    try {
      final token = await TokenHelper.get();
      final response = await _httpHelper.get(
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        url: '$_baseUrl/users/otp',
      );

      if (response.isOk) {
        return right(true);
      }
      return left(
        PhoneVerificationFailure(),
      );
    } catch (e) {
      return left(
        PhoneVerificationFailure(),
      );
    }
  }

  @override
  Future<Either<PhoneVerificationFailure, bool>> verifyOtp(String otp) async {
    try {
      final token = await TokenHelper.get();
      final response = await _httpHelper.post(
        data: {
          'otp': otp,
        },
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        url: '$_baseUrl/users/otp',
      );

      if (response.isOk) {
        return right(true);
      }
      return left(
        PhoneVerificationFailure(),
      );
    } catch (e) {
      return left(
        PhoneVerificationFailure(),
      );
    }
  }
}
