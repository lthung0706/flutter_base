import 'package:flutter/material.dart';
import 'color.dart';
import 'text.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColors.lightTheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: AppColors.slate50,
      cardColor: AppColors.lightTheme.surface,
      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightTheme.surface,
        foregroundColor: AppColors.lightTheme.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.displayMedium?.copyWith(
          color: AppColors.lightTheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      tabBarTheme: TabBarThemeData(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: AppColors.lightTheme.primary,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightTheme.primary.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.mutedForegroundLight,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      // Card Theme - Shadcn style with subtle border and minimal shadow
      cardTheme: CardThemeData(
        color: AppColors.lightTheme.surface,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: AppColors.lightTheme.outlineVariant),
        ),
        margin: const EdgeInsets.only(bottom: 12),
      ),
      primaryIconTheme: IconThemeData(color: AppColors.lightTheme.primary),
      primaryTextTheme: TextTheme(
        displayLarge: TextStyle(color: AppColors.black900),
        displayMedium: TextStyle(color: AppColors.black900),
        displaySmall: TextStyle(color: AppColors.black900),
        headlineLarge: TextStyle(color: AppColors.black900),
        headlineMedium: TextStyle(color: AppColors.black900),
        headlineSmall: TextStyle(color: AppColors.black900),
        titleLarge: TextStyle(color: AppColors.black900),
        titleMedium: TextStyle(color: AppColors.black900),
        titleSmall: TextStyle(color: AppColors.black900),
        bodyLarge: TextStyle(color: AppColors.black900),
        bodyMedium: TextStyle(color: AppColors.black900),
        bodySmall: TextStyle(color: AppColors.black900),
        labelLarge: TextStyle(color: AppColors.black900),
        labelMedium: TextStyle(color: AppColors.black900),
        labelSmall: TextStyle(color: AppColors.black900),
      ),
      // Elevated Button Theme - Standard primary button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightTheme.primary,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          elevation: 2,
          shadowColor: AppColors.lightTheme.primary.withValues(alpha: 0.3),
        ),
      ),

      // Outlined Button Theme - Shadcn secondary/outline variant
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.slate900,
          side: BorderSide(
            color: AppColors.lightTheme.outlineVariant,
            width: 1,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.lightTheme.primary,
          textStyle: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),

      // Segmented Button Theme - For login type selector
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.lightTheme.primary;
            }
            return AppColors.slate50;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.lightTheme.onPrimary;
            }
            return AppColors.slate700;
          }),
          side: WidgetStateProperty.all(
            BorderSide(color: AppColors.lightTheme.outlineVariant),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ),
      ),

      // Chip Theme - Shadcn badge style
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.slate100,
        labelStyle: TextStyle(
          color: AppColors.slate900,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: BorderSide.none,
      ),
      primaryColor: AppColors.lightTheme.primary,
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: TextStyle(color: AppColors.slate400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.lightTheme.outlineVariant),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.lightTheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.lightTheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.lightTheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.lightTheme.error, width: 2),
        ),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: AppColors.lightTheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // Icon Theme
      iconTheme: IconThemeData(color: AppColors.lightTheme.onSurface, size: 24),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightTheme.surface,
        selectedItemColor: AppColors.lightTheme.primary,
        unselectedItemColor: AppColors.black400,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.lightTheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        surfaceTintColor: Colors.transparent,
      ),

      // SnackBar Theme - Shadcn toast style
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.slate900,
        contentTextStyle: TextStyle(color: AppColors.slate50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.lightTheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.lightTheme.primary,
        foregroundColor: AppColors.lightTheme.onPrimary,
        elevation: 4,
        focusElevation: 6,
        hoverElevation: 8,
        highlightElevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        extendedTextStyle: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        extendedPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        extendedIconLabelSpacing: 8,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColors.darkColorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: AppColors.appBackgroundDark,
      cardColor: AppColors.cardBackgroundDark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkColorScheme.surface,
        foregroundColor: AppColors.darkColorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.displayMedium?.copyWith(
          color: AppColors.darkColorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      primaryColor: AppColors.darkColorScheme.primary,
      // TabBar Theme
      tabBarTheme: TabBarThemeData(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: AppColors.darkColorScheme.primary,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkColorScheme.primary.withValues(alpha: 0.5),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.mutedForegroundDark,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Card Theme - Shadcn style with border
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.darkColorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(bottom: 12),
      ),
      primaryIconTheme: IconThemeData(color: Colors.white),
      primaryTextTheme: TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
        headlineLarge: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        labelLarge: TextStyle(color: Colors.white),
        labelMedium: TextStyle(color: Colors.white),
        labelSmall: TextStyle(color: Colors.white),
      ),

      // Elevated Button Theme - Standard primary button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkColorScheme.primary,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          elevation: 2,
          shadowColor: AppColors.darkColorScheme.primary.withValues(alpha: 0.3),
        ),
      ),

      // Outlined Button Theme - Shadcn secondary/outline variant
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.accentForegroundDark,
          side: BorderSide(
            color: AppColors.darkColorScheme.outlineVariant,
            width: 1,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.darkColorScheme.primary,
          textStyle: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),

      // Segmented Button Theme - For login type selector
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.darkColorScheme.primary;
            }
            return AppColors.slate800;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.darkColorScheme.onPrimary;
            }
            return AppColors.slate300;
          }),
          side: WidgetStateProperty.all(
            BorderSide(color: AppColors.darkColorScheme.outlineVariant),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ),
      ),

      // Icon Button Theme
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.darkColorScheme.onSurface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        isDense: false,
        filled: true,
        fillColor: AppColors.darkColorScheme.surface,
        labelStyle: TextStyle(color: AppColors.black400),
        hintStyle: TextStyle(color: AppColors.black400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: AppColors.darkColorScheme.outlineVariant,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: AppColors.darkColorScheme.outlineVariant,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: AppColors.darkColorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.darkColorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: AppColors.darkColorScheme.error,
            width: 2,
          ),
        ),
      ),

      // Dropdown Menu Theme
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: AppColors.darkColorScheme.surface,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black200, width: 0.8),
          ),
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkColorScheme.primaryContainer,
        labelStyle: TextStyle(
          color: AppColors.darkColorScheme.onPrimaryContainer,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: AppColors.darkColorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: AppColors.darkColorScheme.onSurface,
        size: 24,
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkColorScheme.surface,
        selectedItemColor: AppColors.darkColorScheme.primary,
        unselectedItemColor: AppColors.black400,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.darkColorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.darkColorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkColorScheme.primary,
        foregroundColor: AppColors.darkColorScheme.onPrimary,
        elevation: 4,
        focusElevation: 6,
        hoverElevation: 8,
        highlightElevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        extendedTextStyle: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        extendedPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        extendedIconLabelSpacing: 8,
      ),
    );
  }
}
