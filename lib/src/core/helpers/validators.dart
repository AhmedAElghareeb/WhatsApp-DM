import 'package:easy_localization/easy_localization.dart';
import 'package:whatsapp_messaging/src/core/helpers/extensions.dart';

abstract class AppValidators {
  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone_empty'.tr();
    } else if (value.length > 15) {
      return "phone_invalid".tr();
    } else if (!value.isValidPhone) {
      return 'phone_invalid'.tr();
    }
    return null;
  }
}
