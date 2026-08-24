import 'package:flutter/material.dart';
import '../theme/color.dart';

/// Enum representing the visual type/status of the dialog
enum AppAlertDialogType {
  delete,
  confirm,
  success,
  warning,
  info,
}

/// Enum representing the layout style of the dialog
enum AppAlertDialogStyle {
  /// Header row with icon + title on left, content below, actions right-aligned/spaced
  standard,

  /// Icon centered at top, title centered below, message centered, full-width actions
  modern,
}

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    required this.title,
    this.message,
    this.content,
    this.type = AppAlertDialogType.confirm,
    this.style = AppAlertDialogStyle.standard,
    this.icon,
    this.iconBackgroundColor,
    this.iconColor,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.isLoading = false,
    this.closeOnConfirm = true,
    this.barrierDismissible = true,
    this.showCancelButton = true,
    this.showCloseButton = false,
    this.maxWidth = 420,
    this.customActions,
  });

  final String title;
  final String? message;
  final Widget? content;
  final AppAlertDialogType type;
  final AppAlertDialogStyle style;
  final Widget? icon;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isLoading;
  final bool closeOnConfirm;
  final bool barrierDismissible;
  final bool showCancelButton;
  final bool showCloseButton;
  final double maxWidth;
  final List<Widget>? customActions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final config = _getTypeConfig(context, type);
    final effectiveIconColor = iconColor ?? config.iconColor;
    final effectiveIconBg = iconBackgroundColor ?? config.iconBgColor;
    final effectiveIcon = icon ?? config.icon;

    final effectiveConfirmText = confirmText ?? config.defaultConfirmText;
    final effectiveCancelText = cancelText ?? 'Hủy';

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.black850 : Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : colorScheme.outlineVariant.withValues(alpha: 0.4),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.12),
                blurRadius: 24,
                spreadRadius: 0,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: style == AppAlertDialogStyle.modern
                ? _buildModernLayout(
                    context,
                    theme: theme,
                    icon: effectiveIcon,
                    iconColor: effectiveIconColor,
                    iconBg: effectiveIconBg,
                    confirmText: effectiveConfirmText,
                    cancelText: effectiveCancelText,
                    confirmColor: config.confirmButtonColor,
                  )
                : _buildStandardLayout(
                    context,
                    theme: theme,
                    icon: effectiveIcon,
                    iconColor: effectiveIconColor,
                    iconBg: effectiveIconBg,
                    confirmText: effectiveConfirmText,
                    cancelText: effectiveCancelText,
                    confirmColor: config.confirmButtonColor,
                  ),
          ),
        ),
      ),
    );
  }

  /// Modern centered layout (Icon top centered, centered text, full-width actions)
  Widget _buildModernLayout(
    BuildContext context, {
    required ThemeData theme,
    required Widget icon,
    required Color iconColor,
    required Color iconBg,
    required String confirmText,
    required String cancelText,
    required Color confirmColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Centered Icon Badge with subtle outer ring animation look
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: iconBg,
            shape: BoxShape.circle,
          ),
          child: IconTheme(
            data: IconThemeData(color: iconColor, size: 36),
            child: icon,
          ),
        ),
        const SizedBox(height: 18),

        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        if (message != null || content != null) const SizedBox(height: 10),

        // Content / Message
        if (message != null)
          Text(
            message!,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.brightness == Brightness.dark
                  ? AppColors.grey400
                  : AppColors.slate600,
              fontSize: 14,
              height: 1.45,
            ),
          ),
        if (content != null) content!,

        const SizedBox(height: 24),

        // Action Buttons
        if (customActions != null)
          Row(children: customActions!)
        else
          Row(
            children: [
              if (showCancelButton) ...[
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      side: BorderSide(
                        color: theme.brightness == Brightness.dark
                            ? AppColors.slate700
                            : AppColors.slate300,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      onCancel?.call();
                    },
                    child: Text(
                      cancelText,
                      style: TextStyle(
                        color: theme.brightness == Brightness.dark
                            ? AppColors.grey300
                            : AppColors.slate700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: confirmColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: isLoading
                      ? null
                      : () {
                          if (closeOnConfirm &&
                              Navigator.of(context).canPop()) {
                            Navigator.of(context).pop(true);
                          }
                          onConfirm?.call();
                        },
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          confirmText,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  /// Standard row header layout (Icon left + Title, description below, actions bottom right/spaced)
  Widget _buildStandardLayout(
    BuildContext context, {
    required ThemeData theme,
    required Widget icon,
    required Color iconColor,
    required Color iconBg,
    required String confirmText,
    required String cancelText,
    required Color confirmColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconBg,
                shape: BoxShape.circle,
              ),
              child: IconTheme(
                data: IconThemeData(color: iconColor, size: 24),
                child: icon,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            if (showCloseButton)
              IconButton(
                icon: const Icon(Icons.close_rounded, size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => Navigator.of(context).pop(),
              ),
          ],
        ),
        const SizedBox(height: 16),

        // Message / Content Body
        if (message != null)
          Text(
            message!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.brightness == Brightness.dark
                  ? AppColors.grey300
                  : AppColors.slate700,
              fontSize: 14,
              height: 1.45,
            ),
          ),
        if (content != null) content!,

        const SizedBox(height: 20),

        // Action Buttons
        if (customActions != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: customActions!,
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (showCancelButton) ...[
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                    onCancel?.call();
                  },
                  child: Text(
                    cancelText,
                    style: TextStyle(
                      color: theme.brightness == Brightness.dark
                          ? AppColors.grey400
                          : AppColors.slate600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: confirmColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        if (closeOnConfirm &&
                            Navigator.of(context).canPop()) {
                          Navigator.of(context).pop(true);
                        }
                        onConfirm?.call();
                      },
                child: isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        confirmText,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ],
          ),
      ],
    );
  }

  _TypeConfig _getTypeConfig(BuildContext context, AppAlertDialogType type) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (type) {
      case AppAlertDialogType.delete:
        return _TypeConfig(
          icon: const Icon(Icons.delete_forever_rounded),
          iconColor: isDark ? AppColors.danger400 : AppColors.danger500,
          iconBgColor: isDark
              ? AppColors.danger500.withValues(alpha: 0.18)
              : Colors.red.shade50,
          confirmButtonColor: AppColors.danger500,
          defaultConfirmText: 'Xóa ngay',
        );

      case AppAlertDialogType.confirm:
        return _TypeConfig(
          icon: const Icon(Icons.help_outline_rounded),
          iconColor: isDark ? AppColors.primary400 : AppColors.primary600,
          iconBgColor: isDark
              ? AppColors.primary600.withValues(alpha: 0.18)
              : Colors.blue.shade50,
          confirmButtonColor: AppColors.primary600,
          defaultConfirmText: 'Xác nhận',
        );

      case AppAlertDialogType.success:
        return _TypeConfig(
          icon: const Icon(Icons.check_circle_rounded),
          iconColor: isDark ? AppColors.otherGreen : const Color(0xFF16A34A),
          iconBgColor: isDark
              ? Colors.green.withValues(alpha: 0.18)
              : Colors.green.shade50,
          confirmButtonColor: const Color(0xFF16A34A),
          defaultConfirmText: 'Đồng ý',
        );

      case AppAlertDialogType.warning:
        return _TypeConfig(
          icon: const Icon(Icons.warning_amber_rounded),
          iconColor: isDark ? AppColors.otherOrange : Colors.orange.shade700,
          iconBgColor: isDark
              ? Colors.orange.withValues(alpha: 0.18)
              : Colors.orange.shade50,
          confirmButtonColor: Colors.orange.shade700,
          defaultConfirmText: 'Hiểu rồi',
        );

      case AppAlertDialogType.info:
        return _TypeConfig(
          icon: const Icon(Icons.info_outline_rounded),
          iconColor: isDark ? AppColors.info400 : AppColors.info500,
          iconBgColor: isDark
              ? AppColors.info500.withValues(alpha: 0.18)
              : Colors.lightBlue.shade50,
          confirmButtonColor: AppColors.info500,
          defaultConfirmText: 'Đóng',
        );
    }
  }

  // Static Helper Methods

  /// General dialog launcher with smooth scale & fade transition
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Dismiss Dialog',
      barrierColor: Colors.black.withValues(alpha: 0.54),
      transitionDuration: const Duration(milliseconds: 220),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
            reverseCurve: Curves.easeInQuad,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return builder(context);
      },
    );
  }

  /// Show Delete Confirmation Dialog
  static Future<bool?> showDelete(
    BuildContext context, {
    String title = 'Xác nhận xóa',
    required String message,
    String confirmText = 'Xóa ngay',
    String cancelText = 'Hủy',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = false,
  }) {
    return show<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppAlertDialog(
        title: title,
        message: message,
        type: AppAlertDialogType.delete,
        style: AppAlertDialogStyle.standard,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        barrierDismissible: barrierDismissible,
      ),
    );
  }

  /// Show General Confirm Dialog
  static Future<bool?> showConfirm(
    BuildContext context, {
    String title = 'Xác nhận',
    required String message,
    String confirmText = 'Xác nhận',
    String cancelText = 'Xem lại',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    return show<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppAlertDialog(
        title: title,
        message: message,
        type: AppAlertDialogType.confirm,
        style: AppAlertDialogStyle.standard,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }

  /// Show Modern Centered Dialog (e.g. Success / Completion / Action)
  static Future<bool?> showModern(
    BuildContext context, {
    required String title,
    required String message,
    AppAlertDialogType type = AppAlertDialogType.success,
    String confirmText = 'Đồng ý',
    String cancelText = 'Bỏ qua',
    bool showCancelButton = true,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Widget? icon,
    bool barrierDismissible = true,
  }) {
    return show<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppAlertDialog(
        title: title,
        message: message,
        type: type,
        style: AppAlertDialogStyle.modern,
        icon: icon,
        confirmText: confirmText,
        cancelText: cancelText,
        showCancelButton: showCancelButton,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }


  /// Show Warning Dialog
  static Future<bool?> showWarning(
    BuildContext context, {
    String title = 'Cảnh báo',
    required String message,
    String confirmText = 'Hiểu rồi',
    String? cancelText,
    bool showCancelButton = false,
    VoidCallback? onConfirm,
  }) {
    return show<bool>(
      context: context,
      builder: (context) => AppAlertDialog(
        title: title,
        message: message,
        type: AppAlertDialogType.warning,
        style: AppAlertDialogStyle.standard,
        confirmText: confirmText,
        cancelText: cancelText,
        showCancelButton: showCancelButton,
        onConfirm: onConfirm,
      ),
    );
  }
}

class _TypeConfig {
  const _TypeConfig({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.confirmButtonColor,
    required this.defaultConfirmText,
  });

  final Widget icon;
  final Color iconColor;
  final Color iconBgColor;
  final Color confirmButtonColor;
  final String defaultConfirmText;
}
