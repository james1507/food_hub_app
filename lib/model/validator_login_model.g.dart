// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validator_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ValidatorLoginModel _$$_ValidatorLoginModelFromJson(
        Map<String, dynamic> json) =>
    _$_ValidatorLoginModel(
      status: json['status'] as bool?,
      emailError: json['emailError'] as String?,
      passwordError: json['passwordError'] as String?,
    );

Map<String, dynamic> _$$_ValidatorLoginModelToJson(
        _$_ValidatorLoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'emailError': instance.emailError,
      'passwordError': instance.passwordError,
    };
