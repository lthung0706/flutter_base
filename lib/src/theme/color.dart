import 'package:flutter/material.dart';

class AppColors {
  static ColorScheme get lightTheme {
    return const ColorScheme.light(
      brightness: Brightness.light,
      // Màu chủ đạo
      primary: AppColors.primary600, // Màu primary cho light mode
      onPrimary: Colors.white, // Chữ màu trắng trên nền primary để nổi bật
      // Màu phụ (thường dùng cho các thành phần ít quan trọng hơn)
      secondary: AppColors.otherOrange,
      onSecondary: Colors.white,

      // Màu lỗi (dành cho các nút/trạng thái nguy hiểm, từ chối)
      error: AppColors.danger500,
      onError: Colors.white,

      surface: AppColors
          .grey0, // Màu của các thẻ (Card), dialog. Thường là màu trắng.
      onSurface: AppColors.typography500, // Màu chữ trên các thẻ
      // (Tùy chọn) Màu sắc cho các trạng thái khác
      tertiary: AppColors.warning500,
      onTertiary: Colors.white,
      outlineVariant: AppColors.borderLight,
    );
  }

  static ColorScheme get darkColorScheme {
    return ColorScheme.dark(
      brightness: Brightness.dark,

      // Brand colors - keep consistent
      primary: const Color(0xFF22C55E),
      onPrimary: Colors.white,

      secondary: AppColors.otherOrange,
      onSecondary: Colors.white,

      // Error colors
      error: AppColors.danger500,
      onError: Colors.white,

      // Dark backgrounds
      surface: AppColors.black850,
      onSurface: AppColors.black50,

      // Additional colors
      tertiary: AppColors.warning500,
      onTertiary: Colors.white,
      outlineVariant: AppColors.black50.withValues(alpha: 0.1),
    );
  }

  // Primary Colors - Xanh dương thương hiệu cho light mode
  static const Color primary50 = Color(0xFFEDF0FA);
  static const Color primary100 = Color(0xFFD6DEF5);
  static const Color primary200 = Color(0xFFB5C4ED);
  static const Color primary300 = Color(0xFF91A6E4);
  static const Color primary400 = Color(0xFF6785D9);
  static const Color primary500 = Color(0xFF3E64CF);
  static const Color primary600 = Color(0xFF1946C6);
  static const Color primary700 = Color(0xFF163EAE);
  static const Color primary800 = Color(0xFF133596);
  static const Color primary900 = Color(0xFF102B7B);

  // Typography/Text Colors - Từ Figma Design
  static const Color typography100 = Color(0xFF8C8B88);
  static const Color typography200 = Color(0xFF716A6A);
  static const Color typography300 = Color(0xFF797568);
  static const Color typography400 = Color(0xFF6B6150);
  static const Color typography500 = Color(0xFF3D3A33);

  // Grey Scale - Từ Figma Design
  static const Color grey0 = Color(0xFFFFFFFF);
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);

  // Black/Gray Scale (giữ lại cho tương thích)
  static const Color black50 = Color(0xFFF6F6F6);
  static const Color infer70 = Color(0xFFF3F3F3);
  static const Color infer100 = Color(0xFFE3E3E3);
  static const Color black200 = Color(0xFFCCCCCC);
  static const Color black400 = Color(0xFF888888);
  static const Color black500 = Color(0xFF666666);
  static const Color black700 = Color(0xFF525252);
  static const Color black800 = Color(0xFF313131);
  static const Color black850 = Color(0xFF2C2C2C);
  static const Color black900 = Color(0xFF0D0D0D);

  // Other Colors - Từ Figma Design
  static const Color otherRed = Color(0xFFE25B5B);
  static const Color otherYellow = Color(0xFFF3E542);
  static const Color otherBlue = Color(0xFF4AB0D4);
  static const Color otherGreen = Color(0xFF64D733);
  static const Color otherOrange = Color(0xFFE9712E);

  // Success Colors - Xanh lá riêng cho trạng thái thành công
  static const Color success50 = Color(0xFFE8F7E4);
  static const Color success100 = Color(0xFFD4EFC4);
  static const Color success200 = Color(0xFFB3E89C);
  static const Color success400 = Color(0xFF7BDE41);
  static const Color success500 = Color(0xFF64D71F);

  // Danger Colors - Đỏ từ Figma
  static const Color danger50 = Color(0xFFFCEBEB);
  static const Color danger100 = Color(0xFFF8D1D1);
  static const Color danger200 = Color(0xFFF1A3A3);
  static const Color danger400 = Color(0xFFE87F7F);
  static const Color danger500 = Color(0xFFE25B5B);

  // Warning Colors - Vàng từ Figma
  static const Color warning50 = Color(0xFFFEFCE8);
  static const Color warning100 = Color(0xFFFCF9D0);
  static const Color warning200 = Color(0xFFF9F3A1);
  static const Color warning400 = Color(0xFFF6EC71);
  static const Color warning500 = Color(0xFFF3E542);

  // Info Colors - Xanh dương từ Figma
  static const Color info50 = Color(0xFFE9F6FB);
  static const Color info100 = Color(0xFFD3EDF7);
  static const Color info200 = Color(0xFFA7DBEF);
  static const Color info400 = Color(0xFF7BC9E7);
  static const Color info500 = Color(0xFF4AB0D4);

  // ============================================
  // Shadcn-inspired Neutral Palette (Slate)
  // Modern enterprise management UI colors
  // ============================================
  static const Color slate50 = Color(0xFFF8FAFC);
  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate300 = Color(0xFFCBD5E1);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate900 = Color(0xFF0F172A);
  static const Color slate950 = Color(0xFF020617);

  // Border Colors (for consistent borders across components)
  static const Color borderLight = Color(0xFFE2E8F0); // slate200

  // Muted Colors (for subtle backgrounds and text)
  static const Color mutedLight = Color(0xFFF1F5F9); // slate100
  static const Color mutedForegroundLight = Color(0xFF64748B); // slate500
  static const Color mutedDark = Color(0xFF1E293B); // slate800
  static const Color mutedForegroundDark = Color(0xFF94A3B8); // slate400

  // App surface/background tokens
  static const Color appBackgroundDark = Color(0xFF18181B);
  static const Color cardBackgroundDark = Color(0xFF27272A);

  // Accent Colors (for hover/focus states)
  static const Color accentLight = Color(0xFFF1F5F9); // slate100
  static const Color accentForegroundLight = Color(0xFF0F172A); // slate900
  static const Color accentDark = Color(0xFF334155); // slate700
  static const Color accentForegroundDark = Color(0xFFF8FAFC); // slate50

  // Ring Color (for focus rings)
  static const Color ringLight = Color(0xFF94A3B8); // slate400
  static const Color ringDark = Color(0xFF64748B); // slate500
}
