import 'package:flutter/material.dart';

class AccountMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color iconBgColor;
  final Color? textColor;
  final bool hideChevron;
  final String? subtitle;
  final VoidCallback? onTap;

  const AccountMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.iconBgColor,
    this.textColor,
    this.hideChevron = false,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(fontSize: 13, color: Colors.grey[500]),
            )
          : null,
      trailing: hideChevron
          ? null
          : const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      onTap: onTap,
    );
  }
}
