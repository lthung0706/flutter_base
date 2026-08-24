import 'package:flutter/material.dart';
import 'package:app_intl/ez_intl.dart';

class BottomConfirm extends StatelessWidget {
  const BottomConfirm({super.key, this.onCancel, this.onConfirm});

  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel ?? () => Navigator.maybePop(context),
            child: Text(context.l10n.cancel),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: onConfirm,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_rounded, size: 18),
                const SizedBox(width: 8),
                Text(context.l10n.save),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
