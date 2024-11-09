import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    this.controller,
    this.focusNode,
    this.suffixIcon,
    this.enableSuffixPadding = true,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool enableSuffixPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.w,
        vertical: 50.h,
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              borderSide: const BorderSide(
                color: Color(
                  0xff25D366,
                ),
              )),
          filled: true,
          fillColor: Colors.black,
          errorStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: enableSuffixPadding
                ? EdgeInsetsDirectional.only(end: 5.w)
                : EdgeInsets.zero,
            child: suffixIcon,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              borderSide: const BorderSide(
                color: Color(
                  0xff25D366,
                ),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              borderSide: const BorderSide(
                color: Color(
                  0xff25D366,
                ),
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              borderSide: const BorderSide(
                color: Colors.red,
              )),
          labelText: "Write WhatsApp Number...",
          labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}