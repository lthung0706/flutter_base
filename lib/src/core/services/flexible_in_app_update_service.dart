import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_upgrade_version/flutter_upgrade_version.dart';

class FlexibleInAppUpdateService {
  FlexibleInAppUpdateService._();

  static final FlexibleInAppUpdateService instance =
      FlexibleInAppUpdateService._();

  final InAppUpdateManager _manager = InAppUpdateManager();
  bool _didCheckInSession = false;

  Future<void> checkAndStartFlexibleUpdate({bool force = false}) async {
    if (!force && _didCheckInSession) return;
    _didCheckInSession = true;

    if (!Platform.isAndroid || !kReleaseMode) return;

    try {
      final appUpdateInfo = await _manager.checkForUpdate();
      if (appUpdateInfo == null) return;

      debugPrint('In-app update info: ${appUpdateInfo.toJson()}');

      if (appUpdateInfo.updateAvailability ==
              UpdateAvailability.updateAvailable &&
          appUpdateInfo.flexibleAllowed) {
        unawaited(_startFlexibleUpdate());
      }
    } catch (e, stackTrace) {
      debugPrint('Failed to check flexible in-app update: $e');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  Future<void> _startFlexibleUpdate() async {
    try {
      final message = await _manager.startAnUpdate(
        type: AppUpdateType.flexible,
      );

      if (message != null && message.isNotEmpty) {
        debugPrint('Flexible in-app update message: $message');
      }
    } catch (e, stackTrace) {
      debugPrint('Failed to start flexible in-app update: $e');
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}

class FlexibleInAppUpdateGate extends StatefulWidget {
  const FlexibleInAppUpdateGate({super.key, required this.child});

  final Widget child;

  @override
  State<FlexibleInAppUpdateGate> createState() =>
      _FlexibleInAppUpdateGateState();
}

class _FlexibleInAppUpdateGateState extends State<FlexibleInAppUpdateGate> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      unawaited(
        FlexibleInAppUpdateService.instance.checkAndStartFlexibleUpdate(),
      );
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
