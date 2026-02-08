import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/spacing.dart';
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
            color: AppColors.lightGray,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: AppColors.primary, size: 28),
              6.verticalSpacing,
              Text(
                text,
                style: Styles.styleBlue20,
                overflow: TextOverflow.ellipsis,
              ),
              12.verticalSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
