import 'package:app_config/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_base/firebase_options.dart';
import 'package:flutter_base/src/core/firebase_crashlytics_helper.dart';
import 'package:flutter_base/src/core/hive_service_helper.dart';
import 'package:flutter_base/src/module/injector.dart';
import 'package:flutter_base/src/presentation/app/view/global_app_view.dart';

import 'src/core/services/firebase_messaging_service.dart';
import 'src/core/services/local_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppFlavor.appFlavor = Flavor.sandbox;

  // Initialize Firebase
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    final localNotificationsService = LocalNotificationsService.instance();
    await localNotificationsService.init();

    final firebaseMessagingService = FirebaseMessagingService.instance();
    await firebaseMessagingService.init(
      localNotificationsService: localNotificationsService,
    );
  } catch (e) {
    debugPrint('Firebase init error (dev): $e');
  }

  // Initialize Environment Config (.env)
  await AppConfig.init(environment: Environment.sandbox);

  // Configure DI
  configureDependencies();

  final hive = getIt<HiveServiceHelper>();
  await hive.init();
  await hive.initAssets();

  FlutterError.onError = (final details) {
    FirebaseCrashlyticsHelper.recordError(
      details.exceptionAsString(),
      details.stack,
    );
    debugPrint(details.exceptionAsString());
  };
  PlatformDispatcher.instance.onError = (final error, final stack) {
    FirebaseCrashlyticsHelper.recordError('$error', stack);
    debugPrint(error.toString());
    return true;
  };

  try {
    await getIt<SupabaseNetwork>().supabaseProvider.init();
  } catch (e) {
    debugPrint('Supabase init error (dev): $e');
  }

  runApp(const GlobalAppPage());
}
