import 'package:curely/features/home/domain/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_user_state.dart';

class LogoutUserCubit extends Cubit<LogoutUserState> {
  LogoutUserCubit({required this.homeRepo}) : super(LogoutUserInitial());
  HomeRepo homeRepo;

  Future<void> logoutUser() async {
    emit(LogoutUserLoading());
    final result = await homeRepo.logoutUser();
    result.fold(
      (l) => emit(LogoutUserFailure(errMessage: l.errMessage)),
      (r) => emit(LogoutUserSuccess()),
    );
  }
}
