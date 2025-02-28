import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_messaging/src/core/helpers/locale_helper.dart';
import 'package:whatsapp_messaging/src/core/helpers/validators.dart';
import 'package:whatsapp_messaging/src/core/utils/app_colors.dart';
import 'package:whatsapp_messaging/src/core/utils/app_styles.dart';
import 'package:whatsapp_messaging/src/core/widgets/global_text_field_widget.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    this.readOnly,
    this.initialSelection,
    required this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool? readOnly;
  final String? initialSelection;
  final Function(CountryCode)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      label: 'phone'.tr(),
      hint: 'phone'.tr(),
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.phone,
      readOnly: readOnly ?? false,
      prefixIcon: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          CountryCodePicker(
            onChanged: onChanged,
            initialSelection: initialSelection ?? 'EG',
            favorite: const ['+20', 'EG'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            backgroundColor: AppColors.themeCardColor(context),
            dialogBackgroundColor: AppColors.themeCardColor(context),
            showFlag: true,
            showFlagDialog: true,
            padding: EdgeInsets.zero,
            flagWidth: 22.sp,
            boxDecoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: AppColors.themeWhiteColor(context)),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            searchStyle: AppStyles.grey300W500(context).copyWith(
              color: AppColors.themeBlackColor(context),
            ),
            textStyle: AppStyles.grey600W700(context).copyWith(
              fontSize: 14.sp,
              locale: Config.isArabic(context)
                  ? const Locale('en')
                  : const Locale('ar'),
              height: 1.5,
            ),
            headerText: 'selectCountry'.tr(),
            searchDecoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                child: Icon(
                  CupertinoIcons.search,
                  color: AppColors.primaryColor,
                  size: 18.sp,
                ),
              ),
              hintText: 'search'.tr(),
              hintStyle: AppStyles.grey600W700(context).copyWith(
                fontSize: 14.sp,
                height: 1,
              ),
              border: _border(context),
              enabledBorder: _border(context),
              focusedBorder: _border(context),
              errorBorder: _border(context),
              focusedErrorBorder: _border(context),
              disabledBorder: _border(context),
            ),
            closeIcon: Icon(
              Icons.close_outlined,
              color: AppColors.themeGrey400Color(context),
              size: 22.sp,
            ),
          ),
        ],
      ),
      validator: (value) => AppValidators.phoneValidator(value),
    );
  }

  OutlineInputBorder _border(context) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.themeGrey300Color(context)),
      );
}
