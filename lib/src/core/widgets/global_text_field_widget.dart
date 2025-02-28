
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_messaging/src/core/utils/app_colors.dart';
import 'package:whatsapp_messaging/src/core/utils/app_styles.dart';
import 'package:whatsapp_messaging/src/theme/global_theme_cubit.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.label,
    required this.hint,
    this.subLabel,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.enabled = true,
    this.fillColor,
    this.maxLines = 1,
    this.enableSuffixPadding = true,
    this.labelSpace,
    this.iconWidget,
  });

  final String label, hint;
  final String? subLabel;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final bool readOnly, enabled;
  final Color? fillColor;
  final int maxLines;
  final bool enableSuffixPadding;

  final double? labelSpace;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.grey800W700(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: labelSpace ?? 8.h),
        TextFormField(
          maxLines: maxLines,
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          inputFormatters: inputFormatters,
          cursorColor: AppColors.appBarColor,
          obscureText: isPassword,
          style: AppStyles.grey800W700(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          keyboardType: keyboardType,
          onTap: onTap,
          onChanged: onChanged,
          readOnly: readOnly,
          enabled: enabled,
          decoration: InputDecoration(
            filled: true,
            fillColor: (context.select((GlobalThemeCubit cubit) =>
                    cubit.state == ThemeModeType.dark)
                ? Theme.of(context).scaffoldBackgroundColor
                : AppColors.themeWhiteColor(context)),
            hintText: hint,
            hintStyle: AppStyles.grey600W700(context),
            errorStyle: AppStyles.grey300W500(context).copyWith(
              color: AppColors.errorColor,
              fontSize: 12.sp,
            ),
            errorMaxLines: 2,
            prefixIcon: prefixIcon,
            suffixIcon: Padding(
              padding: enableSuffixPadding
                  ? EdgeInsetsDirectional.only(end: 5.w)
                  : EdgeInsets.zero,
              child: suffixIcon,
            ),
            suffixIconConstraints: const BoxConstraints(),
            prefixIconConstraints: const BoxConstraints(),
            border: _border(context),
            enabledBorder: _border(context),
            focusedBorder: _border(context),
            errorBorder: _border(context),
            focusedErrorBorder: _border(context),
            disabledBorder: _border(context),
            icon: iconWidget,
          ),
        ),
        if (subLabel != null) SizedBox(height: 4.h),
        if (subLabel != null)
          Text(
            subLabel!,
            style: AppStyles.grey600W700(context).copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }

  OutlineInputBorder _border(context) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.themeBlackColor(context)),
      );
}
