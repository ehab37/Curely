import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/features/profile/domain/entities/personal_details_entity.dart';
import 'package:flutter/material.dart';
import 'personal_detail_widget.dart';

class PersonalDetailsGridView extends StatelessWidget {
  const PersonalDetailsGridView({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: personalDetailsList(context, user).length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2.1 / 1,
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => PersonalDetailWidget(
        personalDetailsEntity: personalDetailsList(context, user)[index],
      ),
    );
  }
}
