import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_messaging/designs/inputt.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    this.initialSelection,
    required this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? initialSelection;
  final Function(CountryCode)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Input(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.phone,
      suffixIcon: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          CountryCodePicker(
            onChanged: onChanged,
            initialSelection: initialSelection ?? 'EG',
            favorite: const ['+20', 'EG'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            showFlag: true,
            showFlagDialog: true,
            padding: EdgeInsets.zero,
            flagWidth: 22.sp,
            boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [BoxShadow(color: Colors.black)],
            ),
            searchStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 1.5,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 1.5,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
            searchDecoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w, end: 5.w),
                child: Icon(
                  CupertinoIcons.search,
                  color: const Color(0xff25D366),
                  size: 18.sp,
                ),
              ),
              hintText: 'Search for your Country Code',
              hintStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
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
              color: Colors.white,
              size: 22.sp,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _border(context) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: const Color(0xff4D5F7A)),
      );
}