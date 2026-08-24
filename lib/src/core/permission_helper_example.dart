import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:report_person/src/components/app_snackbar.dart';
import 'package:report_person/src/core/permission_helper.dart';

/// Example usage of PermissionHelper
///
/// This file demonstrates various ways to use the PermissionHelper class
/// for requesting and managing permissions in your Flutter app.

class PermissionExamplePage extends StatefulWidget {
  const PermissionExamplePage({super.key});

  @override
  State<PermissionExamplePage> createState() => _PermissionExamplePageState();
}

class _PermissionExamplePageState extends State<PermissionExamplePage> {
  final _permissionHelper = PermissionHelper();
  final Map<String, bool> _permissionStatus = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permission Examples')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Single Permissions'),
          _buildPermissionButton(
            'Camera',
            Icons.camera_alt,
            () => _requestCameraPermission(),
          ),
          _buildPermissionButton(
            'Microphone',
            Icons.mic,
            () => _requestMicrophonePermission(),
          ),
          _buildPermissionButton(
            'Location',
            Icons.location_on,
            () => _requestLocationPermission(),
          ),
          _buildPermissionButton(
            'Photos',
            Icons.photo_library,
            () => _requestPhotosPermission(),
          ),
          _buildPermissionButton(
            'Contacts',
            Icons.contacts,
            () => _requestContactsPermission(),
          ),
          _buildPermissionButton(
            'Notifications',
            Icons.notifications,
            () => _requestNotificationPermission(),
          ),

          const SizedBox(height: 24),
          _buildSectionTitle('Multiple Permissions'),
          _buildPermissionButton(
            'All Media Permissions',
            Icons.perm_media,
            () => _requestMediaPermissions(),
          ),
          _buildPermissionButton(
            'Custom Multiple Permissions',
            Icons.apps,
            () => _requestCustomMultiplePermissions(),
          ),

          const SizedBox(height: 24),
          _buildSectionTitle('Permission Status'),
          _buildPermissionButton(
            'Check All Permissions',
            Icons.checklist,
            () => _checkAllPermissions(),
          ),
          _buildPermissionButton(
            'Open App Settings',
            Icons.settings,
            () => _openSettings(),
          ),

          const SizedBox(height: 24),
          if (_permissionStatus.isNotEmpty) ...[
            _buildSectionTitle('Current Status'),
            ..._permissionStatus.entries.map(
              (entry) => _buildStatusTile(entry.key, entry.value),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPermissionButton(
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  Widget _buildStatusTile(String permission, bool granted) {
    return ListTile(
      leading: Icon(
        granted ? Icons.check_circle : Icons.cancel,
        color: granted ? Colors.green : Colors.red,
      ),
      title: Text(permission),
      subtitle: Text(granted ? 'Granted' : 'Denied'),
    );
  }

  // ==================== SINGLE PERMISSION EXAMPLES ====================

  Future<void> _requestCameraPermission() async {
    final granted = await _permissionHelper.requestCameraPermission(
      rationale: 'We need camera access to take photos for your profile.',
      context: context,
    );

    setState(() {
      _permissionStatus['Camera'] = granted;
    });

    _showResult('Camera', granted);
  }

  Future<void> _requestMicrophonePermission() async {
    final granted = await _permissionHelper.requestMicrophonePermission(
      rationale: 'We need microphone access to record voice messages.',
      context: context,
    );

    setState(() {
      _permissionStatus['Microphone'] = granted;
    });

    _showResult('Microphone', granted);
  }

  Future<void> _requestLocationPermission() async {
    final granted = await _permissionHelper.requestLocationPermission(
      rationale: 'We need location access to show nearby places.',
      context: context,
    );

    setState(() {
      _permissionStatus['Location'] = granted;
    });

    _showResult('Location', granted);
  }

  Future<void> _requestPhotosPermission() async {
    final granted = await _permissionHelper.requestPhotosPermission(
      rationale: 'We need photo library access to select images.',
      context: context,
    );

    setState(() {
      _permissionStatus['Photos'] = granted;
    });

    _showResult('Photos', granted);
  }

  Future<void> _requestContactsPermission() async {
    final granted = await _permissionHelper.requestContactsPermission(
      rationale: 'We need contacts access to find your friends.',
      context: context,
    );

    setState(() {
      _permissionStatus['Contacts'] = granted;
    });

    _showResult('Contacts', granted);
  }

  Future<void> _requestNotificationPermission() async {
    final granted = await _permissionHelper.requestNotificationPermission(
      rationale: 'We need notification access to keep you updated.',
      context: context,
    );

    setState(() {
      _permissionStatus['Notifications'] = granted;
    });

    _showResult('Notifications', granted);
  }

  // ==================== MULTIPLE PERMISSIONS EXAMPLES ====================

  Future<void> _requestMediaPermissions() async {
    final granted = await _permissionHelper.requestMediaPermissions(
      context: context,
    );

    setState(() {
      _permissionStatus['All Media'] = granted;
    });

    _showResult('All Media Permissions', granted);
  }

  Future<void> _requestCustomMultiplePermissions() async {
    final results = await _permissionHelper.requestMultiplePermissions([
      Permission.camera,
      Permission.microphone,
      Permission.location,
    ], context: context);

    setState(() {
      for (final entry in results.entries) {
        final permissionName = entry.key.toString().split('.').last;
        _permissionStatus[permissionName] = entry.value.isGranted;
      }
    });

    final allGranted = results.values.every((status) => status.isGranted);
    _showResult('Custom Multiple Permissions', allGranted);
  }

  // ==================== STATUS CHECK EXAMPLES ====================

  Future<void> _checkAllPermissions() async {
    final results = await _permissionHelper.checkAllPermissions();

    setState(() {
      _permissionStatus.clear();
      for (final result in results) {
        _permissionStatus[result.permissionName] = result.isGranted;
      }
    });

    if (!mounted) return;

    AppSnackBar.showInfo(
      context,
      message: 'Checked ${results.length} permissions',
    );
  }

  Future<void> _openSettings() async {
    final opened = await _permissionHelper.openAppSettings();

    if (!mounted) return;

    AppSnackBar.showInfo(
      context,
      message: opened ? 'Opening app settings...' : 'Failed to open app settings',
    );
  }

  // ==================== HELPER METHODS ====================

  void _showResult(String permissionName, bool granted) {
    if (!mounted) return;

    AppSnackBar.showInfo(
      context,
      message: '$permissionName permission ${granted ? 'granted' : 'denied'}',
    );
  }
}

// ==================== ADVANCED USAGE EXAMPLES ====================

/// Example: Request permission before using camera
class CameraFeatureExample extends StatelessWidget {
  const CameraFeatureExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _openCamera(context),
      child: const Text('Open Camera'),
    );
  }

  Future<void> _openCamera(BuildContext context) async {
    final permissionHelper = PermissionHelper();

    // Check if permission is already granted
    final isGranted = await permissionHelper.isCameraPermissionGranted();

    if (isGranted) {
      // Open camera
      _launchCamera();
      return;
    }

    // Request permission
    if (!context.mounted) return;

    final granted = await permissionHelper.requestCameraPermission(
      rationale: 'Camera access is needed to take photos.',
      context: context,
    );

    if (granted) {
      _launchCamera();
    } else {
    if (!context.mounted) return;

    AppSnackBar.showError(
      context,
      message: 'Camera permission is required for this feature',
    );
    }
  }

  void _launchCamera() {
    // Launch camera implementation
    debugPrint('Opening camera...');
  }
}
