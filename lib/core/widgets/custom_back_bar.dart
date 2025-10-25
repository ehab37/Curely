import 'package:curely/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackBar extends StatelessWidget {
  const CustomBackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context).pop();
        },
        child: Icon(
          Icons.keyboard_backspace_rounded,
          size: 50,
          color: kNavyColor,
        ),
      ),
    );
  }
}
