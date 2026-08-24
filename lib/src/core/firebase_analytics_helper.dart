import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class FirebaseAnalyticsHelper {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Safe event logger that works across platforms
  static Future<void> logEvent({
    required final String name,
    final Map<String, Object>? parameters,
  }) async {
    try {
      await _analytics.logEvent(name: name, parameters: parameters);
      if (kDebugMode) {
        debugPrint('📊 [Analytics] Event logged: $name, Params: $parameters');
      }
    } catch (e, stack) {
      debugPrint('❌ [Analytics] Error logging event: $e\n$stack');
    }
  }

  /// Sets the user identifier
  static Future<void> setUserId(final String? userId) async {
    try {
      await _analytics.setUserId(id: userId);
      if (kDebugMode) {
        debugPrint('📊 [Analytics] User ID set to: $userId');
      }
    } catch (e) {
      debugPrint('❌ [Analytics] Error setting User ID: $e');
    }
  }

  /// Sets user properties
  static Future<void> setUserProperty({
    required final String name,
    required final String? value,
  }) async {
    try {
      await _analytics.setUserProperty(name: name, value: value);
      if (kDebugMode) {
        debugPrint('📊 [Analytics] User Property set: $name = $value');
      }
    } catch (e) {
      debugPrint('❌ [Analytics] Error setting User Property: $e');
    }
  }

  /// Manually track screen views (useful when not using GoRouter observer)
  static Future<void> logScreenView({
    required final String screenName,
    final String? screenClass,
  }) async {
    try {
      await _analytics.logScreenView(
        screenName: screenName,
        screenClass: screenClass,
      );
      if (kDebugMode) {
        debugPrint('📊 [Analytics] Screen view: $screenName ($screenClass)');
      }
    } catch (e) {
      debugPrint('❌ [Analytics] Error logging screen view: $e');
    }
  }
}
