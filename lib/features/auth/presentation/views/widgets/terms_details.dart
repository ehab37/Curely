import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TermsDetails extends StatelessWidget {
  const TermsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr('terms_and_conditions_text'),
      style: TextStyle(
        fontSize: 14.0,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
