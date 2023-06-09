import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StringConfigs {
  static Map<String, String Function(Object)> validationMessagesName(
      BuildContext context) {
    return {
      'required': (error) =>
          AppLocalizations.of(context)!.validationMessagesName,
    };
  }

  static Map<String, String Function(Object)> validationMessagesEmail(
      BuildContext context) {
    return {
      'required': (error) =>
          AppLocalizations.of(context)!.validationMessagesEmailRequired,
      'email': (error) =>
          AppLocalizations.of(context)!.validationMessagesEmailInvalid
    };
  }

  static Map<String, String Function(Object)> validationMessagesPassword(
      BuildContext context) {
    return {
      'required': (error) =>
          AppLocalizations.of(context)!.validationMessagesPassword,
      'minLength': (error) =>
          AppLocalizations.of(context)!.validationMessagesPasswordLength
    };
  }

  static Map<String, String Function(Object)> validationMessagesPhone(
      BuildContext context) {
    return {
      'required': (error) =>
          AppLocalizations.of(context)!.validationMessagesPhone,
      'minLength': (error) =>
          AppLocalizations.of(context)!.validationMessagesPhoneInvalid
    };
  }
}
