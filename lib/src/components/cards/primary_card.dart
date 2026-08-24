import 'package:flutter/material.dart';

/// A primary card component used across the app for consistent UI.
/// This replaces redundant Container decorations for cards.
class PrimaryCard extends StatelessWidget {
  const PrimaryCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.only(bottom: 16),
    this.height,
    this.width,
    this.onTap,
    this.color,
    this.borderRadius,
  });

  /// The widget to display inside the card.
  final Widget child;

  /// Internal padding of the card.
  final EdgeInsetsGeometry? padding;

  /// External margin of the card.
  final EdgeInsetsGeometry? margin;

  /// Fixed height of the card.
  final double? height;

  /// Fixed width of the card.
  final double? width;

  /// Optional callback when the card is tapped.
  final VoidCallback? onTap;

  /// Optional background color. Defaults to [ColorScheme.surface].
  final Color? color;

  /// Optional border radius. Defaults to 12.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(12);

    Widget content = child;
    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: effectiveBorderRadius,
        child: content,
      );
    }

    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        borderRadius: effectiveBorderRadius,
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: content,
    );
  }
}
