import 'package:chat_app/features/auth/domain/models/verify_response/verify_response.dart';
import 'package:chat_app/features/auth/domain/repositores/auth_repositories.dart';
import 'package:chat_app/shared/api/endpoint/api_endpoints.dart';
import 'package:chat_app/shared/api/network/network.dart';
import 'package:chat_app/shared/app/helper.dart';
import 'package:chat_app/shared/utilities/auth/auth_utils.dart';
import 'package:chat_app/shared/utilities/failures/result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:japx/japx.dart';

@LazySingleton(as: AuthRepositories)
class AuthService implements AuthRepositories {
  @override
  Future<ResponseResult> sendOTP(String phone) async {
    try {
      final res = await NetworkProvider().post(
        ApiEndpoints.phoneLogin,
        data: {
          'data': {
            'type': 'registration_otp_codes',
            'attributes': {'phone': "+91$phone"},
          },
        },
      );
      switch (res.statusCode) {
        case 200:
          final responseData = parseResponse(res.data);
          return ResponseResult(data: responseData);
        case 422:
          final errorMessage = errorMapping(res);
          throw ValidationException(errorMessage);
        default:
          throw Exception('${res.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        final errorMessage = errorMapping(e.response);
        throw ValidationException(errorMessage);
      }
      rethrow;
    }
  }

  @override
  Future<ResponseResult<VerifyResponse>> verifyOTP(
    String otp,
    String phoneNumber,
  ) async {
    try {
      final deviceMeta = await Helper.getDeviceMeta();
      final res = await NetworkProvider().post(
        ApiEndpoints.verifyOTP,
        data: {
          'data': {
            'type': 'registration_otp_codes',
            'attributes': {
              'phone': "+91$phoneNumber",
              'otp': int.parse(otp),
              'device_meta': deviceMeta,
            },
          },
        },
      );

      switch (res.statusCode) {
        case 200:
        case 201:
          final parsedData = Japx.decode(res.data);
          try {
            final userResponse = VerifyResponse.fromJson(parsedData);
            final japxData = parsedData['data'] as Map<String, dynamic>;
            String? directAccessToken;
            if (japxData['auth_status'] != null) {
              final authStatusMap =
                  japxData['auth_status'] as Map<String, dynamic>;
              directAccessToken = authStatusMap['access_token'];
            }

            directAccessToken ??= japxData['access_token'];
            if (directAccessToken != null && directAccessToken.isNotEmpty) {
              await AuthUtils.instance.writeAccessTokens(directAccessToken);
            }

            return ResponseResult(data: userResponse);
          } catch (modelError) {
            rethrow;
          }

        case 422:
          final errorMessage = errorMapping(res);
          throw ValidationException(errorMessage);
        default:
          throw Exception('Unexpected status code: ${res.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
