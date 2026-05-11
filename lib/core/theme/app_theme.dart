import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const _seedColor = Color(0xFF5C6BC0);
  static const _charcoal = Color(0xFF1A1A2E);
  static const _slateGray = Color(0xFF64748B);

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
      surface: const Color(0xFFF8F9FF),
      onSurface: _charcoal,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.lexendTextTheme().apply(
        bodyColor: _charcoal,
        displayColor: _charcoal,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFFF8F9FF),
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.lexend(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: _charcoal,
        ),
        iconTheme: const IconThemeData(color: _charcoal),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: _seedColor.withValues(alpha: 0.08),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      scaffoldBackgroundColor: const Color(0xFFF8F9FF),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _seedColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintStyle: GoogleFonts.lexend(color: _slateGray, fontSize: 14),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: _seedColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.lexend(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
      surface: const Color(0xFF0F0F1A),
      onSurface: const Color(0xFFE8EAFF),
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.lexendTextTheme().apply(
        bodyColor: const Color(0xFFE8EAFF),
        displayColor: const Color(0xFFE8EAFF),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF0F0F1A),
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.lexend(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFE8EAFF),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFE8EAFF)),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: const Color(0xFF1C1C30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF0F0F1A),
        elevation: 0,
      ),
      scaffoldBackgroundColor: const Color(0xFF0F0F1A),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1C1C30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: _seedColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintStyle: GoogleFonts.lexend(color: _slateGray, fontSize: 14),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: _seedColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.lexend(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
    );
  }
}
