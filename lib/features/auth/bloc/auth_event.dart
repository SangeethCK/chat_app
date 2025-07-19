part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SigInEvent extends AuthEvent {
  final String phone;
  const SigInEvent(this.phone);
}

class VerifyOtpEvent extends AuthEvent {
  final String? mobile;
  final String? otp;
  const VerifyOtpEvent({this.mobile, this.otp});
}

class SendOtpEvent extends AuthEvent {
  final String mobile;

  const SendOtpEvent({required this.mobile});

  @override
  List<Object> get props => [mobile];
}
