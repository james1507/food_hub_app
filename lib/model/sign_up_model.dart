import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

@freezed
class SignUpModel with _$SignUpModel {
  const factory SignUpModel({
    String? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, Object?> json) =>
      _$SignUpModelFromJson(json);
}
