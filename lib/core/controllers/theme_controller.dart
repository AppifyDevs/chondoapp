import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:chondohealth/util/constants/colors.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CTheme extends GetxController {
  int _currentIndex = 0;

  late List<ThemeData> themeList = [_lightTheme, _darkTheme];

  ThemeData get currentTheme => themeList[_currentIndex];

  void updateTheme(int index) {
    _currentIndex = index;
    update();
  }

  late final ThemeData _lightTheme = ThemeData(
    fontFamily: 'Salsa',
    scaffoldBackgroundColor: PColors.backGroundColor,
    dividerColor: PColors.dividerColor,
    brightness: Brightness.light,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
    primaryColor: PColors.white,
    checkboxTheme: CheckboxThemeData(fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return PColors.primaryButtonColor;
      }
      return Colors.transparent;
    })),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: PColors.primaryButtonColor.withOpacity(0.8),
        secondary: PColors.primaryButtonColor,
        primary: PColors.primaryButtonColor,
        tertiary: PColors.primaryButtonColor.withOpacity(0.8),
        shadow: Colors.grey.withOpacity(0.1),
      ),
      highlightColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: PColors.border, // Used this as border color for light theme
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          BorderSide(
            color: PColors.border,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: PColors.border, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: PColors.border, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: PColors.border, width: 1),
      ),
      fillColor: Colors.white,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: PColors.border, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: PColors.border, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: PColors.border, width: 1),
      ),
      hintStyle: TextStyle(
        color: PColors.primaryTextColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: PColors.primaryTextColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: Colors.black.withOpacity(0.6),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: Color(0xFF007BFF),
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      displayLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      displayMedium: TextStyle(
        color: PColors.primaryButtonColor,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      //
    ),
  );

  late final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: PColors.backGroundColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      contentPadding: EdgeInsets.symmetric(horizontal: PTheme.paddingX),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(PTheme.boxRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(PTheme.boxRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(PTheme.boxRadius),
      ),
    ),
  );
}
