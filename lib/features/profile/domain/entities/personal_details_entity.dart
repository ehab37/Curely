import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helpers/calculate_age.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PersonalDetailsEntity {
  final String title, subTitle;
  final IconData icon;

  PersonalDetailsEntity({
    required this.title,
    required this.subTitle,
    required this.icon,
  });
}

List<PersonalDetailsEntity> personalDetailsList(
  BuildContext context,
  UserEntity user,
) {
  final int? age = calculateAge(user.dateOfBirth);
  return [
    PersonalDetailsEntity(
      title: "blood",
      subTitle: user.blood == null || user.blood!.isEmpty
          ? context.tr("tbd")
          : user.blood!,
      icon: Icons.water_drop_outlined,
    ),
    PersonalDetailsEntity(
      title: "height",
      subTitle: "${user.height ?? context.tr("tbd")} ${context.tr("cm")}",
      icon: Icons.height,
    ),
    PersonalDetailsEntity(
      title: "weight",
      subTitle: "${user.weight ?? context.tr("tbd")} ${context.tr("kg")}",
      icon: Icons.monitor_weight_outlined,
    ),
    PersonalDetailsEntity(
      title: "age",
      subTitle: "${age ?? context.tr("tbd")} ${context.tr("years")}",
      icon: Icons.cake_outlined,
    ),
  ];
}
