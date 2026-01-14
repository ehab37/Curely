import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await authRepo.loginUser(email: email, password: password);
    result.fold(
      (l) => emit(LoginFailure(errMessage: l.errMessage)),
      (r) => emit(LoginSuccess(userEntity: r)),
    );
  }
  loginUserWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.loginUserWithGoogle();
    result.fold(
      (l) => emit(LoginFailure(errMessage: l.errMessage)),
      (r) => emit(LoginSuccess(userEntity: r)),
    );
  }
}
