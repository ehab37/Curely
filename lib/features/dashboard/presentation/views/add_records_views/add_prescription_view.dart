import 'package:flutter/material.dart';
import 'widgets/add_prescription_view_body.dart';

class AddPrescriptionView extends StatelessWidget {
  const AddPrescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AddPrescriptionViewBody()));
  }
}
