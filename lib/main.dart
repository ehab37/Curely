import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/global_cubits/theme_cubit/theme_cubit.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/services/local_notifications_service.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/features/welcome/presentation/cubits/language_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart' as lz;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'core/utils/observer.dart';
import 'curely.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await lz.EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  tz.initializeTimeZones();
  await LocalNotificationsService.initNotification();
  await CacheHelper.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: DatabaseConstants.supabaseUrl,
    publishableKey: DatabaseConstants.supabasePublishableKey,
  );
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => lz.EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: AssetsConstants.kTranslations,
        fallbackLocale: const Locale('en'),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<LanguageCubit>()),
            BlocProvider(create: (context) => getIt<ThemeCubit>()),
          ],
          child: const Curely(),
        ),
      ),
    ),
  );
}
