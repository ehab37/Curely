import 'package:curely/features/auth/presentation/views/widgets/terms_and_conditions_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          context.tr('terms_and_conditions'),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      body: const TermsAndConditionsBody(),
    );
  }
}
