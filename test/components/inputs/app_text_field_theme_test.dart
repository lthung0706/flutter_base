import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_base/src/components/inputs/app_text_field.dart';
import 'package:flutter_base/src/theme/color.dart';
import 'package:flutter_base/src/theme/theme.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('AppTextField uses theme primaryColor for prefix icon', (
    tester,
  ) async {
    const primaryColor = Colors.deepPurple;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: const ColorScheme.light(primary: Colors.orange),
        ),
        home: Scaffold(
          body: AppTextField(
            hint: 'Email',
            icon: Icons.mail,
            onChanged: (_) {},
          ),
        ),
      ),
    );

    final icon = tester.widget<Icon>(find.byIcon(Icons.mail));
    expect(icon.color, primaryColor);
  });

  testWidgets('AppTextField forwards suffixText and inputFormatters', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppTextField(
            hint: 'Min quantity',
            onChanged: (_) {},
            suffixText: 'kg',
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));

    expect(textField.decoration?.suffixText, 'kg');
    expect(textField.inputFormatters, hasLength(1));
  });

  test('dark input focusedBorder follows dark theme primary', () {
    final focusedBorder =
        AppTheme.darkTheme.inputDecorationTheme.focusedBorder
            as OutlineInputBorder;

    expect(focusedBorder.borderSide.color, AppColors.darkColorScheme.primary);
  });

  test('light theme primary and focusedBorder stay in sync', () {
    final focusedBorder =
        AppTheme.lightTheme.inputDecorationTheme.focusedBorder
            as OutlineInputBorder;

    expect(AppColors.primary600, const Color(0xFF1946C6));
    expect(AppColors.lightTheme.primary, AppColors.primary600);
    expect(AppTheme.lightTheme.primaryColor, AppColors.lightTheme.primary);
    expect(focusedBorder.borderSide.color, AppColors.lightTheme.primary);
  });

  test('shared neutral tokens stay in sync across light and dark themes', () {
    final lightEnabledBorder =
        AppTheme.lightTheme.inputDecorationTheme.enabledBorder
            as OutlineInputBorder;
    final darkEnabledBorder =
        AppTheme.darkTheme.inputDecorationTheme.enabledBorder
            as OutlineInputBorder;

    expect(AppTheme.lightTheme.scaffoldBackgroundColor, AppColors.slate50);
    expect(lightEnabledBorder.borderSide.color, AppColors.borderLight);
    expect(
      AppTheme.darkTheme.scaffoldBackgroundColor,
      AppColors.appBackgroundDark,
    );
    expect(
      darkEnabledBorder.borderSide.color,
      AppColors.darkColorScheme.outlineVariant,
    );
  });
}
