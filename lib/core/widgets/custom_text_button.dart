import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextButton(
          onPressed: () {},
          child: Text("Skip", style: Styles.style28,textAlign: TextAlign.start,),
        ),
      ),
    );
  }
}