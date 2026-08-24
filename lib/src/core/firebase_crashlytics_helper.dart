// Flutter imports:
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// Project imports:

export 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  final RemoteMessage message,
) async {
  //  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class FirebaseCrashlyticsHelper {
  static Future<void> init({final bool isDebug = false}) async {
    if (!kIsWeb) {
      await Firebase.initializeApp();
      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
      // see reports while in debug mode
      return FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        !isDebug,
      );
    }
  }

  static Future<void> recordError(
    final dynamic exception,
    final StackTrace? stack,
  ) {
    if (!kIsWeb) {
      return FirebaseCrashlytics.instance.recordError(
        exception,
        stack,
        fatal: true,
      );
    }

    return Future.value();
  }
}
