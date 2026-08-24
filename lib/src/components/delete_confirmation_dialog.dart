import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'app_alert_dialog.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onDelete,
    this.isLoading = false,
    this.closeOnDelete = true,
    this.itemName,
  });

  final String title;
  final String message;
  final VoidCallback onDelete;
  final bool isLoading;
  final bool closeOnDelete;
  final String? itemName;

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      title: title,
      message: message,
      type: AppAlertDialogType.delete,
      style: AppAlertDialogStyle.standard,
      confirmText: context.l10n.delete,
      cancelText: context.l10n.cancel,
      isLoading: isLoading,
      closeOnConfirm: closeOnDelete,
      onConfirm: onDelete,
    );
  }
}
