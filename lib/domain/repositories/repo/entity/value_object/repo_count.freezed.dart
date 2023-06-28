// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepoCount {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoCountCopyWith<RepoCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoCountCopyWith<$Res> {
  factory $RepoCountCopyWith(RepoCount value, $Res Function(RepoCount) then) =
      _$RepoCountCopyWithImpl<$Res, RepoCount>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$RepoCountCopyWithImpl<$Res, $Val extends RepoCount>
    implements $RepoCountCopyWith<$Res> {
  _$RepoCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepoCountCopyWith<$Res> implements $RepoCountCopyWith<$Res> {
  factory _$$_RepoCountCopyWith(
          _$_RepoCount value, $Res Function(_$_RepoCount) then) =
      __$$_RepoCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$_RepoCountCopyWithImpl<$Res>
    extends _$RepoCountCopyWithImpl<$Res, _$_RepoCount>
    implements _$$_RepoCountCopyWith<$Res> {
  __$$_RepoCountCopyWithImpl(
      _$_RepoCount _value, $Res Function(_$_RepoCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_RepoCount(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RepoCount extends _RepoCount {
  const _$_RepoCount([this.value = 0]) : super._();

  @override
  @JsonKey()
  final int value;

  @override
  String toString() {
    return 'RepoCount(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepoCount &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepoCountCopyWith<_$_RepoCount> get copyWith =>
      __$$_RepoCountCopyWithImpl<_$_RepoCount>(this, _$identity);
}

abstract class _RepoCount extends RepoCount {
  const factory _RepoCount([final int value]) = _$_RepoCount;
  const _RepoCount._() : super._();

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_RepoCountCopyWith<_$_RepoCount> get copyWith =>
      throw _privateConstructorUsedError;
}
