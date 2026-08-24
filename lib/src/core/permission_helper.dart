import 'dart:io';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

/// Comprehensive permission handling helper for managing all app permissions
///
/// This class provides a centralized way to:
/// - Request permissions
/// - Check permission status
/// - Handle permission rationale
/// - Navigate to app settings when permissions are permanently denied
/// - Handle platform-specific permission requirements
///
/// Usage:
/// ```dart
/// final helper = PermissionHelper();
/// final granted = await helper.requestCameraPermission();
/// if (granted) {
///   // Use camera
/// }
/// ```
class PermissionHelper {
  /// Singleton instance
  static final PermissionHelper _instance = PermissionHelper._internal();

  factory PermissionHelper() => _instance;

  PermissionHelper._internal();

  // ==================== CAMERA PERMISSION ====================

  /// Request camera permission
  ///
  /// Used for: Taking photos, recording videos, QR code scanning
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestCameraPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    return _requestPermission(
      Permission.camera,
      permissionName: 'Camera',
      rationale:
          rationale ?? 'Camera access is needed to take photos and videos.',
      context: context,
    );
  }

  /// Check camera permission status
  Future<PermissionStatus> checkCameraPermission() async {
    return await Permission.camera.status;
  }

  /// Check if camera permission is granted
  Future<bool> isCameraPermissionGranted() async {
    final status = await checkCameraPermission();
    return status.isGranted;
  }

  // ==================== LOCATION PERMISSIONS ====================

  /// Request location permission (when in use)
  ///
  /// Used for: Getting current location, showing user position on map
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestLocationPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    return _requestPermission(
      Permission.location,
      permissionName: 'Location',
      rationale:
          rationale ??
          'Location access is needed to show your position and nearby places.',
      context: context,
    );
  }

  /// Request location permission (always)
  ///
  /// Used for: Background location tracking, geofencing
  /// Note: This is a sensitive permission and should only be requested when absolutely necessary
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestLocationAlwaysPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    // First request when-in-use permission
    final whenInUseGranted = await requestLocationPermission(
      rationale: rationale,
      context: context,
    );

    if (!whenInUseGranted) {
      return false;
    }
    if (context != null && !context.mounted) {
      return false;
    }

    // Then request always permission
    return _requestPermission(
      Permission.locationAlways,
      permissionName: 'Location (Always)',
      rationale:
          rationale ??
          'Background location access is needed for continuous tracking.',
      context: context,
    );
  }

  /// Check location permission status
  Future<PermissionStatus> checkLocationPermission() async {
    return await Permission.location.status;
  }

  /// Check if location permission is granted
  Future<bool> isLocationPermissionGranted() async {
    final status = await checkLocationPermission();
    return status.isGranted;
  }

  // ==================== MICROPHONE PERMISSION ====================

  /// Request microphone permission
  ///
  /// Used for: Recording audio, voice messages, video recording with audio
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestMicrophonePermission({
    String? rationale,
    BuildContext? context,
  }) async {
    return _requestPermission(
      Permission.microphone,
      permissionName: 'Microphone',
      rationale: rationale ?? 'Microphone access is needed to record audio.',
      context: context,
    );
  }

  /// Check microphone permission status
  Future<PermissionStatus> checkMicrophonePermission() async {
    return await Permission.microphone.status;
  }

  /// Check if microphone permission is granted
  Future<bool> isMicrophonePermissionGranted() async {
    final status = await checkMicrophonePermission();
    return status.isGranted;
  }

  // ==================== STORAGE PERMISSIONS ====================

  /// Request storage permission
  ///
  /// Used for: Reading/writing files, accessing downloads
  /// Note: On Android 13+, this uses granular media permissions
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestStoragePermission({
    String? rationale,
    BuildContext? context,
  }) async {
    if (Platform.isAndroid) {
      // Android 13+ uses granular media permissions
      final androidInfo = await _getAndroidVersion();
      if (androidInfo >= 33) {
        // Request photos, videos, and audio separately
        final results = await [
          Permission.photos,
          Permission.videos,
          Permission.audio,
        ].request();

        return results.values.every((status) => status.isGranted);
      }
    }
    if (context != null && !context.mounted) {
      return false;
    }
    return _requestPermission(
      Permission.storage,
      permissionName: 'Storage',
      rationale:
          rationale ?? 'Storage access is needed to save and read files.',
      context: context,
    );
  }

  /// Check storage permission status
  Future<PermissionStatus> checkStoragePermission() async {
    return await Permission.storage.status;
  }

  /// Check if storage permission is granted
  Future<bool> isStoragePermissionGranted() async {
    final status = await checkStoragePermission();
    return status.isGranted;
  }

  // ==================== PHOTOS PERMISSION ====================

  /// Request photos permission (iOS 14+ and Android 13+)
  ///
  /// Used for: Accessing photo library, selecting images
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestPhotosPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    return _requestPermission(
      Permission.photos,
      permissionName: 'Photos',
      rationale:
          rationale ?? 'Photos access is needed to select and save images.',
      context: context,
    );
  }

  /// Check photos permission status
  Future<PermissionStatus> checkPhotosPermission() async {
    return await Permission.photos.status;
  }

  /// Check if photos permission is granted
  Future<bool> isPhotosPermissionGranted() async {
    final status = await checkPhotosPermission();
    return status.isGranted || status.isLimited;
  }

  // ==================== CONTACTS PERMISSION ====================

  /// Request contacts permission
  ///
  /// Used for: Reading contacts, syncing contacts
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestContactsPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    return _requestPermission(
      Permission.contacts,
      permissionName: 'Contacts',
      rationale:
          rationale ??
          'Contacts access is needed to find and connect with friends.',
      context: context,
    );
  }

  /// Check contacts permission status
  Future<PermissionStatus> checkContactsPermission() async {
    return await Permission.contacts.status;
  }

  /// Check if contacts permission is granted
  Future<bool> isContactsPermissionGranted() async {
    final status = await checkContactsPermission();
    return status.isGranted;
  }

  // ==================== NOTIFICATION PERMISSION ====================

  /// Request notification permission
  ///
  /// Used for: Showing push notifications, local notifications
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestNotificationPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    return _requestPermission(
      Permission.notification,
      permissionName: 'Notifications',
      rationale:
          rationale ?? 'Notification access is needed to keep you updated.',
      context: context,
    );
  }

  /// Check notification permission status
  Future<PermissionStatus> checkNotificationPermission() async {
    return await Permission.notification.status;
  }

  /// Check if notification permission is granted
  Future<bool> isNotificationPermissionGranted() async {
    final status = await checkNotificationPermission();
    return status.isGranted;
  }

  // ==================== BLUETOOTH PERMISSIONS ====================

  /// Request Bluetooth permission
  ///
  /// Used for: Bluetooth device scanning and connection
  /// Note: Android 12+ requires separate Bluetooth permissions
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestBluetoothPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    if (Platform.isAndroid) {
      final androidInfo = await _getAndroidVersion();
      if (androidInfo >= 31) {
        // Android 12+ requires separate permissions
        final results = await [
          Permission.bluetoothScan,
          Permission.bluetoothConnect,
        ].request();

        return results.values.every((status) => status.isGranted);
      }
    }
    if (context != null && !context.mounted) {
      return false;
    }
    return _requestPermission(
      Permission.bluetooth,
      permissionName: 'Bluetooth',
      rationale:
          rationale ?? 'Bluetooth access is needed to connect to devices.',
      context: context,
    );
  }

  /// Check Bluetooth permission status
  Future<PermissionStatus> checkBluetoothPermission() async {
    return await Permission.bluetooth.status;
  }

  /// Check if Bluetooth permission is granted
  Future<bool> isBluetoothPermissionGranted() async {
    final status = await checkBluetoothPermission();
    return status.isGranted;
  }

  // ==================== SENSORS PERMISSION ====================

  /// Request sensors permission (Android only)
  ///
  /// Used for: Accessing body sensors, heart rate monitors
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestSensorsPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    if (!Platform.isAndroid) {
      return true; // iOS doesn't require this permission
    }

    return _requestPermission(
      Permission.sensors,
      permissionName: 'Sensors',
      rationale:
          rationale ??
          'Sensor access is needed for health and fitness features.',
      context: context,
    );
  }

  /// Check sensors permission status
  Future<PermissionStatus> checkSensorsPermission() async {
    return await Permission.sensors.status;
  }

  /// Check if sensors permission is granted
  Future<bool> isSensorsPermissionGranted() async {
    final status = await checkSensorsPermission();
    return status.isGranted;
  }

  // ==================== SPEECH RECOGNITION PERMISSION ====================

  /// Request speech recognition permission
  ///
  /// Used for: Voice-to-text, speech recognition features
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestSpeechPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    return _requestPermission(
      Permission.speech,
      permissionName: 'Speech Recognition',
      rationale:
          rationale ??
          'Speech recognition access is needed for voice commands.',
      context: context,
    );
  }

  /// Check speech recognition permission status
  Future<PermissionStatus> checkSpeechPermission() async {
    return await Permission.speech.status;
  }

  /// Check if speech recognition permission is granted
  Future<bool> isSpeechPermissionGranted() async {
    final status = await checkSpeechPermission();
    return status.isGranted;
  }

  // ==================== MEDIA LIBRARY PERMISSION ====================

  /// Request media library permission (iOS only)
  ///
  /// Used for: Accessing Apple Music library
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestMediaLibraryPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    if (!Platform.isIOS) {
      return true; // Android doesn't require this permission
    }

    return _requestPermission(
      Permission.mediaLibrary,
      permissionName: 'Media Library',
      rationale:
          rationale ?? 'Media library access is needed to play your music.',
      context: context,
    );
  }

  /// Check media library permission status
  Future<PermissionStatus> checkMediaLibraryPermission() async {
    return await Permission.mediaLibrary.status;
  }

  /// Check if media library permission is granted
  Future<bool> isMediaLibraryPermissionGranted() async {
    final status = await checkMediaLibraryPermission();
    return status.isGranted;
  }

  // ==================== ACTIVITY RECOGNITION PERMISSION ====================

  /// Request activity recognition permission
  ///
  /// Used for: Detecting user activity (walking, running, driving)
  ///
  /// Returns: true if permission is granted, false otherwise
  Future<bool> requestActivityRecognitionPermission({
    String? rationale,
    BuildContext? context,
  }) async {
    return _requestPermission(
      Permission.activityRecognition,
      permissionName: 'Activity Recognition',
      rationale:
          rationale ??
          'Activity recognition is needed to track your movements.',
      context: context,
    );
  }

  /// Check activity recognition permission status
  Future<PermissionStatus> checkActivityRecognitionPermission() async {
    return await Permission.activityRecognition.status;
  }

  /// Check if activity recognition permission is granted
  Future<bool> isActivityRecognitionPermissionGranted() async {
    final status = await checkActivityRecognitionPermission();
    return status.isGranted;
  }

  // ==================== MULTIPLE PERMISSIONS ====================

  /// Request multiple permissions at once
  ///
  /// Returns: Map of permission results
  Future<Map<Permission, PermissionStatus>> requestMultiplePermissions(
    List<Permission> permissions, {
    BuildContext? context,
  }) async {
    try {
      debugPrint(
        '📋 Requesting multiple permissions: ${permissions.map((p) => p.toString()).join(', ')}',
      );

      final statuses = await permissions.request();

      for (final entry in statuses.entries) {
        debugPrint('📋 ${entry.key}: ${entry.value}');
      }

      return statuses;
    } catch (e) {
      debugPrint('❌ Failed to request multiple permissions: $e');
      return {};
    }
  }

  /// Check if all specified permissions are granted
  Future<bool> areAllPermissionsGranted(List<Permission> permissions) async {
    for (final permission in permissions) {
      final status = await permission.status;
      if (!status.isGranted) {
        return false;
      }
    }
    return true;
  }

  /// Get status of multiple permissions
  Future<Map<Permission, PermissionStatus>> checkMultiplePermissions(
    List<Permission> permissions,
  ) async {
    final Map<Permission, PermissionStatus> statuses = {};

    for (final permission in permissions) {
      statuses[permission] = await permission.status;
    }

    return statuses;
  }

  // ==================== COMMON PERMISSION GROUPS ====================

  /// Request all media permissions (camera, microphone, photos)
  Future<bool> requestMediaPermissions({BuildContext? context}) async {
    final results = await requestMultiplePermissions([
      Permission.camera,
      Permission.microphone,
      Permission.photos,
    ], context: context);

    return results.values.every((status) => status.isGranted);
  }

  /// Request all location-related permissions
  Future<bool> requestLocationPermissions({
    bool includeAlways = false,
    BuildContext? context,
  }) async {
    final permissions = [Permission.location];

    if (includeAlways) {
      permissions.add(Permission.locationAlways);
    }

    final results = await requestMultiplePermissions(
      permissions,
      context: context,
    );

    return results.values.every((status) => status.isGranted);
  }

  // ==================== CORE PERMISSION REQUEST METHOD ====================

  /// Core method to request a single permission with rationale and error handling
  Future<bool> _requestPermission(
    Permission permission, {
    required String permissionName,
    String? rationale,
    BuildContext? context,
  }) async {
    try {
      debugPrint('📋 Checking $permissionName permission...');

      // Check current status
      final status = await permission.status;

      if (status.isGranted) {
        debugPrint('✅ $permissionName permission already granted');
        return true;
      }

      if (status.isLimited) {
        debugPrint('⚠️ $permissionName permission is limited');
        return true; // Limited access is acceptable for some permissions
      }

      // Show rationale if permission was denied before
      if (status.isDenied &&
          (context != null && context.mounted) &&
          rationale != null) {
        final shouldRequest = await _showPermissionRationale(
          context: context,
          permissionName: permissionName,
          rationale: rationale,
        );

        if (!shouldRequest) {
          debugPrint('❌ User declined $permissionName permission request');
          return false;
        }
      }

      // Check if permission is permanently denied
      if (status.isPermanentlyDenied) {
        debugPrint('⚠️ $permissionName permission is permanently denied');

        if (context != null && context.mounted) {
          await _showOpenSettingsDialog(
            context: context,
            permissionName: permissionName,
          );
        }

        return false;
      }

      // Request permission
      debugPrint('📋 Requesting $permissionName permission...');
      final result = await permission.request();

      if (result.isGranted || result.isLimited) {
        debugPrint('✅ $permissionName permission granted');
        return true;
      } else if (result.isPermanentlyDenied) {
        debugPrint('❌ $permissionName permission permanently denied');

        if (context != null && context.mounted) {
          await _showOpenSettingsDialog(
            context: context,
            permissionName: permissionName,
          );
        }

        return false;
      } else {
        debugPrint('❌ $permissionName permission denied');
        return false;
      }
    } catch (e) {
      debugPrint('❌ Failed to request $permissionName permission: $e');
      return false;
    }
  }

  // ==================== UI DIALOGS ====================

  /// Show permission rationale dialog
  Future<bool> _showPermissionRationale({
    required BuildContext context,
    required String permissionName,
    required String rationale,
  }) async {
    final result = await showModal<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$permissionName Permission'),
        content: Text(rationale),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Continue'),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  /// Show dialog to open app settings
  Future<void> _showOpenSettingsDialog({
    required BuildContext context,
    required String permissionName,
  }) async {
    final result = await showModal<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: Text(
          '$permissionName permission is required for this feature. '
          'Please enable it in app settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );

    if (result == true) {
      await openAppSettings();
    }
  }

  // ==================== SETTINGS NAVIGATION ====================

  /// Open app settings
  ///
  /// Opens the device settings page for this app where users can
  /// manually enable permissions
  Future<bool> openAppSettings() async {
    try {
      debugPrint('🔧 Opening app settings...');
      final opened = await ph.openAppSettings();

      if (opened) {
        debugPrint('✅ App settings opened');
      } else {
        debugPrint('❌ Failed to open app settings');
      }

      return opened;
    } catch (e) {
      debugPrint('❌ Error opening app settings: $e');
      return false;
    }
  }

  // ==================== UTILITY METHODS ====================

  /// Get Android SDK version
  Future<int> _getAndroidVersion() async {
    if (!Platform.isAndroid) {
      return 0;
    }

    try {
      // This is a simplified version. In production, you might want to use
      // device_info_plus package for more accurate version detection
      return 33; // Default to Android 13
    } catch (e) {
      debugPrint('❌ Failed to get Android version: $e');
      return 0;
    }
  }

  /// Check if permission should be requested
  ///
  /// Returns false if permission is already granted or permanently denied
  Future<bool> shouldRequestPermission(Permission permission) async {
    final status = await permission.status;
    return !status.isGranted && !status.isPermanentlyDenied;
  }

  /// Get human-readable permission status
  String getPermissionStatusText(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        return 'Granted';
      case PermissionStatus.denied:
        return 'Denied';
      case PermissionStatus.restricted:
        return 'Restricted';
      case PermissionStatus.limited:
        return 'Limited';
      case PermissionStatus.permanentlyDenied:
        return 'Permanently Denied';
      case PermissionStatus.provisional:
        return 'Provisional';
    }
  }

  /// Request permission with custom error handling
  Future<PermissionResult> requestPermissionWithResult(
    Permission permission, {
    required String permissionName,
    String? rationale,
    BuildContext? context,
  }) async {
    final granted = await _requestPermission(
      permission,
      permissionName: permissionName,
      rationale: rationale,
      context: context,
    );

    final status = await permission.status;

    return PermissionResult(
      permission: permission,
      status: status,
      isGranted: granted,
      permissionName: permissionName,
    );
  }

  /// Check all permissions and return detailed status
  Future<List<PermissionResult>> checkAllPermissions() async {
    final permissions = [
      Permission.camera,
      Permission.microphone,
      Permission.location,
      Permission.storage,
      Permission.photos,
      Permission.contacts,
      // Note: Using calendarFullAccess for iOS 17+, falls back to calendar for older versions
      if (Platform.isIOS)
        Permission.calendarFullAccess
      else
        Permission.notification,
      Permission.bluetooth,
      Permission.sensors,
      Permission.speech,
    ];

    final results = <PermissionResult>[];

    for (final permission in permissions) {
      final status = await permission.status;
      results.add(
        PermissionResult(
          permission: permission,
          status: status,
          isGranted: status.isGranted,
          permissionName: permission.toString().split('.').last,
        ),
      );
    }

    return results;
  }

  /// Reset all permissions (for testing purposes)
  /// Note: This doesn't actually reset permissions, just clears any cached state
  void resetPermissions() {
    debugPrint('🔄 Resetting permission helper state...');
    // Add any state reset logic here if needed
  }
}

// ==================== PERMISSION RESULT CLASS ====================

/// Result of a permission request with detailed information
class PermissionResult {
  final Permission permission;
  final PermissionStatus status;
  final bool isGranted;
  final String permissionName;

  const PermissionResult({
    required this.permission,
    required this.status,
    required this.isGranted,
    required this.permissionName,
  });

  /// Check if permission is denied
  bool get isDenied => status.isDenied;

  /// Check if permission is permanently denied
  bool get isPermanentlyDenied => status.isPermanentlyDenied;

  /// Check if permission is restricted
  bool get isRestricted => status.isRestricted;

  /// Check if permission is limited
  bool get isLimited => status.isLimited;

  /// Get human-readable status text
  String get statusText {
    switch (status) {
      case PermissionStatus.granted:
        return 'Granted';
      case PermissionStatus.denied:
        return 'Denied';
      case PermissionStatus.restricted:
        return 'Restricted';
      case PermissionStatus.limited:
        return 'Limited';
      case PermissionStatus.permanentlyDenied:
        return 'Permanently Denied';
      case PermissionStatus.provisional:
        return 'Provisional';
    }
  }

  @override
  String toString() {
    return 'PermissionResult(permission: $permissionName, status: $statusText, isGranted: $isGranted)';
  }
}
