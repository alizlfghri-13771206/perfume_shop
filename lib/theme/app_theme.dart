import 'package:flutter/material.dart';
import "package:material_color_utilities/hct/hct.dart";

class AppColors {
  static const bg = Color(0xFFFFFDFA);
  static const bgCard = Color(0xFFFFFFFF);
  static const bgSurface = Color(0xFFEFE9E1);
  static const gold = Color(0xFFA8793A);
  static const goldLight = Color(0xFFC49550);
  static const cream = Color(0xFF2C1F0E);
  static const creamDim = Color(0xFF7A6555);
  static const accent = Color(0xFF7A4A8B);
  static const accentLight = Color(0xFF9B6AAD);
  static const divider = Color(0xFFDDD4C8);
  static const success = Color(0xFF3D8A60);
  static const tag1 = Color(0xFFEDE4F5);
  static const tag2 = Color(0xFFDFF0E8);
  static const tag3 = Color(0xFFF5E4E4);
}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: const ColorScheme.light(
        primary: AppColors.gold,
        secondary: AppColors.accent,
        surface: AppColors.bgCard,
        onPrimary: AppColors.bg,
        onSurface: AppColors.cream,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bg,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.cream,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
        iconTheme: IconThemeData(color: AppColors.cream),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.bgCard,
        selectedItemColor: AppColors.gold,
        unselectedItemColor: AppColors.creamDim,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      fontFamily: 'serif',
      useMaterial3: true,
    );
  }
}
