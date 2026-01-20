import 'package:flutter/material.dart';

/// Design System Colors for Wasel App
/// Based on the provided color palette with Error, Primary, Secondary scales
/// and semantic text/background colors.
class AppColors {
  // ══════════════════════════════════════════════════════════════════════════
  // ERROR COLORS (Red Scale)
  // ══════════════════════════════════════════════════════════════════════════
  static const Color error50 = Color(0xFFFCEDED); // rgb(252, 237, 237)
  static const Color error100 = Color(0xFFF3B0BC); // rgb(243, 176, 188)
  static const Color error200 = Color(0xFFEC918B); // rgb(236, 145, 139)
  static const Color error300 = Color(0xFFE56E6E); // rgb(229, 110, 110)
  static const Color error400 = Color(0xFFDB5B50); // rgb(219, 91, 80)
  static const Color error500 = Color(0xFFD13933); // rgb(209, 57, 51)
  static const Color error600 = Color(0xFFB54423); // rgb(181, 68, 35)
  static const Color error700 = Color(0xFF9A381B); // rgb(154, 56, 27)
  static const Color error800 = Color(0xFF7C1A15); // rgb(124, 26, 21)
  static const Color error900 = Color(0xFF601510); // rgb(96, 21, 16)

  // ══════════════════════════════════════════════════════════════════════════
  // PRIMARY COLORS (Teal/Green Scale)
  // ══════════════════════════════════════════════════════════════════════════
  static const Color primary50 = Color(0xFFECECEE); // rgb(236, 236, 238)
  static const Color primary100 = Color(0xFFB2BEC0); // rgb(178, 190, 192)
  static const Color primary200 = Color(0xFF8E9EA0); // rgb(142, 158, 160)
  static const Color primary300 = Color(0xFF5C7878); // rgb(92, 120, 120)
  static const Color primary400 = Color(0xFF3B6866); // rgb(59, 104, 102)
  static const Color primary500 = Color(
    0xFF276860,
  ); // rgb(39, 104, 96) - Main Primary
  static const Color primary600 = Color(0xFF325858); // rgb(50, 88, 88)
  static const Color primary700 = Color(0xFF203C40); // rgb(32, 60, 64)
  static const Color primary800 = Color(0xFF222336); // rgb(34, 35, 54)
  static const Color primary900 = Color(0xFF211E28); // rgb(33, 30, 40)

  // ══════════════════════════════════════════════════════════════════════════
  // SECONDARY COLORS (Olive/Yellow-Green Scale)
  // ══════════════════════════════════════════════════════════════════════════
  static const Color secondary50 = Color(0xFFF4F7E8); // rgb(244, 247, 232)
  static const Color secondary100 = Color(0xFFE4E8CD); // rgb(228, 232, 205)
  static const Color secondary200 = Color(0xFFE8CD96); // rgb(232, 205, 150)
  static const Color secondary300 = Color(0xFFDECF89); // rgb(222, 207, 137)
  static const Color secondary400 = Color(0xFFC7BBC1); // rgb(199, 187, 193)
  static const Color secondary500 = Color(
    0xFFCDEA6C,
  ); // rgb(205, 234, 108) - Main Secondary
  static const Color secondary600 = Color(0xFFBFBB81); // rgb(191, 187, 129)
  static const Color secondary700 = Color(0xFF8C8F51); // rgb(140, 143, 81)
  static const Color secondary800 = Color(0xFF715E53); // rgb(113, 94, 83)
  static const Color secondary900 = Color(0xFF4B4736); // rgb(75, 71, 54)

  // ══════════════════════════════════════════════════════════════════════════
  // TEXT COLORS
  // ══════════════════════════════════════════════════════════════════════════
  static const Color textPrimary = Color(0xFF404040); // Dark Gray - Main text
  static const Color textSecondary = Color(
    0xFF474D5B,
  ); // Medium Gray - Secondary text
  static const Color textThird = Color(
    0xFF9C9C9C,
  ); // Light Gray - Tertiary/Hint text

  // ══════════════════════════════════════════════════════════════════════════
  // BACKGROUND & SURFACE COLORS
  // ══════════════════════════════════════════════════════════════════════════
  static const Color disabled = Color(0xFF9AA5A0); // Disabled state color
  static const Color bgLight = Color(0xFFF5F6F4); // Light background
  static const Color whiteCard = Color(0xFFFFFFFF); // Card background
  static const Color border = Color(0xFFE0E4E1); // Border color

  // ══════════════════════════════════════════════════════════════════════════
  // STATUS COLORS (Semantic)
  // ══════════════════════════════════════════════════════════════════════════
  static const Color success = Color(0xFF10B981); // Green for success
  static const Color warning = Color(0xFFF59E0B); // Orange for warning
  static const Color error = error500; // Use error500 as default
  static const Color info = Color(0xFF3B82F6); // Blue for info

  // ══════════════════════════════════════════════════════════════════════════
  // LEGACY/COMMON ALIASES
  // ══════════════════════════════════════════════════════════════════════════
  static const Color primary = primary500;
  static const Color primaryDark = primary700;
  static const Color primaryLight = primary300;

  static const Color secondary = secondary500;
  static const Color secondaryDark = secondary700;
  static const Color secondaryLight = secondary300;

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Dark Mode Specific Surfaces
  static const Color darkBg = Color(0xFF0B0F1A);
  static const Color darkSurface = Color(0xFF161B2B);
  static const Color darkCard = Color(0xFF1F2937);
  static const Color darkBorder = Color(0xFF2D3748);

  // Background & Surface
  static const Color background = bgLight;
  static const Color surface = whiteCard;

  // Legacy Text Colors (for compatibility)
  static const Color textHint = textThird;
  static const Color textWhite = white;

  // Divider
  static const Color divider = Color(0xFFF1F5F9);

  // Shadows
  static Color shadow = black.withOpacity(0.05);
  static Color shadowDark = black.withOpacity(0.2);

  // ══════════════════════════════════════════════════════════════════════════
  // COLOR SWATCHES (For MaterialColor usage)
  // ══════════════════════════════════════════════════════════════════════════
  static const MaterialColor primarySwatch =
      MaterialColor(0xFF276860, <int, Color>{
        50: primary50,
        100: primary100,
        200: primary200,
        300: primary300,
        400: primary400,
        500: primary500,
        600: primary600,
        700: primary700,
        800: primary800,
        900: primary900,
      });

  static const MaterialColor secondarySwatch =
      MaterialColor(0xFFCDEA6C, <int, Color>{
        50: secondary50,
        100: secondary100,
        200: secondary200,
        300: secondary300,
        400: secondary400,
        500: secondary500,
        600: secondary600,
        700: secondary700,
        800: secondary800,
        900: secondary900,
      });

  static const MaterialColor errorSwatch =
      MaterialColor(0xFFD13933, <int, Color>{
        50: error50,
        100: error100,
        200: error200,
        300: error300,
        400: error400,
        500: error500,
        600: error600,
        700: error700,
        800: error800,
        900: error900,
      });
}
