import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Theme.of(context).primaryColor)),
        Text(
          " ${context.tr("or")} ",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(child: Divider(color: Theme.of(context).primaryColor)),
      ],
    );
  }
}
