// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Repo {
  /// オーナー名
  String get ownerName => throw _privateConstructorUsedError;

  /// アバターURL
  String get avatarUrl => throw _privateConstructorUsedError;

  /// オーナーURL
  String? get ownerUrl => throw _privateConstructorUsedError;

  /// リポジトリ名
  String get repoName => throw _privateConstructorUsedError;

  /// リポジトリ名（フル）
  String get fullName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoCopyWith<Repo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoCopyWith<$Res> {
  factory $RepoCopyWith(Repo value, $Res Function(Repo) then) =
      _$RepoCopyWithImpl<$Res, Repo>;
  @useResult
  $Res call(
      {String ownerName,
      String avatarUrl,
      String? ownerUrl,
      String repoName,
      String fullName});
}

/// @nodoc
class _$RepoCopyWithImpl<$Res, $Val extends Repo>
    implements $RepoCopyWith<$Res> {
  _$RepoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerName = null,
    Object? avatarUrl = null,
    Object? ownerUrl = freezed,
    Object? repoName = null,
    Object? fullName = null,
  }) {
    return _then(_value.copyWith(
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUrl: freezed == ownerUrl
          ? _value.ownerUrl
          : ownerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      repoName: null == repoName
          ? _value.repoName
          : repoName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepoCopyWith<$Res> implements $RepoCopyWith<$Res> {
  factory _$$_RepoCopyWith(_$_Repo value, $Res Function(_$_Repo) then) =
      __$$_RepoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ownerName,
      String avatarUrl,
      String? ownerUrl,
      String repoName,
      String fullName});
}

/// @nodoc
class __$$_RepoCopyWithImpl<$Res> extends _$RepoCopyWithImpl<$Res, _$_Repo>
    implements _$$_RepoCopyWith<$Res> {
  __$$_RepoCopyWithImpl(_$_Repo _value, $Res Function(_$_Repo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerName = null,
    Object? avatarUrl = null,
    Object? ownerUrl = freezed,
    Object? repoName = null,
    Object? fullName = null,
  }) {
    return _then(_$_Repo(
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUrl: freezed == ownerUrl
          ? _value.ownerUrl
          : ownerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      repoName: null == repoName
          ? _value.repoName
          : repoName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Repo extends _Repo {
  const _$_Repo(
      {required this.ownerName,
      required this.avatarUrl,
      required this.ownerUrl,
      required this.repoName,
      required this.fullName})
      : super._();

  /// オーナー名
  @override
  final String ownerName;

  /// アバターURL
  @override
  final String avatarUrl;

  /// オーナーURL
  @override
  final String? ownerUrl;

  /// リポジトリ名
  @override
  final String repoName;

  /// リポジトリ名（フル）
  @override
  final String fullName;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Repo &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.ownerUrl, ownerUrl) ||
                other.ownerUrl == ownerUrl) &&
            (identical(other.repoName, repoName) ||
                other.repoName == repoName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, ownerName, avatarUrl, ownerUrl, repoName, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepoCopyWith<_$_Repo> get copyWith =>
      __$$_RepoCopyWithImpl<_$_Repo>(this, _$identity);
}

abstract class _Repo extends Repo {
  const factory _Repo(
      {required final String ownerName,
      required final String avatarUrl,
      required final String? ownerUrl,
      required final String repoName,
      required final String fullName}) = _$_Repo;
  const _Repo._() : super._();

  @override

  /// オーナー名
  String get ownerName;
  @override

  /// アバターURL
  String get avatarUrl;
  @override

  /// オーナーURL
  String? get ownerUrl;
  @override

  /// リポジトリ名
  String get repoName;
  @override

  /// リポジトリ名（フル）
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$_RepoCopyWith<_$_Repo> get copyWith => throw _privateConstructorUsedError;
}
