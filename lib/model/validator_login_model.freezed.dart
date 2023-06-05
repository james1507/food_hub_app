// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validator_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValidatorLoginModel _$ValidatorLoginModelFromJson(Map<String, dynamic> json) {
  return _ValidatorLoginModel.fromJson(json);
}

/// @nodoc
mixin _$ValidatorLoginModel {
  bool? get status => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidatorLoginModelCopyWith<ValidatorLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidatorLoginModelCopyWith<$Res> {
  factory $ValidatorLoginModelCopyWith(
          ValidatorLoginModel value, $Res Function(ValidatorLoginModel) then) =
      _$ValidatorLoginModelCopyWithImpl<$Res, ValidatorLoginModel>;
  @useResult
  $Res call({bool? status, String? emailError, String? passwordError});
}

/// @nodoc
class _$ValidatorLoginModelCopyWithImpl<$Res, $Val extends ValidatorLoginModel>
    implements $ValidatorLoginModelCopyWith<$Res> {
  _$ValidatorLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValidatorLoginModelCopyWith<$Res>
    implements $ValidatorLoginModelCopyWith<$Res> {
  factory _$$_ValidatorLoginModelCopyWith(_$_ValidatorLoginModel value,
          $Res Function(_$_ValidatorLoginModel) then) =
      __$$_ValidatorLoginModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? emailError, String? passwordError});
}

/// @nodoc
class __$$_ValidatorLoginModelCopyWithImpl<$Res>
    extends _$ValidatorLoginModelCopyWithImpl<$Res, _$_ValidatorLoginModel>
    implements _$$_ValidatorLoginModelCopyWith<$Res> {
  __$$_ValidatorLoginModelCopyWithImpl(_$_ValidatorLoginModel _value,
      $Res Function(_$_ValidatorLoginModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(_$_ValidatorLoginModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValidatorLoginModel
    with DiagnosticableTreeMixin
    implements _ValidatorLoginModel {
  const _$_ValidatorLoginModel(
      {this.status, this.emailError, this.passwordError});

  factory _$_ValidatorLoginModel.fromJson(Map<String, dynamic> json) =>
      _$$_ValidatorLoginModelFromJson(json);

  @override
  final bool? status;
  @override
  final String? emailError;
  @override
  final String? passwordError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidatorLoginModel(status: $status, emailError: $emailError, passwordError: $passwordError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidatorLoginModel'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('emailError', emailError))
      ..add(DiagnosticsProperty('passwordError', passwordError));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidatorLoginModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, emailError, passwordError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidatorLoginModelCopyWith<_$_ValidatorLoginModel> get copyWith =>
      __$$_ValidatorLoginModelCopyWithImpl<_$_ValidatorLoginModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidatorLoginModelToJson(
      this,
    );
  }
}

abstract class _ValidatorLoginModel implements ValidatorLoginModel {
  const factory _ValidatorLoginModel(
      {final bool? status,
      final String? emailError,
      final String? passwordError}) = _$_ValidatorLoginModel;

  factory _ValidatorLoginModel.fromJson(Map<String, dynamic> json) =
      _$_ValidatorLoginModel.fromJson;

  @override
  bool? get status;
  @override
  String? get emailError;
  @override
  String? get passwordError;
  @override
  @JsonKey(ignore: true)
  _$$_ValidatorLoginModelCopyWith<_$_ValidatorLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}
