import 'package:flutter/material.dart';
import 'package:app_intl/ez_intl.dart';

class AppDialogActions extends StatelessWidget {
  const AppDialogActions({
    super.key,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    this.secondaryLabel,
    this.onSecondaryPressed,
    this.isLoading = false,
    this.primaryEnabled = true,
    this.variant = AppDialogActionVariant.primary,
    this.layout = AppDialogActionsLayout.horizontal,
  });

  final String primaryLabel;
  final VoidCallback? onPrimaryPressed;
  final String? secondaryLabel;
  final VoidCallback? onSecondaryPressed;
  final bool isLoading;
  final bool primaryEnabled;
  final AppDialogActionVariant variant;
  final AppDialogActionsLayout layout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;

    final effectiveSecondaryLabel = secondaryLabel ?? l10n.cancel;

    final secondaryButton = TextButton(
      onPressed: onSecondaryPressed ?? () => Navigator.of(context).pop(),
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.onSurfaceVariant,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: layout == AppDialogActionsLayout.horizontal ? const Size(80, 44) : const Size(double.infinity, 44),
      ),
      child: Text(effectiveSecondaryLabel),
    );

    Color primaryBackgroundColor;
    Color primaryForegroundColor;

    switch (variant) {
      case AppDialogActionVariant.primary:
        primaryBackgroundColor = colorScheme.primary;
        primaryForegroundColor = colorScheme.onPrimary;
      case AppDialogActionVariant.destructive:
        primaryBackgroundColor = colorScheme.error;
        primaryForegroundColor = colorScheme.onError;
      case AppDialogActionVariant.secondary:
        primaryBackgroundColor = colorScheme.secondaryContainer;
        primaryForegroundColor = colorScheme.onSecondaryContainer;
      case AppDialogActionVariant.outline:
        primaryBackgroundColor = Colors.transparent;
        primaryForegroundColor = colorScheme.primary;
    }

    final primaryButton = FilledButton(
      onPressed: (isLoading || !primaryEnabled) ? null : onPrimaryPressed,
      style: FilledButton.styleFrom(
        backgroundColor: primaryBackgroundColor,
        foregroundColor: primaryForegroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: layout == AppDialogActionsLayout.horizontal ? const Size(80, 44) : const Size(double.infinity, 44),
        side: variant == AppDialogActionVariant.outline
            ? BorderSide(color: colorScheme.primary, width: 1.5)
            : BorderSide.none,
      ),
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: primaryForegroundColor,
              ),
            )
          : Text(primaryLabel),
    );

    switch (layout) {
      case AppDialogActionsLayout.horizontal:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            secondaryButton,
            const SizedBox(width: 12),
            primaryButton,
          ],
        );
      case AppDialogActionsLayout.vertical:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            primaryButton,
            const SizedBox(height: 8),
            secondaryButton,
          ],
        );
      case AppDialogActionsLayout.spaced:
        return Row(
          children: [
            Expanded(child: secondaryButton),
            const SizedBox(width: 12),
            Expanded(child: primaryButton),
          ],
        );
    }
  }
}

enum AppDialogActionVariant {
  primary,
  destructive,
  secondary,
  outline,
}

enum AppDialogActionsLayout {
  horizontal,
  vertical,
  spaced,
}

class AppDialogHeader extends StatelessWidget {
  const AppDialogHeader({
    super.key,
    required this.title,
    this.icon,
    this.iconBackgroundColor,
    this.titleColor,
    this.showCloseButton = true,
    this.onClosePressed,
  });

  final String title;
  final Widget? icon;
  final Color? iconBackgroundColor;
  final Color? titleColor;
  final bool showCloseButton;
  final VoidCallback? onClosePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: titleColor ?? colorScheme.onSurface,
            ),
          ),
        ),
        if (showCloseButton)
          IconButton(
            icon: Icon(Icons.close_rounded, size: 20, color: colorScheme.onSurfaceVariant),
            onPressed: onClosePressed ?? () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 20,
          ),
      ],
    );
  }
}

class AppDialogWarningText extends StatelessWidget {
  const AppDialogWarningText({
    super.key,
    required this.text,
    this.icon = Icons.warning_amber_rounded,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.error.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.error),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.error,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppDialogInfoText extends StatelessWidget {
  const AppDialogInfoText({
    super.key,
    required this.text,
    this.icon = Icons.info_outline_rounded,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}