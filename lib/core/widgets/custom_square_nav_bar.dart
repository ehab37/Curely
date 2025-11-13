import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSquareNavBar extends StatelessWidget {
  const CustomSquareNavBar({
    super.key,
    required this.text,
    required this.onTab,
  });

  final String text;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTab,
        child: Container(
          margin: EdgeInsets.all(6),
          padding: EdgeInsets.all(8),
          alignment: AlignmentDirectional.center,
          height: MediaQuery.of(context).size.height / 4.2,
          decoration: BoxDecoration(
            color: kLightGrayColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: kNavyColor,size: 28,),
              const SizedBox(height: 6),
              Text(
                text,
                style: Styles.styleBlue20,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
