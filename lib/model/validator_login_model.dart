import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'validator_login_model.freezed.dart';
part 'validator_login_model.g.dart';

@freezed
class ValidatorLoginModel with _$ValidatorLoginModel {
  const factory ValidatorLoginModel({
    bool? status,
    String? emailError,
    String? passwordError,
  }) = _ValidatorLoginModel;

  factory ValidatorLoginModel.fromJson(Map<String, Object?> json) =>
      _$ValidatorLoginModelFromJson(json);
}
