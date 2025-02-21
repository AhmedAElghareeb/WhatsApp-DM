import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_messaging/src/core/helpers/navigation.dart';
import 'package:whatsapp_messaging/src/core/utils/app_theme.dart';
import 'package:whatsapp_messaging/src/core/utils/router.dart';
import 'package:whatsapp_messaging/src/core/utils/routes.dart';
import 'package:whatsapp_messaging/src/theme/global_theme_cubit.dart';

class DirectChattingApp extends StatelessWidget {
  const DirectChattingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocBuilder<GlobalThemeCubit, ThemeModeType>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Direct Chatting',
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationRoutes.navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: (state == ThemeModeType.light)
                ? ThemeMode.light
                : ThemeMode.dark,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: widget!,
              );
            },
            initialRoute: AppRoutes.splashPage,
            onGenerateRoute: AppRouter.generateRoute,
            onGenerateInitialRoutes: (initialRoute) =>
                AppRouter.generateInitialRoutes(initialRoute),
          );
        },
      ),
    );
  }
}
