import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_messaging/src/core/helpers/navigation.dart';
import 'package:whatsapp_messaging/src/core/utils/routes.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(context) => BlocProvider.of(context);

  void initializeSplash() async => await Future.wait([_handleSplash()]);

  Future<void> _handleSplash() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => NavigationRoutes.onPushReplacementNamed(route: AppRoutes.homePage),
    );
    emit(SplashDone());
  }
}
