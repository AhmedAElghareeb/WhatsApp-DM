
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_messaging/src/core/utils/app_colors.dart';
import 'package:whatsapp_messaging/src/core/utils/assets.dart';

abstract class AppStyles {
  static TextStyle grey800W700(BuildContext context) => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        fontFamily: AppAssets.cairoFontFamily,
        color: AppColors.themeGrey800Color(context),
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle grey600W700(BuildContext context) => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        fontFamily: AppAssets.cairoFontFamily,
        color: AppColors.themeGrey600Color(context),
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle grey300W500(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        height: 1,
        fontFamily: AppAssets.cairoFontFamily,
        color: AppColors.themeGrey300Color(context),
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle grey400W700(BuildContext context) => TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        fontFamily: AppAssets.cairoFontFamily,
        color: AppColors.themeGrey400Color(context),
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle blackW500(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        height: 1,
        fontFamily: AppAssets.cairoFontFamily,
        color: AppColors.themeBlackColor(context),
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle whiteW500(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        height: 1,
        fontFamily: AppAssets.cairoFontFamily,
        color: AppColors.themeWhiteColor(context),
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle primaryStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    height: 1,
    fontFamily: AppAssets.cairoFontFamily,
    color: AppColors.primaryColor,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle buttonStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1,
    color: AppColors.whiteColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle appBarTitleStyle = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    fontFamily: AppAssets.cairoFontFamily,
  );
}
