import 'package:flutter/material.dart';
import 'widgets/add_analysis_view_body.dart';

class AddAnalysisView extends StatelessWidget {
  const AddAnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AddAnalysisViewBody()));
  }
}
