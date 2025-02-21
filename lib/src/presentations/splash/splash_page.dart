import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_messaging/src/core/utils/assets.dart';
import 'package:whatsapp_messaging/src/presentations/splash/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Image.asset(
              AppAssets.background,
              height: 100,
            ),
          ),
        );
      },
    );
  }
}
