import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/features/welcome/presentation/cubits/language_cubit.dart';
import 'package:curely/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_transitions/go_transitions.dart';
import 'constants.dart';
import 'core/utils/observer.dart';
import 'firebase_options.dart';

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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(create: (context) => LanguageCubit(), child: const Curely()),
  );
}

class Curely extends StatelessWidget {
  const Curely({super.key});

  @override
  Widget build(BuildContext context) {
    GoTransition.defaultCurve = Curves.easeInOut;
    GoTransition.defaultDuration = kTransitionDuration;
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        final TextDirection textDirection = locale.languageCode == kArabic
            ? TextDirection.rtl
            : TextDirection.ltr;
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
          locale: locale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routerConfig: AppRouter.router,
          builder: (context, child) =>
              Directionality(textDirection: textDirection, child: child!),
        );
      },
    );
  }
}
