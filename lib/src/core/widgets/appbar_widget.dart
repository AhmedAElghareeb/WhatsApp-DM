import 'package:flutter/material.dart';

AppBar appBarWidget(
  BuildContext context, {
  String? title,
  Color? backgroundColor,
  bool isCenter = true,
  List<Widget>? actions,
  PreferredSizeWidget? bottom,
  double? toolbarHeight,
  EdgeInsetsGeometry? titlePadding,
  VoidCallback? onBack,
}) =>
    AppBar(
      title: Padding(
        padding: titlePadding ?? EdgeInsets.zero,
        child: Text(title ?? ''),
      ),
      centerTitle: isCenter,
      backgroundColor: backgroundColor,
      titleSpacing: 0,
      leadingWidth: 70,
      elevation: 0,
      toolbarHeight: toolbarHeight,
      actions: actions,
      bottom: bottom,
    );
