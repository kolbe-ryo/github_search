// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepoLanguage {
  String? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoLanguageCopyWith<RepoLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoLanguageCopyWith<$Res> {
  factory $RepoLanguageCopyWith(
          RepoLanguage value, $Res Function(RepoLanguage) then) =
      _$RepoLanguageCopyWithImpl<$Res, RepoLanguage>;
  @useResult
  $Res call({String? value});
}

/// @nodoc
class _$RepoLanguageCopyWithImpl<$Res, $Val extends RepoLanguage>
    implements $RepoLanguageCopyWith<$Res> {
  _$RepoLanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepoLanguageCopyWith<$Res>
    implements $RepoLanguageCopyWith<$Res> {
  factory _$$_RepoLanguageCopyWith(
          _$_RepoLanguage value, $Res Function(_$_RepoLanguage) then) =
      __$$_RepoLanguageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? value});
}

/// @nodoc
class __$$_RepoLanguageCopyWithImpl<$Res>
    extends _$RepoLanguageCopyWithImpl<$Res, _$_RepoLanguage>
    implements _$$_RepoLanguageCopyWith<$Res> {
  __$$_RepoLanguageCopyWithImpl(
      _$_RepoLanguage _value, $Res Function(_$_RepoLanguage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_RepoLanguage(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RepoLanguage extends _RepoLanguage {
  const _$_RepoLanguage([this.value]) : super._();

  @override
  final String? value;

  @override
  String toString() {
    return 'RepoLanguage(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepoLanguage &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepoLanguageCopyWith<_$_RepoLanguage> get copyWith =>
      __$$_RepoLanguageCopyWithImpl<_$_RepoLanguage>(this, _$identity);
}

abstract class _RepoLanguage extends RepoLanguage {
  const factory _RepoLanguage([final String? value]) = _$_RepoLanguage;
  const _RepoLanguage._() : super._();

  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_RepoLanguageCopyWith<_$_RepoLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}
