import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/color.dart';

enum AppSnackBarType {
  success,
  error,
  warning,
  info,
}

class AppSnackBar {
  static OverlayEntry? _currentOverlayEntry;
  static Timer? _dismissTimer;

  /// Show a smooth top floating animated SnackBar / Toast
  static void show(
    BuildContext context, {
    required String message,
    String? title,
    AppSnackBarType type = AppSnackBarType.success,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onTap,
    bool showCloseButton = true,
  }) {
    dismiss(); // Dismiss existing toast if active

    final overlayState = Overlay.maybeOf(context);
    if (overlayState == null) return;

    _currentOverlayEntry = OverlayEntry(
      builder: (context) {
        return _TopSnackBarWidget(
          message: message,
          title: title,
          type: type,
          duration: duration,
          onTap: onTap,
          showCloseButton: showCloseButton,
          onDismiss: dismiss,
        );
      },
    );

    overlayState.insert(_currentOverlayEntry!);

    _dismissTimer = Timer(duration, () {
      dismiss();
    });
  }

  /// Convenience helper for Success SnackBar
  static void showSuccess(
    BuildContext context, {
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onTap,
  }) {
    show(
      context,
      message: message,
      title: title ?? 'Thành công',
      type: AppSnackBarType.success,
      duration: duration,
      onTap: onTap,
    );
  }

  /// Convenience helper for Error SnackBar
  static void showError(
    BuildContext context, {
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onTap,
  }) {
    show(
      context,
      message: message,
      title: title ?? 'Đã xảy ra lỗi',
      type: AppSnackBarType.error,
      duration: duration,
      onTap: onTap,
    );
  }

  /// Convenience helper for Warning SnackBar
  static void showWarning(
    BuildContext context, {
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onTap,
  }) {
    show(
      context,
      message: message,
      title: title ?? 'Cảnh báo',
      type: AppSnackBarType.warning,
      duration: duration,
      onTap: onTap,
    );
  }

  /// Convenience helper for Info SnackBar
  static void showInfo(
    BuildContext context, {
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onTap,
  }) {
    show(
      context,
      message: message,
      title: title ?? 'Thông báo',
      type: AppSnackBarType.info,
      duration: duration,
      onTap: onTap,
    );
  }

  /// Dismiss active top SnackBar immediately
  static void dismiss() {
    _dismissTimer?.cancel();
    _dismissTimer = null;

    _currentOverlayEntry?.remove();
    _currentOverlayEntry = null;
  }

  /// Redirect showBottomSnackBar to top floating SnackBar so it never covers bottom navigation
  static void showBottomSnackBar(
    BuildContext context,
    String message, {
    AppSnackBarType type = AppSnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message: message,
      type: type,
      duration: duration,
    );
  }
}

/// Internal Widget for rendering top overlay toast with animations and drag-to-dismiss
class _TopSnackBarWidget extends StatefulWidget {
  const _TopSnackBarWidget({
    required this.message,
    this.title,
    required this.type,
    required this.duration,
    this.onTap,
    this.showCloseButton = true,
    required this.onDismiss,
  });

  final String message;
  final String? title;
  final AppSnackBarType type;
  final Duration duration;
  final VoidCallback? onTap;
  final bool showCloseButton;
  final VoidCallback onDismiss;

  @override
  State<_TopSnackBarWidget> createState() => _TopSnackBarWidgetState();
}

class _TopSnackBarWidgetState extends State<_TopSnackBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  double _dragY = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 380),
      reverseDuration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.easeInCubic,
      ),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
  }

  void _dismissWithAnimation() async {
    if (!mounted) return;
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final config = _getToastStyle(widget.type, isDark);

    return Positioned(
      top: mediaQuery.padding.top + 10,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            widget.onTap?.call();
            _dismissWithAnimation();
          },
          onVerticalDragUpdate: (details) {
            if (details.delta.dy < -2) {
              // Dragged upwards -> dismiss
              _dismissWithAnimation();
            } else {
              setState(() {
                _dragY = (_dragY + details.delta.dy).clamp(-30.0, 10.0);
              });
            }
          },
          onVerticalDragEnd: (_) {
            if (_dragY < -10) {
              _dismissWithAnimation();
            } else {
              setState(() {
                _dragY = 0;
              });
            }
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _dragY),
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: child,
                    ),
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: config.backgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: config.borderColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.08),
                    blurRadius: 16,
                    spreadRadius: 0,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Status Icon Badge
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: config.iconBgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      config.icon,
                      color: config.iconColor,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Text content
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.title != null) ...[
                          Text(
                            widget.title!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: config.textColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                        ],
                        Text(
                          widget.message,
                          style: TextStyle(
                            fontSize: 13,
                            color: config.textColor.withValues(alpha: 0.88),
                            height: 1.3,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  if (widget.showCloseButton) ...[
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: _dismissWithAnimation,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: config.textColor.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _ToastStyleConfig _getToastStyle(AppSnackBarType type, bool isDark) {
    switch (type) {
      case AppSnackBarType.success:
        return _ToastStyleConfig(
          backgroundColor: isDark ? const Color(0xFF142E1B) : Colors.green.shade50,
          borderColor: isDark ? Colors.green.shade800 : Colors.green.shade200,
          iconBgColor: isDark ? Colors.green.shade900 : Colors.green.shade100,
          iconColor: isDark ? AppColors.otherGreen : const Color(0xFF16A34A),
          textColor: isDark ? AppColors.grey0 : const Color(0xFF052E16),
          icon: Icons.check_circle_rounded,
        );

      case AppSnackBarType.error:
        return _ToastStyleConfig(
          backgroundColor: isDark ? const Color(0xFF381616) : Colors.red.shade50,
          borderColor: isDark ? Colors.red.shade900 : Colors.red.shade200,
          iconBgColor: isDark ? Colors.red.shade900 : Colors.red.shade100,
          iconColor: isDark ? AppColors.danger400 : Colors.red.shade600,
          textColor: isDark ? AppColors.grey0 : const Color(0xFF450A0A),
          icon: Icons.error_outline_rounded,
        );

      case AppSnackBarType.warning:
        return _ToastStyleConfig(
          backgroundColor: isDark ? const Color(0xFF36240F) : Colors.orange.shade50,
          borderColor: isDark ? Colors.orange.shade900 : Colors.orange.shade200,
          iconBgColor: isDark ? Colors.orange.shade900 : Colors.orange.shade100,
          iconColor: isDark ? AppColors.otherOrange : Colors.orange.shade800,
          textColor: isDark ? AppColors.grey0 : const Color(0xFF451A03),
          icon: Icons.warning_amber_rounded,
        );

      case AppSnackBarType.info:
        return _ToastStyleConfig(
          backgroundColor: isDark ? const Color(0xFF13283D) : Colors.blue.shade50,
          borderColor: isDark ? Colors.blue.shade900 : Colors.blue.shade200,
          iconBgColor: isDark ? Colors.blue.shade900 : Colors.blue.shade100,
          iconColor: isDark ? AppColors.primary300 : Colors.blue.shade700,
          textColor: isDark ? AppColors.grey0 : const Color(0xFF0C4A6E),
          icon: Icons.info_outline_rounded,
        );

    }
  }
}

class _ToastStyleConfig {
  const _ToastStyleConfig({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconBgColor,
    required this.iconColor,
    required this.textColor,
    required this.icon,
  });

  final Color backgroundColor;
  final Color borderColor;
  final Color iconBgColor;
  final Color iconColor;
  final Color textColor;
  final IconData icon;
}
