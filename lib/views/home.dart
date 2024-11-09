import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_messaging/designs/phone_input.dart';
import 'package:whatsapp_messaging/views/cubit.dart';
import '../designs/button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Stack(
        children: [
          Image.asset(
            "assets/background/background.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final cubit = HomeCubit.get(context);
                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PhoneFieldWidget(
                          controller: cubit.phoneController,
                          focusNode: cubit.phoneFocus,
                          onChanged: (value) => cubit.changeCountry(value),
                          initialSelection: cubit.selected.code,
                        ),
                        Button(
                          text: "Message Number",
                          isLoading: state is HomeLoadingState,
                          onTap: () => cubit.launchUrl(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
