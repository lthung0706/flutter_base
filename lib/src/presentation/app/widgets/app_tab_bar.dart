import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar({
    required this.tabs,
    super.key,
    this.controller,
    this.isScrollable = false,
    this.tabAlignment,
    this.padding = EdgeInsets.zero,
    this.onTap,
    this.indicatorColor,
  });

  final List<Widget> tabs;
  final TabController? controller;
  final bool isScrollable;
  final TabAlignment? tabAlignment;
  final EdgeInsetsGeometry padding;
  final ValueChanged<int>? onTap;
  final Color? indicatorColor;

  // TabBar yêu cầu các phần tử là Tab. Caller có thể truyền Tab(text:...)
  // hoặc một widget tuỳ biến (vd _buildTab trả về Padding(Text(...))),
  // nên ở đây tự động bọc widget thường vào Tab(child: widget).
  List<Widget> get _resolvedTabs => tabs.map((widget) {
        if (widget is Tab) return widget;
        return Tab(child: widget);
      }).toList();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final effectiveIndicatorColor =
        indicatorColor ?? colorScheme.primary.withValues(alpha: 0.15);

    return Padding(
      padding: padding,
      child: Container(
        height: 52,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: TabBar(
            controller: controller,
            tabs: _resolvedTabs,
            isScrollable: isScrollable,
            tabAlignment: tabAlignment,
            onTap: onTap,
            dividerColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.zero,
            indicator: BoxDecoration(
              color: effectiveIndicatorColor,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .08),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            labelColor: colorScheme.primary,
            unselectedLabelColor: colorScheme.onSurfaceVariant,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
