import 'package:curely/constants.dart';
import 'package:curely/features/auth/presentation/views/widgets/terms_and_conditions_body.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        backgroundColor: kNavyColor,
        foregroundColor: Colors.white,
      ),
      body: TermsAndConditionsBody(),
    );
  }
}
