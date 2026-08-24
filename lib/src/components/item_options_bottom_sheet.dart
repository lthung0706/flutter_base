import 'package:animations/animations.dart';
import 'package:app_intl/ez_intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/url_helper.dart';
import 'delete_confirmation_dialog.dart';

/// A data class representing an info row in the bottom sheet.
class ItemInfoRow {
  const ItemInfoRow({required this.icon, required this.label, this.value});

  final IconData icon;
  final String label;
  final String? value;
}

/// Shows a bottom sheet with item information, edit and delete options.
///
/// Used for Supplier, Warehouse, and Store items.
void showItemOptionsBottomSheet({
  required BuildContext context,
  required String name,
  String? imageUrl,
  required String svgFallback,
  required List<ItemInfoRow> infoRows,
  required VoidCallback? onEdit,
  required VoidCallback? onDelete,
  required VoidCallback? onUpdateAvatar,
  required String deleteConfirmMessage,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (ctx) => _ItemOptionsSheet(
      name: name,
      imageUrl: imageUrl,
      svgFallback: svgFallback,
      infoRows: infoRows,
      onEdit: onEdit,
      onDelete: onDelete,
      onUpdateAvatar: onUpdateAvatar,
      deleteConfirmMessage: deleteConfirmMessage,
    ),
  );
}

class _ItemOptionsSheet extends StatelessWidget {
  const _ItemOptionsSheet({
    required this.name,
    this.imageUrl,
    required this.svgFallback,
    required this.infoRows,
    required this.onEdit,
    required this.onDelete,
    required this.deleteConfirmMessage,
    required this.onUpdateAvatar,
  });

  final String name;
  final String? imageUrl;
  final String svgFallback;
  final List<ItemInfoRow> infoRows;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onUpdateAvatar;
  final String deleteConfirmMessage;

  static const double _avatarSize = 48;
  static const double _horizontalPadding = 20;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            _buildDragHandle(colorScheme),
            const SizedBox(height: 16),

            // Toàn bộ nội dung dùng chung 1 mức padding ngang duy nhất,
            // tránh việc mỗi section tự khai báo `horizontal: 20` riêng.
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  _buildHeader(context, theme, colorScheme),
                  if (infoRows.isNotEmpty)
                    _buildInfoSection(context, theme, colorScheme),
                  _buildActionButtons(context, colorScheme),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDragHandle(ColorScheme colorScheme) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  /// Header: avatar bên trái, tên + nút đổi ảnh bên phải.
  ///
  /// Dùng `crossAxisAlignment: center` để avatar luôn thẳng hàng tâm với
  /// khối text, bất kể tên dài hay ngắn. Nút "Change image" bọc trong
  /// `Padding.zero` + `MaterialTapTargetSize.shrinkWrap` để loại bỏ padding
  /// mặc định của `TextButton`, giúp nó thẳng hàng lề trái với `Text` tên
  /// thay vì bị thụt lệch do padding nội tại của button.
  Widget _buildHeader(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: _buildAvatar(colorScheme),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              if (onUpdateAvatar != null)
                SizedBox(
                  height: 20,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        onUpdateAvatar?.call();
                      },
                      child: Text(
                        context.l10n.changeImage,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(ColorScheme colorScheme) {
    if (UrlHelper.isValidUrl(imageUrl)) {
      return ExtendedImage(
        image: CachedNetworkImageProvider(imageUrl!, errorListener: (_) {}),
        width: _avatarSize,
        height: _avatarSize,
        fit: BoxFit.cover,
      );
    }
    return SvgPicture.asset(
      svgFallback,
      width: _avatarSize,
      height: _avatarSize,
      colorFilter: ColorFilter.mode(
        colorScheme.onSurfaceVariant,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildInfoSection(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          for (int i = 0; i < infoRows.length; i++) ...[
            _buildInfoTile(context, theme, infoRows[i]),
            if (i < infoRows.length - 1)
              Divider(
                height: 1,
                indent: 52,
                color: colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoTile(BuildContext context, ThemeData theme, ItemInfoRow row) {
    final hasValue = row.value != null && row.value!.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Icon(row.icon, size: 20, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  row.label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  hasValue ? row.value! : context.l10n.noInformation,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: hasValue
                        ? theme.colorScheme.onSurface
                        : theme.hintColor,
                    fontStyle: hasValue ? null : FontStyle.italic,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, ColorScheme colorScheme) {
    final actions = <Widget>[];

    if (onEdit != null) {
      actions.add(
        Expanded(
          child: FilledButton.tonalIcon(
            onPressed: () {
              Navigator.of(context).pop();
              onEdit?.call();
            },
            icon: const Icon(Icons.edit_outlined, size: 20),
            label: Text(context.l10n.edit),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      );
    }

    if (onDelete != null) {
      if (actions.isNotEmpty) {
        actions.add(const SizedBox(width: 12));
      }
      actions.add(
        Expanded(
          child: FilledButton.icon(
            onPressed: () {
              final navigator = Navigator.of(context);
              navigator.pop();
              _showDeleteConfirmation(navigator.context);
            },
            icon: const Icon(Icons.delete_outline, size: 20),
            label: Text(context.l10n.delete),
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.error,
              foregroundColor: colorScheme.onError,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      );
    }

    if (actions.isEmpty) return const SizedBox.shrink();

    return Row(children: actions);
  }

  void _showDeleteConfirmation(BuildContext context) {
    showModal(
      context: context,
      builder: (ctx) => DeleteConfirmationDialog(
        title: context.l10n.delete,
        message: deleteConfirmMessage,
        onDelete: onDelete!,
      ),
    );
  }
}