part of 'logout_user_cubit.dart';

@immutable
sealed class LogoutUserState {}

final class LogoutUserInitial extends LogoutUserState {}

final class LogoutUserLoading extends LogoutUserState {}

final class LogoutUserSuccess extends LogoutUserState {}

final class LogoutUserFailure extends LogoutUserState {
  final String errMessage;

  LogoutUserFailure({required this.errMessage});
}
