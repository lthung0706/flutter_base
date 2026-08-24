import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin BottomSheetMixin {
  Future<T?> showAppCupertinoSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showCupertinoSheet(
      context: context,
      scrollableBuilder: (BuildContext context, ScrollController controller) => builder(context),
    );
  }

  Future<T?> showCustomBottomSheet<T>({
    required BuildContext context,
    required Widget title,
    required Widget content,
    bool isScrollControlled = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: _buildBottomSheetContent(context, title, content),
        );
      },
    );
  }

  Widget _buildBottomSheetContent(
    BuildContext context,
    Widget title,
    Widget content,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: const EdgeInsets.all(16.0), child: title),
        Expanded(child: content),
      ],
    );
  }
}
