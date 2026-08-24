import 'package:flutter/material.dart';
import 'package:report_person/src/theme/theme.dart';

import 'package:flutter/widget_previews.dart';

import '../components/inputs/app_text_field.dart';

PreviewThemeData themeData() => PreviewThemeData(
  materialLight: AppTheme.lightTheme,
  materialDark: AppTheme.darkTheme,
);

@Preview()
Widget lightThemePreview() {
  return MaterialApp(theme: AppTheme.lightTheme, home: const _ThemeShowcase());
}

@Preview()
Widget darkThemePreview() {
  return MaterialApp(theme: AppTheme.darkTheme, home: const _ThemeShowcase());
}

@Preview()
Widget textStylesPreview() {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Display Large',
              style: AppTheme.lightTheme.textTheme.displayLarge,
            ),
            Text(
              'Display Medium',
              style: AppTheme.lightTheme.textTheme.displayMedium,
            ),
            Text('Body Large', style: AppTheme.lightTheme.textTheme.bodyLarge),
            Text(
              'Body Medium',
              style: AppTheme.lightTheme.textTheme.bodyMedium,
            ),
            Text(
              'Label Small',
              style: AppTheme.lightTheme.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    ),
  );
}

@Preview()
Widget buttonsPreview() {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const SizedBox(height: 8),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: null, child: const Text('Disabled')),
          ],
        ),
      ),
    ),
  );
}

@Preview()
Widget cardsPreview() {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star),
                const SizedBox(height: 8),
                Text(
                  'Card Title',
                  style: AppTheme.lightTheme.textTheme.bodyLarge,
                ),
                Text(
                  'Card content',
                  style: AppTheme.lightTheme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

@Preview()
Widget inputFieldsPreview() {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          children: [
            AppTextField(
              label: 'Label',
              hint: 'Hint',
              icon: Icons.person,
              onChanged: (value) {},
            ),
            AppTextField(
              label: 'Label',
              hint: 'Hint',
              icon: Icons.person,
              onChanged: (value) {},
              obscureText: true,
            ),
          ],
        ),
      ),
    ),
  );
}

class _ThemeShowcase extends StatelessWidget {
  const _ThemeShowcase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Preview')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Styles
            Text(
              'Text Styles',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Display Large',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'Display Medium',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
            Text('Body Medium', style: Theme.of(context).textTheme.bodyMedium),
            Text('Label Small', style: Theme.of(context).textTheme.labelSmall),

            const SizedBox(height: 24),
            const Divider(),

            // Cards
            Text('Cards', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Icon(Icons.star),
                    Text(
                      'Card Title',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Card content',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Divider(),

            // Buttons
            Text('Buttons', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                const SizedBox(width: 8),
                TextButton(onPressed: () {}, child: const Text('Text')),
              ],
            ),

            const SizedBox(height: 24),
            const Divider(),

            // Input Fields
            Text(
              'Input Fields',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Input Field',
                hintText: 'Enter text...',
              ),
            ),

            const SizedBox(height: 16),

            // Icons
            Text('Icons', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.home),
                SizedBox(width: 16),
                Icon(Icons.search),
                SizedBox(width: 16),
                Icon(Icons.settings),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
