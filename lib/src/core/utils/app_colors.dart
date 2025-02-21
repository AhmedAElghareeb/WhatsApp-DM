import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color lightScaffoldColor = Color(0xffF7F7F7);
  static const Color darkScaffoldColor = Color(0xff3D3D3D);
  static const Color appBarColor = Color(0xff757E8C);
  static const Color primaryColor = Color(0xff282828);
  static const Color lightSecondaryColor = Color(0xff4A425D);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;

  static const Color transparent = Colors.transparent;
  static const Color errorColor = Color(0xffA71919);

  static const Color lightCardColor = Colors.white;
  static const Color darkCardColor = Color(0xff282828);
  static const Color lightBorderColor = Color(0xffD9D9D9);
  static const Color greyColor800 = Color(0xff333F51);
  static const Color greyColor600 = Color(0xff4D5F7A);
  static const Color greyColor400 = Color(0xff757E8C);
  static const Color greyColor300 = Color(0xffBBC3CF);
  static const Color greyColor100 = Color(0xffEEF0F3);
  static const Color lightFillColor = Color(0xffEDEEF4);
  static const Color darkFillColor = Color(0xff5C5C5C);

  static Color themeScaffoldColor(context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color themeBlackColor(context) =>
      Theme.of(context).textTheme.displayLarge!.color!;

  static Color themeWhiteColor(context) =>
      Theme.of(context).textTheme.displayMedium!.color!;

  static Color themeGrey800Color(context) =>
      Theme.of(context).textTheme.bodyLarge!.color!;

  static Color themeGrey600Color(context) =>
      Theme.of(context).textTheme.bodyMedium!.color!;

  static Color themeGrey300Color(context) =>
      Theme.of(context).textTheme.displaySmall!.color!;

  static Color themeGrey400Color(context) =>
      Theme.of(context).textTheme.bodySmall!.color!;

  static Color themeCardColor(context) =>
      Theme.of(context).textTheme.labelSmall!.color!;
}
