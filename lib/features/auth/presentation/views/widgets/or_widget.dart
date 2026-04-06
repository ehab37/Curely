import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Theme.of(context).primaryColor)),
        Text(
          " ${S.of(context).or} ",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(child: Divider(color: Theme.of(context).primaryColor)),
      ],
    );
  }
}
