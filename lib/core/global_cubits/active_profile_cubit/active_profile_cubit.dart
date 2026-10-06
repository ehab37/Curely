import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'active_profile_state.dart';

class ActiveProfileCubit extends Cubit<ActiveProfileState> {
  final UserDataRepo userDataRepo;

  ActiveProfileCubit({required this.userDataRepo})
    : super(
        ActiveProfileInitial(
          profileId: userDataRepo.getUserDataLocally().uId,
          profileName: userDataRepo.getUserDataLocally().name,
        ),
      );

  String get activeProfileId => state.profileId;

  bool get isOwnerActive =>
      activeProfileId == userDataRepo.getUserDataLocally().uId;

  void switchProfile({required String id, required String name}) {
    emit(ActiveProfileChanged(profileId: id, profileName: name));
  }

  void resetToOwner() {
    final owner = userDataRepo.getUserDataLocally();
    emit(ActiveProfileInitial(profileId: owner.uId, profileName: owner.name));
  }
}
