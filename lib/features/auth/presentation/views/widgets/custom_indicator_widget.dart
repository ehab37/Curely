import 'package:curely/constants.dart';
import 'package:flutter/material.dart';

class CustomIndicatorWidget extends StatelessWidget {
  const CustomIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      width: 40,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: CircularProgressIndicator(
          strokeWidth: 3.5,
          color: kNavyColor,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
