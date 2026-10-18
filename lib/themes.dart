import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static const seedColor = Colors.blue;

  static ThemeData _build(Brightness brightness) {
    final colors = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );
    final interFont = GoogleFonts.inter().fontFamily;
    final funnelFont = GoogleFonts.funnelDisplay().fontFamily;
    final inter = ThemeData.from(colorScheme: colors).textTheme
        .apply(fontFamily: interFont);
    TextStyle? funnel(TextStyle? style) =>
        style?.copyWith(fontFamily: funnelFont);

    return ThemeData.from(
      colorScheme: colors,
      textTheme: inter.copyWith(
        displayLarge: funnel(inter.displayLarge),
        displayMedium: funnel(inter.displayMedium),
        displaySmall: funnel(inter.displaySmall),
        headlineLarge: funnel(inter.headlineLarge),
        headlineMedium: funnel(inter.headlineMedium),
        headlineSmall: funnel(inter.headlineSmall),
        titleLarge: funnel(inter.titleLarge),
        titleMedium: funnel(inter.titleMedium),
        titleSmall: funnel(inter.titleSmall),
      ),
    ).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colors.primaryContainer,
        foregroundColor: colors.onPrimaryContainer,
        titleTextStyle: GoogleFonts.funnelDisplay(
          color: colors.onPrimaryContainer,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceContainerHighest,
        border: const OutlineInputBorder(),
      ),
      cardTheme: CardThemeData(
        color: colors.surfaceContainer,
        surfaceTintColor: colors.primaryContainer,
      ),
      chipTheme: ChipThemeData.fromDefaults(
        secondaryColor: colors.secondary,
        labelStyle: inter.labelLarge!,
        brightness: brightness,
      ),
    );
  }

  static ThemeData get light => _build(Brightness.light);

  static ThemeData get dark => _build(Brightness.dark);
}
