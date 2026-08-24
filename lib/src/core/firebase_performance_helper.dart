import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';

class FirebasePerformanceHelper {
  static final FirebasePerformance _performance = FirebasePerformance.instance;
  static final Map<String, Trace> _activeTraces = {};

  /// Starts a custom performance trace
  static Future<void> startTrace(final String traceName) async {
    try {
      if (_activeTraces.containsKey(traceName)) {
        if (kDebugMode) {
          debugPrint('⚡ [Performance] Trace "$traceName" is already running.');
        }
        return;
      }
      final trace = _performance.newTrace(traceName);
      await trace.start();
      _activeTraces[traceName] = trace;
      if (kDebugMode) {
        debugPrint('⚡ [Performance] Started Trace: "$traceName"');
      }
    } catch (e) {
      debugPrint('❌ [Performance] Error starting trace "$traceName": $e');
    }
  }

  /// Stops a custom performance trace
  static Future<void> stopTrace(final String traceName) async {
    try {
      final trace = _activeTraces.remove(traceName);
      if (trace == null) {
        if (kDebugMode) {
          debugPrint(
            '⚡ [Performance] Trace "$traceName" not found or already stopped.',
          );
        }
        return;
      }
      await trace.stop();
      if (kDebugMode) {
        debugPrint('⚡ [Performance] Stopped Trace: "$traceName"');
      }
    } catch (e) {
      debugPrint('❌ [Performance] Error stopping trace "$traceName": $e');
    }
  }

  /// Measures execution of an asynchronous operation
  static Future<T> traceFuture<T>({
    required final String traceName,
    required final Future<T> Function() action,
  }) async {
    await startTrace(traceName);
    try {
      return await action();
    } finally {
      await stopTrace(traceName);
    }
  }
}
