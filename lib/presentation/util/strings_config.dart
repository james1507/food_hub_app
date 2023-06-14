import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StringConfigs {
  static Map<String, String Function(Object)> validationMessagesName(
      BuildContext context) {
    return {
      'required': (error) => 'shareValidationMessagesName'.tr(),
    };
  }

  static Map<String, String Function(Object)> validationMessagesEmail(
      BuildContext context) {
    return {
      'required': (error) => 'shareValidationMessagesEmailRequired'.tr(),
      'email': (error) => 'shareValidationMessagesEmailInvalid'.tr()
    };
  }

  static Map<String, String Function(Object)> validationMessagesPassword(
      BuildContext context) {
    return {
      'required': (error) => 'shareValidationMessagesPassword'.tr(),
      'minLength': (error) => 'shareValidationMessagesPasswordLength'.tr()
    };
  }

  static Map<String, String Function(Object)> validationMessagesPhone(
      BuildContext context) {
    return {
      'required': (error) => 'shareValidationMessagesPhone'.tr(),
      'minLength': (error) => 'shareValidationMessagesPhoneInvalid'.tr()
    };
  }

  static const translationPath1 = 'assets/translations';

  static const translationPath = 'lib/presentation/util/l18n';
}
