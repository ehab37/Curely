import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.authRepo}) : super(ResetPasswordInitial());
  final AuthRepo authRepo;

  void resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    final result = await authRepo.resetPassword(email: email);
    result.fold(
      (l) => emit(ResetPasswordFailure(errMessage: l.errMessage)),
      (r) => emit(ResetPasswordSuccess()),
    );
  }
}
