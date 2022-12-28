import 'package:flutter/material.dart';
import 'package:gaude/src/shared/shared.dart';

abstract class AppTheme {
  static final primarySwatch = MaterialColor(
    AppColors.violet.value,
    {
      50: AppColors.violet20.withOpacity(0.25),
      100: AppColors.violet20.withOpacity(0.5),
      200: AppColors.violet20,
      300: AppColors.violet40.withOpacity(0.5),
      400: AppColors.violet40,
      500: AppColors.violet60.withOpacity(0.5),
      600: AppColors.violet60,
      700: AppColors.violet80.withOpacity(0.5),
      800: AppColors.violet80,
      900: AppColors.violet,
    },
  );

  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? AppColors.light60
        : AppColors.dark60;
  }

  static Color getBaseColor(
    BuildContext context, {
    ColorShade shade = ColorShade.shade100,
  }) {
    switch (shade) {
      case ColorShade.shade20:
        return getBaseColor20(context);
      case ColorShade.shade40:
        return getBaseColor40(context);
      case ColorShade.shade60:
        return getBaseColor60(context);
      case ColorShade.shade80:
        return getBaseColor80(context);
      case ColorShade.shade100:
        return getBaseColor100(context);
    }
  }

  static Color getBaseColor20(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? AppColors.light20
        : AppColors.dark20;
  }

  static Color getBaseColor40(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? AppColors.light40
        : AppColors.dark40;
  }

  static Color getBaseColor60(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? AppColors.light60
        : AppColors.dark60;
  }

  static Color getBaseColor80(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? AppColors.light80
        : AppColors.dark80;
  }

  static Color getBaseColor100(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? AppColors.light
        : AppColors.dark;
  }

  static Color getSolidTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? AppColors.dark
        : AppColors.light;
  }

  static Color getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? AppColors.dark40
        : AppColors.light40;
  }
}

enum ColorShade { shade20, shade40, shade60, shade80, shade100 }
