import 'package:flutter/material.dart';
import 'widgets/add_rays_view_body.dart';

class AddRaysView extends StatelessWidget {
  const AddRaysView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AddRaysViewBody()));
  }
}
