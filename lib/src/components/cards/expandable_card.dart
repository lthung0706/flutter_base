import 'package:flutter/material.dart';

/// An expandable card widget with smooth animation.
/// Extracted from EmployeeCard pattern for reuse across the app.
class ExpandableCard extends StatefulWidget {
  const ExpandableCard({
    super.key,
    required this.header,
    required this.expandedContent,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
  });

  /// The header widget that is always visible.
  final Widget header;

  /// The content widget that is shown when expanded.
  final Widget expandedContent;

  /// Whether the card is initially expanded.
  final bool initiallyExpanded;

  /// Callback when expansion state changes.
  final ValueChanged<bool>? onExpansionChanged;

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  void _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
    widget.onExpansionChanged?.call(isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedSize(
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.onSurface.withValues(alpha: 0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header with tap to expand
            InkWell(
              onTap: _toggleExpansion,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(child: widget.header),
                    _buildExpandButton(colorScheme),
                  ],
                ),
              ),
            ),

            // Expanded content
            if (isExpanded) ...[
              Divider(
                height: 1,
                color: colorScheme.onSurface.withValues(alpha: 0.1),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: widget.expandedContent,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildExpandButton(ColorScheme colorScheme) {
    return AnimatedRotation(
      turns: isExpanded ? 0.5 : 0,
      duration: const Duration(milliseconds: 200),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colorScheme.onSurface.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
