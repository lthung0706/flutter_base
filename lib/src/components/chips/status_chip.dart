import 'package:flutter/material.dart';

/// A status chip widget for displaying order/item status.
/// Extracted from OrderCard pattern for reuse across the app.
class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.status, this.statusColorResolver});

  final String? status;

  /// Optional function to resolve status to color.
  /// If not provided, uses default color mapping.
  final Color Function(String?, ColorScheme)? statusColorResolver;

  Color _getDefaultStatusColor(String? status, ColorScheme colorScheme) {
    switch (status?.toLowerCase()) {
      case 'pending':
        return colorScheme.tertiary;
      case 'completed':
      case 'delivered':
        return colorScheme.primary;
      case 'cancelled':
      case 'failed':
        return colorScheme.error;
      case 'processing':
        return colorScheme.secondary;
      default:
        return colorScheme.onSurface.withValues(alpha: 0.6);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final statusColor =
        statusColorResolver?.call(status, colorScheme) ??
        _getDefaultStatusColor(status, colorScheme);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.5),
          width: 0.5,
        ),
      ),
      child: Text(
        status?.toUpperCase() ?? 'N/A',
        style: theme.textTheme.labelSmall?.copyWith(
          color: statusColor,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
