import 'package:flutter/material.dart';
import 'widgets/add_medicine_view_body.dart';

class AddMedicineView extends StatelessWidget {
  const AddMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AddMedicineViewBody()));
  }
}
