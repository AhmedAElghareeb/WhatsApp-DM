import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_messaging/observer.dart';
import 'package:whatsapp_messaging/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

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
          dialogBackgroundColor: Colors.black,
          textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          filledButtonTheme: FilledButtonThemeData(
            style: OutlinedButton.styleFrom(
              fixedSize: Size(
                250.w,
                60.h,
              ),
              backgroundColor: const Color(0xff25D366),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10.r),
              ),
              textStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        home: const Home(),
      ),
    );
  }
}
