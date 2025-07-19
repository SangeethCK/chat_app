import 'package:chat_app/features/auth/domain/models/verify_response/verify_response.dart';
import 'package:chat_app/shared/utilities/failures/result.dart';

abstract class AuthRepositories {
  Future<ResponseResult<dynamic>> sendOTP(String phone);
  Future<ResponseResult<VerifyResponse>> verifyOTP(
    String otp,
    String phoneNumber,
  );
}
