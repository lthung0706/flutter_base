import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:retry/retry.dart';
import 'package:flutter_base/src/authentication/view/authentication_page.dart';

import 'local_notifications_service.dart';

class FirebaseMessagingService {
  FirebaseMessagingService._internal();

  static final FirebaseMessagingService _instance =
      FirebaseMessagingService._internal();

  factory FirebaseMessagingService.instance() => _instance;

  LocalNotificationsService? _localNotificationsService;

  /// Initialize Firebase Messaging and sets up all message listeners
  Future<void> init({
    required LocalNotificationsService localNotificationsService,
  }) async {
    _localNotificationsService = localNotificationsService;

    _handlePushNotificationsToken();
    _requestPermission();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _onMessageOpenedApp(initialMessage);
    }
  }

  /// Retrieves and manages the FCM token for push notifications
  Future<void> _handlePushNotificationsToken() async {
    try {
      if (Platform.isIOS) {
        await retry(
          () async {
            final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
            if (apnsToken == null) {
              throw Exception('APNS token not yet available');
            }
          },
          maxDelay: const Duration(seconds: 2),
          maxAttempts: 5,
        );
      }

      final token = await retry(
        () => FirebaseMessaging.instance.getToken(),
        maxDelay: const Duration(seconds: 2),
        maxAttempts: 3,
      );

      AuthenticationPage.deviceId = token ?? 'EMPTY';
    } catch (e) {
      AuthenticationPage.deviceId = 'EMPTY';
    }

    FirebaseMessaging.instance.onTokenRefresh
        .listen((fcmToken) {
          AuthenticationPage.deviceId = fcmToken;
        })
        .onError((error) {});
  }

  /// Requests notification permission from the user
  Future<void> _requestPermission() async {
    final result = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    debugPrint('User granted notification permission: ${result.authorizationStatus}');
  }

  /// Handles messages received while the app is in the foreground
  Future<void> _onForegroundMessage(RemoteMessage message) async {
    final notificationData = message.notification;
    if (notificationData != null) {
      _localNotificationsService?.showNotification(
        notificationData.title,
        notificationData.body,
        message.data.toString(),
      );
    }
  }

  /// Handles notification taps when app is opened from the background or terminated state
  void _onMessageOpenedApp(RemoteMessage message) {
    debugPrint('Message opened app: ${message.data.toString()}');
  }
}

/// Background message handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Background message received: ${message.data.toString()}');
}
