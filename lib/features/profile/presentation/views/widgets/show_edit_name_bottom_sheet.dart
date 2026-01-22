import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/features/profile/presentation/cubits/edit_profile_cubit.dart';
import 'package:curely/features/profile/presentation/views/widgets/update_details_bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showUpdateDetailsBottomSheet(
  BuildContext context,
  UserEntity user,
  EditProfileCubit cubit,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (bottomSheetContext) {
      return BlocProvider.value(
        value: cubit,
        child: UpdateDetailsBottomSheetBody(user: user),
      );
    },
  );
}
