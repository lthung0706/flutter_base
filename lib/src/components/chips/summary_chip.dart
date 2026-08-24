import 'package:flutter/material.dart';

/// A summary chip widget displaying an icon alongside a label widget.
/// Extracted from the order detail bodies for reuse across the app.
class SummaryChip extends StatelessWidget {
  const SummaryChip({super.key, required this.icon, required this.label});

  final IconData icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: colorScheme.primary),
          const SizedBox(width: 8),
          label,
        ],
      ),
    );
  }
}
