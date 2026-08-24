import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:app_intl/ez_intl.dart';

class BottomSelectionBar<T> extends StatelessWidget {
  const BottomSelectionBar({
    super.key,
    required this.selectedListenable,
    required this.onClear,
    this.onCheckout,
    required this.titleCreateOrder,
  });

  final ValueNotifier<List<T>> selectedListenable;
  final VoidCallback onClear;
  final VoidCallback? onCheckout;
  final String titleCreateOrder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<T>>(
      valueListenable: selectedListenable,
      builder: (context, selectedList, child) {
        return AnimatedScale(
          curve: Curves.easeOutBack,
          scale: selectedList.isEmpty ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          child: selectedList.isEmpty
              ? const SizedBox()
              : SizedBox(
                  child: Row(
                    spacing: 12,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showModal(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(context.l10n.clearSelectedProducts),
                              content: Text(
                                context.l10n.confirmClearSelectedProducts,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(context.l10n.cancel),
                                ),
                                TextButton(
                                  onPressed: () {
                                    onClear();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(context.l10n.clearAll),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(context.l10n.cancel),
                      ),
                      if (onCheckout != null)
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onCheckout,
                            child: Text(titleCreateOrder),
                          ),
                        ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
