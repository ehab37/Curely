import 'package:curely/constants.dart';
import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
    required this.languageName,
    required this.languageFlag,
    this.onTab,
    this.boxShadow,
    required this.backgroundColor,
    required this.style,
  });

  final String languageName;
  final String languageFlag;
  final void Function()? onTab;
  final List<BoxShadow>? boxShadow;
  final Color backgroundColor;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTab,
        child: AnimatedContainer(
          duration: kTransitionDuration,
          decoration: BoxDecoration(
            boxShadow: boxShadow,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(25),
          ),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 12),
              Image.asset(languageFlag, height: 70),
              Text(languageName, style: style),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
