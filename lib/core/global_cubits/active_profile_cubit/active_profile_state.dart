part of 'active_profile_cubit.dart';

@immutable
sealed class ActiveProfileState {
  final String profileId;
  final String profileName;

  const ActiveProfileState({
    required this.profileId,
    required this.profileName,
  });
}

final class ActiveProfileInitial extends ActiveProfileState {
  const ActiveProfileInitial({
    required super.profileId,
    required super.profileName,
  });
}

final class ActiveProfileChanged extends ActiveProfileState {
  const ActiveProfileChanged({
    required super.profileId,
    required super.profileName,
  });
}
