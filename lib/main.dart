import 'package:curely/features/welcome/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Curely());
}
class Curely extends StatelessWidget {
  const Curely({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
