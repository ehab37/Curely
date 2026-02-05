import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_user_state.dart';

class LogoutUserCubit extends Cubit<LogoutUserState> {
  LogoutUserCubit({required this.authRepo}) : super(LogoutUserInitial());
  AuthRepo authRepo;

  Future<void> logoutUser() async {
    emit(LogoutUserLoading());
    final result = await authRepo.logoutUser();
    result.fold(
      (l) => emit(LogoutUserFailure(errMessage: l.errMessage)),
      (r) => emit(LogoutUserSuccess()),
    );
  }
}
