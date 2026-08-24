import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import 'app_settings_provider.dart';

class AppLanguagePopupButton extends StatelessWidget {
  const AppLanguagePopupButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = foregroundColor ?? theme.colorScheme.onSurface;
    final bg = backgroundColor ?? theme.colorScheme.surface;
    final stroke = borderColor ?? fg.withValues(alpha: 0.08);

    final appSettings = AppSettingsProvider.of(context);
    final currentLanguage = appSettings.languageCode;
    final languageName = appSettings.languageName;

    return PopupMenuButton<String>(
      tooltip: context.l10n.selectLanguage,
      initialValue: currentLanguage,
      onSelected: (value) {
        if (value == currentLanguage) return;
        appSettings.updateLanguage(value, context);
      },
      position: PopupMenuPosition.under,
      offset: const Offset(0, 10),
      color: theme.colorScheme.surface,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: stroke),
      ),
      itemBuilder: (context) {
        return AppLocale.supportedLanguageMap.entries.map((entry) {
          final isSelected = entry.key == currentLanguage;
          return PopupMenuItem<String>(
            value: entry.key,
            child: Row(
              children: [
                Icon(
                  isSelected
                      ? Icons.check_circle_rounded
                      : Icons.language_rounded,
                  size: 18,
                  color: isSelected ? theme.colorScheme.primary : fg,
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(entry.value)),
              ],
            ),
          );
        }).toList();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bg.withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: stroke),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.translate_rounded, size: 18, color: fg),
              const SizedBox(width: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 96),
                child: Text(
                  languageName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: fg,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down_rounded, color: fg, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
