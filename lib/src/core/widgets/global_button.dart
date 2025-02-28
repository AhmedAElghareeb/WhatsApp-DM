import 'package:async_button_handler/async_button_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_messaging/src/core/utils/app_styles.dart';

class ButtonWidget<T> extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.loadingWidget,
    this.backgroundColor,
    this.shadowColor,
    this.elevation,
    this.borderColor,
    this.borderWidth,
    this.borderRadius = 16,
    this.padding,
    this.contentPadding,
    this.minimumSize = const Size(double.infinity, 52),
    this.fixedSize = const Size(double.infinity, 52),
    this.tapTargetSize,
    this.style,
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.decoration,
    this.height,
  });

  final T Function() onPressed;
  final Widget? loadingWidget;
  final Color? backgroundColor, shadowColor;
  final double? elevation;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final Size? minimumSize;
  final Size? fixedSize;
  final MaterialTapTargetSize? tapTargetSize;
  final String title;
  final TextStyle? style;
  final Color? fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final String? fontFamily;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AsyncButtonHandler(
      onPressed: onPressed,
      style: ButtonStyle(
        tapTargetSize: tapTargetSize,
        minimumSize: (minimumSize != null)
            ? WidgetStateProperty.all<Size>(
                minimumSize ?? Size(double.infinity, 50.h),
              )
            : null,
        fixedSize: (fixedSize != null)
            ? WidgetStateProperty.all<Size>(
                fixedSize ?? Size(double.infinity, 50.h),
              )
            : null,
        elevation: WidgetStateProperty.all<double?>(elevation ?? 0),
        shadowColor:
            WidgetStateProperty.all<Color>(shadowColor ?? Colors.transparent),
        backgroundColor: WidgetStateProperty.all<Color>(
            backgroundColor ?? Theme.of(context).primaryColor),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor ??
                  backgroundColor ??
                  Theme.of(context).primaryColor,
              width: borderWidth ?? 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
        ),
        padding: WidgetStatePropertyAll(padding ?? EdgeInsets.zero),
      ),
      loadingChild: SizedBox(
        height: 32.h,
        width: 32.w,
        child: loadingWidget ??
            CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(fontColor ?? Colors.white),
              strokeWidth: 1.5,
            ),
      ),
      widget: Padding(
        padding: contentPadding ?? EdgeInsets.zero,
        child: Text(
          title,
          style: (style ?? AppStyles.buttonStyle).copyWith(
            color: fontColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: decoration,
            fontFamily: fontFamily,
            height: height,
          ),
        ),
      ),
    );
  }
}
