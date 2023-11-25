import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarDesign extends StatelessWidget {
  const AppbarDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: 150.h
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WhatsApp Direct Message",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          CircleAvatar(
            radius: 30.r,
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.phone_enabled,
                size: 25.r,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}