import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/enum.dart';
import '../utils/dimens.dart';
import 'crop_easy_text.dart';
import '../utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 

class AppTheme {
  static String darkTheme = APP_THEME_DARK;
  static String lightTheme = APP_THEME_LIGHT;
}

class CropEasyTheme {
  static String currentTheme = "";
  static ThemeData? _currentAppThemeData;

  static ThemeData setTheme(context, ThemeState theme) {
    currentTheme = theme.name;
    if (currentTheme == APP_THEME_LIGHT) {
      _currentAppThemeData = ThemeData(
        useMaterial3: false,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primary,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.accent10,
          selectionHandleColor: AppColors.accent,
        ),
        appBarTheme: AppBarTheme(
          elevation: 4,
          shadowColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(radiusX24))),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.primary,
          iconTheme: IconThemeData(color: AppColors.black),
          titleTextStyle: GoogleFonts.poppins(
              textStyle: getTextTheme(context).bodyTextLarge?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.black)),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: getElevatedButtonTheme(context),
        snackBarTheme: getSnackBarTheme(),
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.primarySwatch,
        ).copyWith(background: AppColors.white),
      );
    } else {
      _currentAppThemeData = ThemeData(
        useMaterial3: false,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primary,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.accent10,
          selectionHandleColor: AppColors.accent,
        ),
        appBarTheme: AppBarTheme(
          elevation: 4,
          shadowColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(radiusX24))),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.primary,
          iconTheme: IconThemeData(color: AppColors.black),
          titleTextStyle: GoogleFonts.poppins(
              textStyle: getTextTheme(context).bodyTextLarge?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.black)),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: getElevatedButtonTheme(context),
        snackBarTheme: getSnackBarTheme(),
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.primarySwatch,
        ).copyWith(background: AppColors.white),
      );
    }
    return _currentAppThemeData!;
  }

  static CropEasyTextTheme getTextTheme(context, {Color? textColor}) {
    textColor ??= AppColors.black;
    if (currentTheme == APP_THEME_LIGHT) {
      return CropEasyTextTheme(
          bodySubTitle: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: fontBodySubTitle,
              fontWeight: FontWeight.normal,
              color: textColor),
          bodyTextSmall: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: fontBodyTextSmall,
              fontWeight: FontWeight.normal,
              color: textColor),
          bodyTextMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: fontBodyTextMedium,
              fontWeight: FontWeight.normal,
              color: textColor),
          bodyTextLarge: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: fontBodyTextLarge,
              fontWeight: FontWeight.normal,
              color: textColor),
          headingSubTitle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: fontHeadingSubTitle,
              fontWeight: FontWeight.normal,
              color: textColor),
          headingSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: fontHeadingSmall,
              fontWeight: FontWeight.normal,
              color: textColor),
          headingXSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: fontHeadingXSmall,
              fontWeight: FontWeight.normal,
              color: textColor),
          headingMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: fontHeadingMedium,
              fontWeight: FontWeight.normal,
              color: textColor),
          headingXMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: fontHeadingXMedium,
              fontWeight: FontWeight.normal,
              color: textColor),
          headingLarge: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: fontHeadingLarge,
              fontWeight: FontWeight.normal,
              color: textColor));
    } else {
      return CropEasyTextTheme(
        bodySubTitle: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: fontBodySubTitle,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
        bodyTextSmall: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: fontBodyTextSmall,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
        bodyTextMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: fontBodyTextMedium,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
        bodyTextLarge: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: fontBodyTextLarge,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
        headingSubTitle: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: fontHeadingSubTitle,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
        headingSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: fontHeadingSmall,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
        headingXSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: fontHeadingXSmall,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
        headingMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: fontHeadingMedium,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
        headingXMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: fontHeadingXMedium,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
        headingLarge: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: fontHeadingLarge,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
      );
    }
  }

  static ElevatedButtonThemeData getElevatedButtonTheme(context,
      {backgroundColor, radius, fontSize}) {
    backgroundColor ??= AppColors.accent;
    radius ??= radiusX8;
    fontSize ??= fontBodyTextLarge;
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        textStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(fontSize: fontSize),
      ),
    );
  }

  static SnackBarThemeData getSnackBarTheme() {
    return SnackBarThemeData(
      backgroundColor: AppColors.red,
      contentTextStyle: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
