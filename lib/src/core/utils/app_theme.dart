
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_messaging/src/core/utils/app_colors.dart';
import 'package:whatsapp_messaging/src/core/utils/assets.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.primaryColor,
    fontFamily: AppAssets.cairoFontFamily,
    scaffoldBackgroundColor: AppColors.lightScaffoldColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarColor,
      toolbarHeight: 70,
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppAssets.cairoFontFamily,
      ),
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicatorColor: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.blackColor),
      displayMedium: TextStyle(color: AppColors.whiteColor),
      displaySmall: TextStyle(color: AppColors.greyColor300),
      bodyLarge: TextStyle(color: AppColors.greyColor800),
      bodyMedium: TextStyle(color: AppColors.greyColor600),
      bodySmall: TextStyle(color: AppColors.greyColor400),
      labelLarge: TextStyle(color: AppColors.lightBorderColor),
      labelMedium: TextStyle(color: AppColors.lightSecondaryColor),
      labelSmall: TextStyle(color: AppColors.lightCardColor),
      headlineLarge: TextStyle(color: AppColors.lightFillColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.primaryColor,
    fontFamily: AppAssets.cairoFontFamily,
    scaffoldBackgroundColor: AppColors.darkScaffoldColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarColor,
      toolbarHeight: 70,
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppAssets.cairoFontFamily,
      ),
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicatorColor: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.whiteColor),
      displayMedium: TextStyle(color: AppColors.blackColor),
      displaySmall: TextStyle(color: AppColors.greyColor600),
      bodyLarge: TextStyle(color: AppColors.whiteColor),
      bodyMedium: TextStyle(color: AppColors.greyColor100),
      bodySmall: TextStyle(color: AppColors.greyColor100),
      labelLarge: TextStyle(color: AppColors.whiteColor),
      labelMedium: TextStyle(color: AppColors.whiteColor),
      labelSmall: TextStyle(color: AppColors.darkCardColor),
      headlineLarge: TextStyle(color: AppColors.darkFillColor),
    ),
  );
}
