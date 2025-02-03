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
    scaffoldBackgroundColor: PColors.backGroundColor,
    brightness: Brightness.light,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(backgroundColor: PColors.appBarColor),
    primaryColor: PColors.white,
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFFF508C),
        secondary: const Color(0xFFFF508C),
        tertiary: Colors.white,
        shadow: Colors.grey.withOpacity(0.1),
      ),
      highlightColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: PColors.border, // Used this as border color for light theme
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: const Color(0xFF8391A1).withOpacity(0.1), width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: const Color(0xFF8391A1).withOpacity(0.1), width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: const Color(0xFF8391A1).withOpacity(0.1), width: 0.5),
      ),
      fillColor: Colors.white,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: const Color(0xFF8391A1).withOpacity(0.1), width: 0.5),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: const Color(0xFF8391A1).withOpacity(0.1), width: 0.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(PTheme.boarderRadius),
        ),
        borderSide: BorderSide(color: const Color(0xFF8391A1).withOpacity(0.1), width: 0.5),
      ),
      hintStyle: TextStyle(
        color: const Color(0xFFA0A0A0),
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
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
