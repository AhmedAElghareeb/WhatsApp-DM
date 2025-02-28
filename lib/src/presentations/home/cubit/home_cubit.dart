import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();

  CountryCode selectedCountryCode = CountryCode(
    code: '+20',
    dialCode: '+20',
    name: 'مصر',
    flagUri: 'flags/eg.png',
  );

  void onSelectCountryCode(CountryCode value) {
    debugPrint(value.code);
    debugPrint(value.name);
    debugPrint(value.dialCode);
    debugPrint(value.flagUri);
    selectedCountryCode = value;
  }

  void launchToWhatsApp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await _launchUrl(context);
      emit(WhatsAppState());
    }
  }

  Future<void> _launchUrl(BuildContext context) async {
    phoneFocusNode.unfocus();
    await launchUrlString(
      "https://wa.me/${selectedCountryCode.dialCode}${phoneController.text}",
    );
  }

  void launchToTelegram(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await _launchUrlTel(context);
      emit(TelegramState());
    }
  }

  Future<void> _launchUrlTel(BuildContext context) async {
    phoneFocusNode.unfocus();
    await launchUrlString(
      "https://t.me/${selectedCountryCode.dialCode}${phoneController.text}",
    );
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    phoneFocusNode.dispose();
    return super.close();
  }
}
