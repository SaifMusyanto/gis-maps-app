import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class AppThemeData {
  static ThemeData getTheme(BuildContext context) {
    const primaryColor = AppColors.primary50;
    final primaryColorMap = <int, Color>{
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };
    final primaryMaterialColor =
        MaterialColor(primaryColor.value, primaryColorMap);

    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      primarySwatch: primaryMaterialColor,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryMaterialColor),
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.background,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
      ),
      iconTheme: IconThemeData(size: 6.w, color: AppColors.grey50),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        overlayColor: WidgetStateProperty.all(AppColors.primary10),
        height: 52,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.plusJakartaSans(
                color: AppColors.grey90,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                height: 0.64);
          }
          return GoogleFonts.plusJakartaSans(
              color: AppColors.grey20,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 0.64);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary50, size: 20);
          }
          return const IconThemeData(color: AppColors.grey20, size: 20);
        }),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        displaySmall: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        labelLarge: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: GoogleFonts.plusJakartaSans(
          color: AppColors.grey90,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
