import 'package:flutter/widget_previews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/theme/theme.dart';

import 'bottom_confirm.dart';
import 'add_button_placeholder.dart';

// ============================================
// BottomConfirm Previews
// ============================================

@Preview()
Widget bottomConfirmPreview() {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Light Mode',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            BottomConfirm(onCancel: () {}, onConfirm: () {}),
          ],
        ),
      ),
    ),
  );
}

@Preview()
Widget bottomConfirmDarkPreview() {
  return MaterialApp(
    theme: AppTheme.darkTheme,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dark Mode',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            BottomConfirm(onCancel: () {}, onConfirm: () {}),
          ],
        ),
      ),
    ),
  );
}

// ============================================
// AddButtonPlaceholder Previews
// ============================================

@Preview()
Widget addButtonPlaceholderPreview() {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: AddButtonPlaceholder(onTap: () {}),
        ),
      ),
    ),
  );
}

@Preview()
Widget addButtonPlaceholderDarkPreview() {
  return MaterialApp(
    theme: AppTheme.darkTheme,
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: AddButtonPlaceholder(onTap: () {}),
        ),
      ),
    ),
  );
}

// ============================================
// Button Style Previews
// ============================================

@Preview()
Widget elevatedButtonPreview() {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'ElevatedButton - Light',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Primary Button'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('With Icon'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: null, child: const Text('Disabled')),
          ],
        ),
      ),
    ),
  );
}

@Preview()
Widget outlinedButtonPreview() {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'OutlinedButton - Light',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Secondary Button'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.cancel),
              label: const Text('With Icon'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(onPressed: null, child: const Text('Disabled')),
          ],
        ),
      ),
    ),
  );
}

@Preview()
Widget elevatedButtonDarkPreview() {
  return MaterialApp(
    theme: AppTheme.darkTheme,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'ElevatedButton - Dark',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Primary Button'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('With Icon'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: null, child: const Text('Disabled')),
          ],
        ),
      ),
    ),
  );
}

@Preview()
Widget outlinedButtonDarkPreview() {
  return MaterialApp(
    theme: AppTheme.darkTheme,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'OutlinedButton - Dark',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Secondary Button'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.cancel),
              label: const Text('With Icon'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(onPressed: null, child: const Text('Disabled')),
          ],
        ),
      ),
    ),
  );
}
