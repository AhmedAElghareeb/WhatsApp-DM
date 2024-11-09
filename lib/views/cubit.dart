import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String url = '';

  CountryCode selected = CountryCode(
    code: 'EG',
    dialCode: '+20',
    name: 'مصر',
    flagUri: 'flags/eg.png',
  );

  void changeCountry(CountryCode countryCode) {
    selected = countryCode;
    emit(HomeSuccessState());
  }

  Future<void> launchUrl(BuildContext context) async {
    phoneFocus.unfocus();
    if (formKey.currentState!.validate()) {
      if (phoneController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Please Fill Phone Field!!",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ));
      } else {
        launchUrlString(
            "https://wa.me/${selected.dialCode}${phoneController.text}");
        emit(HomeSuccessState());
      }
    }
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    phoneFocus.dispose();
    return super.close();
  }
}