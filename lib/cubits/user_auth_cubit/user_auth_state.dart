part of 'user_auth_cubit.dart';

@immutable
sealed class UserAuthState {}

final class UploadImageState extends UserAuthState {}

final class UserAuthInitial extends UserAuthState {}

final class SignupLoadingState extends UserAuthState {}

final class SignupSuccessState extends UserAuthState {
  final UserModel userModel;
  SignupSuccessState({required this.userModel});
}

final class SignupFailureState extends UserAuthState {
  final String error;
  SignupFailureState({required this.error});
}

final class LoginLoadingState extends UserAuthState {}

final class LoginSuccessState extends UserAuthState {
  final UserModel userModel;
  LoginSuccessState({required this.userModel});
}

final class LoginFailureState extends UserAuthState {
  final String error;
  LoginFailureState({required this.error});
}
