import 'package:curely/features/welcome/presentation/views/widgets/language_view_body.dart';
import 'package:flutter/material.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LanguageViewBody(),
    );
  }
}
