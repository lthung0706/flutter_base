import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// TextField with consistent styling for forms.
/// Renamed from AuthTextField to be reusable across the app.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.label,
    required this.hint,
    this.icon,
    required this.onChanged,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.suffix,
    this.suffixText,
    this.maxLines = 1,
    this.inputHeight,
    this.autofocus = false,
    this.initialValue,
    this.inputFormatters,
  });

  final String? label;
  final String hint;
  final IconData? icon;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final String? suffixText;
  final int maxLines;
  final double? inputHeight;
  final bool autofocus;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      if (oldWidget.controller == null) {
        _controller.dispose();
      }
      _controller = widget.controller ?? TextEditingController();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final labelStyle =
        theme.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: theme.colorScheme.onSurface,
        ) ??
        TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: theme.colorScheme.onSurface,
        );

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) Text(widget.label ?? '', style: labelStyle),
        const SizedBox(height: 6),
        SizedBox(
          height: widget.inputHeight,
          child: TextField(
            autofocus: widget.autofocus,
            cursorHeight: 14,
            cursorWidth: 1.5,
            cursorRadius: const Radius.circular(8),
            cursorColor: primaryColor,

            decoration: InputDecoration(
              hintText: widget.hint,
              prefixIcon: widget.icon != null
                  ? Icon(widget.icon, size: 20, color: primaryColor)
                  : null,
              suffixText: widget.suffixText,
              suffixIcon: widget.suffix,
            ),
            controller: _controller,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            textInputAction: widget.textInputAction,
            onChanged: widget.onChanged,
            maxLines: widget.maxLines,
            textAlignVertical: widget.inputHeight != null
                ? TextAlignVertical.center
                : null,
          ),
        ),
      ],
    );
  }
}
