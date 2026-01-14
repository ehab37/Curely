import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    final result = await authRepo.createAccount(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (l) => emit(RegisterFailure(errMessage: l.errMessage)),
      (r) => emit(RegisterSuccess(userEntity: r)),
    );
  }
}
