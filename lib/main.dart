import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'views/home.dart';



void main() {
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        400,
        900,
      ),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(
              0xff25D366,
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: OutlinedButton.styleFrom(
                minimumSize: Size(250.w, 50.h,),
                backgroundColor: const Color(
                  0xff25D366,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(
                    10.r,
                  ),
                ),
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
        ),
        home: Home(),
      ),
    );
  }
}
