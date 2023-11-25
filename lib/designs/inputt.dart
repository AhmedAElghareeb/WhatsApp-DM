import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Input extends StatelessWidget {
  const Input({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, bottom: 50.h),
      child: TextFormField(
        controller: controller,
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
                color: Colors.white,
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
