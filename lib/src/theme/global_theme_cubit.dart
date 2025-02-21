import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_messaging/src/core/helpers/cache_data.dart';

part 'global_theme_state.dart';

enum ThemeModeType { light, dark }

class GlobalThemeCubit extends Cubit<ThemeModeType> {
  GlobalThemeCubit() : super(ThemeModeType.light) {
    _loadThemeFromCache();
  }

  void toggleTheme() {
    debugPrint('toggleTheme => $state');
    emit(state == ThemeModeType.light
        ? ThemeModeType.dark
        : ThemeModeType.light);
    CacheHelper.setBoolData(
      key: 'theme',
      value: state == ThemeModeType.light ? false : true,
    );
  }

  void _loadThemeFromCache() async {
    final bool isDarkThemeEnabled =
        CacheHelper.getBoolData(key: 'theme') ?? false;
    if (isDarkThemeEnabled) {
      emit(ThemeModeType.dark);
    } else {
      emit(ThemeModeType.light);
    }
  }
}
