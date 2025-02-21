import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_messaging/my_observer.dart';
import 'package:whatsapp_messaging/src/app.dart';
import 'package:whatsapp_messaging/src/core/helpers/locale_helper.dart';
import 'package:whatsapp_messaging/src/locator.dart';
import 'package:whatsapp_messaging/src/theme/global_theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  await setupLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Locale savedLocale = await EasyLocalizationHelper.getSavedLocale();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/transalations',
      fallbackLocale: const Locale('ar'),
      startLocale: savedLocale,
      saveLocale: true,
      child: BlocProvider(
          create: (context) => GlobalThemeCubit(),
          child: const DirectChattingApp()),
    ),
  );
}
