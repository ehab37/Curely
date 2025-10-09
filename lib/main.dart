import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/cache_helper.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_transitions/go_transitions.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const Curely());
}

class Curely extends StatelessWidget {
  const Curely({super.key});

  @override
  Widget build(BuildContext context) {
    GoTransition.defaultCurve = Curves.easeInOut;
    GoTransition.defaultDuration = kTransitionDuration;
    bool isArabic = CacheHelper.getData(key: kIsArabic);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        textTheme: Theme.of(context).textTheme.apply(fontSizeFactor: 1),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: GoTransitions.fade,
            TargetPlatform.iOS: GoTransitions.cupertino,
            TargetPlatform.macOS: GoTransitions.cupertino,
          },
        ),
      ),
      locale: isArabic ? Locale("ar") : Locale("en"),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: AppRouter.router,
    );
  }
}
