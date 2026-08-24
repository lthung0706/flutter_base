import 'package:app_config/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:report_person/firebase_options.dart';
import 'package:report_person/src/core/firebase_crashlytics_helper.dart';
import 'package:report_person/src/core/hive_service_helper.dart';
import 'package:report_person/src/module/injector.dart';
import 'package:report_person/src/presentation/app/view/global_app_view.dart';

import 'src/core/services/firebase_messaging_service.dart';
import 'src/core/services/local_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppFlavor.appFlavor = Flavor.production;

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
    debugPrint('Firebase init error (prod): $e');
  }

  // Configure DI
  configureDependencies();

  final hive = getIt<HiveServiceHelper>();
  await hive.init();
  await hive.initAssets();

  await AppConfig.init(environment: Environment.production);

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
    getIt<GrpcNetwork>().grpcProvider.init();
  } catch (_) {}

  try {
    await getIt<SupabaseNetwork>().supabaseProvider.init();
  } catch (e) {
    debugPrint('Supabase init error (prod): $e');
  }

  runApp(const GlobalAppPage());
}
