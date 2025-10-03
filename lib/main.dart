import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
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
