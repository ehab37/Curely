import 'package:curely/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Curely());
}
class Curely extends StatelessWidget {
  const Curely({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
