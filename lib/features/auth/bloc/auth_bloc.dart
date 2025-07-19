import 'package:bloc/bloc.dart';
import 'package:chat_app/features/auth/domain/models/verify_response/verify_response.dart';
import 'package:chat_app/features/auth/domain/repositores/auth_repositories.dart';
import 'package:chat_app/shared/app/enums/api_fetch_status.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositories _authRepositories;
  AuthBloc(this._authRepositories) : super(InitialAuthState()) {
    on<SigInEvent>(_signIn);
    on<VerifyOtpEvent>(_verifyOTP);
  }
  //=-=-=-=-=-= SIGNIN =-=-=-=-=-=-=
  Future<void> _signIn(SigInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isSignIn: ApiFetchStatus.loading));
      final res = await _authRepositories.sendOTP(event.phone);

      if (res.data != null) {
        emit(state.copyWith(isSignIn: ApiFetchStatus.success));
      }
      emit(state.copyWith(isSignIn: ApiFetchStatus.failed));
    } catch (e) {
      emit(state.copyWith(isSignIn: ApiFetchStatus.failed));
    }
  }
  //=-=-=-=-=-= OTP VERIFY =-=-=-=-=-=

  Future<void> _verifyOTP(VerifyOtpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isVerify: ApiFetchStatus.loading));
      final res = await _authRepositories.verifyOTP(
        event.otp ?? '',
        event.mobile ?? '',
      );
      if (res.data != null) {
        emit(
          state.copyWith(
            isVerify: ApiFetchStatus.success,
            verifyResponse: res.data,
          ),
        );
      }
      emit(state.copyWith(isVerify: ApiFetchStatus.idle));
    } catch (e) {
      emit(state.copyWith(isVerify: ApiFetchStatus.idle));
    }
  }
}
