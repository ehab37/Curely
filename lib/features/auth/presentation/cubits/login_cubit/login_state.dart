part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserEntity userEntity;

  LoginSuccess({required this.userEntity});
}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}
