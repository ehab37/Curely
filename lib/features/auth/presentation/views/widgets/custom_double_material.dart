import 'package:curely/constants.dart';
import 'package:flutter/material.dart';

class CustomDoubleMaterial extends StatelessWidget {
  const CustomDoubleMaterial({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Material(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Material(
            color: Colors.white,
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(kHorizontalPadding),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
