part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final ApiFetchStatus? isSignIn;
  final ApiFetchStatus? isVerify;
  final VerifyResponse? verifyResponse;
  const AuthState({
    this.isSignIn = ApiFetchStatus.idle,
    this.isVerify = ApiFetchStatus.idle,
    this.verifyResponse,
  });

  AuthState copyWith({
    ApiFetchStatus? isSignIn,
    ApiFetchStatus? isVerify,
    VerifyResponse? verifyResponse,
    bool isMakeItNull = false,
  }) => AuthState(
    isSignIn: isSignIn ?? this.isSignIn,
    isVerify: isMakeItNull ? null : isVerify ?? this.isVerify,
    verifyResponse: isMakeItNull ? null : verifyResponse ?? this.verifyResponse,
  );
  @override
  List<Object?> get props => [isSignIn, isVerify, verifyResponse];
}

class InitialAuthState extends AuthState {}
