import 'package:flutter/material.dart';

class AddButtonPlaceholder extends StatelessWidget {
  const AddButtonPlaceholder({
    super.key,
    required this.onTap,
    this.size = 32,
    this.borderRadius = 8,
  });

  final VoidCallback onTap;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Center(
          child: Icon(
            Icons.add,
            size: size,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
