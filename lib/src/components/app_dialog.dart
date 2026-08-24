import 'package:flutter/material.dart';
import 'package:app_intl/ez_intl.dart';
import 'app_dialog_actions.dart';

import 'app_alert_dialog.dart';

export 'app_dialog_actions.dart';
export 'app_alert_dialog.dart';
export 'app_snackbar.dart';



enum AppDialogVariant {
  confirm,
  delete,
  form,
  info,
  loading,
}

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title,
    this.icon,
    this.iconBackgroundColor,
    this.variant,
    required this.content,
    this.actions,
    this.contentPadding = const EdgeInsets.fromLTRB(24, 16, 24, 8),
    this.actionsPadding = const EdgeInsets.fromLTRB(24, 8, 24, 20),
    this.shape,
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    this.backgroundColor,
    this.elevation = 8,
    this.showCloseButton = false,
    this.onClosePressed,
    this.maxWidth = 400,
    this.maxHeight,
  });

  final String? title;
  final Widget? icon;
  final Color? iconBackgroundColor;
  final AppDialogVariant? variant;
  final Widget content;
  final List<Widget>? actions;
  final EdgeInsets contentPadding;
  final EdgeInsets actionsPadding;
  final ShapeBorder? shape;
  final EdgeInsets insetPadding;
  final Color? backgroundColor;
  final double elevation;
  final bool showCloseButton;
  final VoidCallback? onClosePressed;
  final double maxWidth;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine variant-specific colors
    final variantConfig = _getVariantConfig(colorScheme, variant);

    return Dialog(
      insetPadding: insetPadding,
      backgroundColor: backgroundColor ?? colorScheme.surface,
      elevation: elevation,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: colorScheme.outlineVariant.withValues(alpha: 0.5),
              width: 0.5,
            ),
          ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.85,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null || showCloseButton)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
                child: AppDialogHeader(
                  title: title ?? '',
                  icon: icon ?? variantConfig.icon,
                  iconBackgroundColor: iconBackgroundColor ?? variantConfig.iconBackgroundColor,
                  titleColor: variantConfig.titleColor,
                  showCloseButton: showCloseButton,
                  onClosePressed: onClosePressed,
                ),
              ),
            Flexible(
              child: SingleChildScrollView(
                padding: contentPadding,
                child: content,
              ),
            ),
            if (actions != null && actions!.isNotEmpty)
              Padding(
                padding: actionsPadding,
                child: _buildActions(context),
              ),
          ],
        ),
      ),
    );
  }

  _VariantConfig _getVariantConfig(ColorScheme colorScheme, AppDialogVariant? variant) {
    switch (variant) {
      case AppDialogVariant.delete:
        return _VariantConfig(
          icon: const Icon(Icons.delete_forever_rounded, size: 28),
          iconBackgroundColor: colorScheme.errorContainer,
          titleColor: colorScheme.error,
        );
      case AppDialogVariant.confirm:
        return _VariantConfig(
          icon: const Icon(Icons.help_outline_rounded, size: 28),
          iconBackgroundColor: colorScheme.primaryContainer,
          titleColor: colorScheme.primary,
        );
      case AppDialogVariant.form:
        return _VariantConfig(
          icon: const Icon(Icons.edit_outlined, size: 28),
          iconBackgroundColor: colorScheme.primaryContainer,
          titleColor: colorScheme.primary,
        );
      case AppDialogVariant.info:
        return _VariantConfig(
          icon: const Icon(Icons.info_outline_rounded, size: 28),
          iconBackgroundColor: colorScheme.secondaryContainer,
          titleColor: colorScheme.secondary,
        );
      case AppDialogVariant.loading:
        return _VariantConfig(
          icon: const SizedBox(
            width: 28,
            height: 28,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
          iconBackgroundColor: colorScheme.primaryContainer,
          titleColor: colorScheme.primary,
        );
      default:
        return _VariantConfig(
          icon: const SizedBox.shrink(),
          iconBackgroundColor: colorScheme.primaryContainer,
          titleColor: colorScheme.onSurface,
        );
    }
  }

  Widget _buildActions(BuildContext context) {
    if (actions!.length == 1) {
      return actions!.first;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: actions!
          .expand((widget) => [widget, const SizedBox(width: 12)])
          .take(actions!.length * 2 - 1)
          .toList(),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    RouteSettings? routeSettings,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? Colors.black54,
      barrierLabel: barrierLabel,
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
            reverseCurve: Curves.easeInBack,
          ),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return builder(context);
      },
      routeSettings: routeSettings,
    );
  }
}

class AppFormDialog extends StatelessWidget {
  const AppFormDialog({
    super.key,
    required this.title,
    this.icon,
    this.iconBackgroundColor,
    this.formFields,
    this.content,
    this.onSubmit,
    this.submitLabel,
    this.cancelLabel,
    this.primaryActionLabel,
    this.secondaryActionLabel,
    this.onPrimaryAction,
    this.onSecondaryAction,
    this.isLoading = false,
    this.submitEnabled = true,
    this.primaryEnabled,
    this.variant = AppDialogActionVariant.primary,
    this.layout = AppDialogActionsLayout.horizontal,
    this.extraActions,
    this.contentPadding = const EdgeInsets.fromLTRB(24, 16, 24, 8),
    this.actionsPadding = const EdgeInsets.fromLTRB(24, 8, 24, 20),
    this.maxWidth = 400,
    this.onCancel,
    this.actionsBuilder,
  });

  final String title;
  final Widget? icon;
  final Color? iconBackgroundColor;
  final List<Widget>? formFields;
  final Widget? content;
  final VoidCallback? onSubmit;
  final String? submitLabel;
  final String? cancelLabel;
  final String? primaryActionLabel;
  final String? secondaryActionLabel;
  final VoidCallback? onPrimaryAction;
  final VoidCallback? onSecondaryAction;
  final bool isLoading;
  final bool submitEnabled;
  final bool? primaryEnabled;
  final AppDialogActionVariant variant;
  final AppDialogActionsLayout layout;
  final List<Widget>? extraActions;
  final EdgeInsets contentPadding;
  final EdgeInsets actionsPadding;
  final double maxWidth;
  final VoidCallback? onCancel;
  final Widget Function(BuildContext, VoidCallback, VoidCallback?)? actionsBuilder;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final effectiveContent = content ??
        (formFields != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: formFields!
                    .expand((widget) => [widget])
                    .take(formFields!.length * 2 - 1)
                    .toList(),
              )
            : const SizedBox.shrink());

    final effectiveOnPrimary = onPrimaryAction ?? onSubmit;
    final effectivePrimaryLabel = primaryActionLabel ?? submitLabel ?? l10n.save;
    final effectiveSecondaryLabel = secondaryActionLabel ?? cancelLabel;
    final effectiveOnSecondary = onSecondaryAction ?? onCancel;
    final effectivePrimaryEnabled = primaryEnabled ?? submitEnabled;

    // If no primary action is provided, don't show actions
    final hasPrimaryAction = effectiveOnPrimary != null;

    return AppDialog(
      title: title,
      icon: icon,
      iconBackgroundColor: iconBackgroundColor,
      contentPadding: contentPadding,
      actionsPadding: actionsPadding,
      maxWidth: maxWidth,
      content: effectiveContent,
      actions: !hasPrimaryAction
          ? null
          : actionsBuilder != null
              ? [actionsBuilder!(context, effectiveOnPrimary, effectiveOnSecondary)]
              : [
                  if (extraActions != null) ...extraActions!,
                  AppDialogActions(
                    primaryLabel: effectivePrimaryLabel,
                    onPrimaryPressed: effectiveOnPrimary,
                    secondaryLabel: effectiveSecondaryLabel,
                    onSecondaryPressed: effectiveOnSecondary,
                    isLoading: isLoading,
                    primaryEnabled: effectivePrimaryEnabled,
                    variant: variant,
                    layout: layout,
                  ),
                ],
    );
  }
}

class AppConfirmDialog extends StatelessWidget {
  const AppConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.icon,
    this.iconBackgroundColor,
    required this.onConfirm,
    this.confirmLabel,
    this.cancelLabel,
    this.isLoading = false,
    this.variant = AppDialogActionVariant.primary,
    this.warningText,
    this.infoText,
    this.maxWidth = 400,
  });

  final String title;
  final String message;
  final Widget? icon;
  final Color? iconBackgroundColor;
  final VoidCallback onConfirm;
  final String? confirmLabel;
  final String? cancelLabel;
  final bool isLoading;
  final AppDialogActionVariant variant;
  final String? warningText;
  final String? infoText;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      title: title,
      message: message,
      type: variant == AppDialogActionVariant.destructive
          ? AppAlertDialogType.delete
          : AppAlertDialogType.confirm,
      style: AppAlertDialogStyle.standard,
      icon: icon,
      iconBackgroundColor: iconBackgroundColor,
      confirmText: confirmLabel ?? context.l10n.confirm,
      cancelText: cancelLabel ?? context.l10n.cancel,
      isLoading: isLoading,
      maxWidth: maxWidth,
      onConfirm: onConfirm,
    );
  }
}

class AppDeleteConfirmDialog extends StatelessWidget {
  const AppDeleteConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onDelete,
    this.deleteLabel,
    this.cancelLabel,
    this.isLoading = false,
    this.itemName,
    this.warningText,
    this.maxWidth = 400,
  });

  final String title;
  final String message;
  final VoidCallback onDelete;
  final String? deleteLabel;
  final String? cancelLabel;
  final bool isLoading;
  final String? itemName;
  final String? warningText;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppAlertDialog(
      title: title,
      message: warningText != null ? '$message\n\n$warningText' : message,
      type: AppAlertDialogType.delete,
      style: AppAlertDialogStyle.standard,
      confirmText: deleteLabel ?? l10n.delete,
      cancelText: cancelLabel ?? l10n.cancel,
      isLoading: isLoading,
      maxWidth: maxWidth,
      onConfirm: onDelete,
    );
  }
}


class _VariantConfig {
  const _VariantConfig({
    required this.icon,
    required this.iconBackgroundColor,
    required this.titleColor,
  });

  final Widget icon;
  final Color iconBackgroundColor;
  final Color titleColor;
}