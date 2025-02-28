import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_messaging/src/core/helpers/locale_helper.dart';
import 'package:whatsapp_messaging/src/core/utils/app_colors.dart';
import 'package:whatsapp_messaging/src/core/widgets/appbar_widget.dart';
import 'package:whatsapp_messaging/src/core/widgets/global_button.dart';
import 'package:whatsapp_messaging/src/core/widgets/phone_field_widget.dart';
import 'package:whatsapp_messaging/src/presentations/home/cubit/home_cubit.dart';
import 'package:whatsapp_messaging/src/theme/global_theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context,
        isCenter: false,
        backgroundColor: (context.select(
                (GlobalThemeCubit cubit) => cubit.state == ThemeModeType.dark))
            ? AppColors.darkScaffoldColor
            : null,
        titlePadding: const EdgeInsetsDirectional.only(start: 20),
        title: 'home'.tr(),
        actions: [
          IconButton(
            onPressed: () async {
              await EasyLocalizationHelper.changeLanguage(
                context,
                locale: Config.isArabic(context)
                    ? const Locale('en')
                    : const Locale('ar'),
              );
            },
            icon: const Icon(
              Icons.language_rounded,
              color: AppColors.whiteColor,
            ),
          ),
          IconButton(
            onPressed: () => context.read<GlobalThemeCubit>().toggleTheme(),
            icon: const Icon(
              Icons.dark_mode_outlined,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16, vertical: 26),
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  PhoneFieldWidget(
                    controller: cubit.phoneController,
                    focusNode: cubit.phoneFocusNode,
                    initialSelection: cubit.selectedCountryCode.code,
                    onChanged: (value) => cubit.onSelectCountryCode(value),
                  ),
                  SizedBox(height: 30.h),
                  ButtonWidget<Future<void>>(
                    onPressed: () async => cubit.launchToWhatsApp(context),
                    title: 'continue'.tr(),
                    borderRadius: 10,
                    backgroundColor: (context.select((GlobalThemeCubit cubit) =>
                            cubit.state == ThemeModeType.dark))
                        ? AppColors.lightScaffoldColor
                        : AppColors.appBarColor,
                    fontColor: (context.select((GlobalThemeCubit cubit) =>
                            cubit.state == ThemeModeType.dark))
                        ? AppColors.blackColor
                        : null,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  SizedBox(height: 15.h),
                  ButtonWidget<Future<void>>(
                    onPressed: () async => cubit.launchToTelegram(context),
                    title: 'continueToTelegram'.tr(),
                    borderRadius: 10,
                    backgroundColor: (context.select((GlobalThemeCubit cubit) =>
                            cubit.state == ThemeModeType.dark))
                        ? AppColors.greyColor800
                        : AppColors.lightSecondaryColor,
                    fontColor: (context.select((GlobalThemeCubit cubit) =>
                            cubit.state == ThemeModeType.dark))
                        ? AppColors.whiteColor
                        : null,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
