// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OwnerJsonObject _$OwnerJsonObjectFromJson(Map<String, dynamic> json) {
  return _OwnerJsonObject.fromJson(json);
}

/// @nodoc
mixin _$OwnerJsonObject {
  @JsonKey(name: 'login')
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  String? get ownerUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnerJsonObjectCopyWith<OwnerJsonObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerJsonObjectCopyWith<$Res> {
  factory $OwnerJsonObjectCopyWith(
          OwnerJsonObject value, $Res Function(OwnerJsonObject) then) =
      _$OwnerJsonObjectCopyWithImpl<$Res, OwnerJsonObject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String login,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      String? ownerUrl});
}

/// @nodoc
class _$OwnerJsonObjectCopyWithImpl<$Res, $Val extends OwnerJsonObject>
    implements $OwnerJsonObjectCopyWith<$Res> {
  _$OwnerJsonObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
    Object? ownerUrl = freezed,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUrl: freezed == ownerUrl
          ? _value.ownerUrl
          : ownerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OwnerJsonObjectCopyWith<$Res>
    implements $OwnerJsonObjectCopyWith<$Res> {
  factory _$$_OwnerJsonObjectCopyWith(
          _$_OwnerJsonObject value, $Res Function(_$_OwnerJsonObject) then) =
      __$$_OwnerJsonObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String login,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      String? ownerUrl});
}

/// @nodoc
class __$$_OwnerJsonObjectCopyWithImpl<$Res>
    extends _$OwnerJsonObjectCopyWithImpl<$Res, _$_OwnerJsonObject>
    implements _$$_OwnerJsonObjectCopyWith<$Res> {
  __$$_OwnerJsonObjectCopyWithImpl(
      _$_OwnerJsonObject _value, $Res Function(_$_OwnerJsonObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
    Object? ownerUrl = freezed,
  }) {
    return _then(_$_OwnerJsonObject(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUrl: freezed == ownerUrl
          ? _value.ownerUrl
          : ownerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OwnerJsonObject implements _OwnerJsonObject {
  const _$_OwnerJsonObject(
      {@JsonKey(name: 'login') required this.login,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      this.ownerUrl});

  factory _$_OwnerJsonObject.fromJson(Map<String, dynamic> json) =>
      _$$_OwnerJsonObjectFromJson(json);

  @override
  @JsonKey(name: 'login')
  final String login;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  final String? ownerUrl;

  @override
  String toString() {
    return 'OwnerJsonObject(login: $login, avatarUrl: $avatarUrl, ownerUrl: $ownerUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OwnerJsonObject &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.ownerUrl, ownerUrl) ||
                other.ownerUrl == ownerUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, login, avatarUrl, ownerUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OwnerJsonObjectCopyWith<_$_OwnerJsonObject> get copyWith =>
      __$$_OwnerJsonObjectCopyWithImpl<_$_OwnerJsonObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OwnerJsonObjectToJson(
      this,
    );
  }
}

abstract class _OwnerJsonObject implements OwnerJsonObject {
  const factory _OwnerJsonObject(
      {@JsonKey(name: 'login') required final String login,
      @JsonKey(name: 'avatar_url') required final String avatarUrl,
      final String? ownerUrl}) = _$_OwnerJsonObject;

  factory _OwnerJsonObject.fromJson(Map<String, dynamic> json) =
      _$_OwnerJsonObject.fromJson;

  @override
  @JsonKey(name: 'login')
  String get login;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  String? get ownerUrl;
  @override
  @JsonKey(ignore: true)
  _$$_OwnerJsonObjectCopyWith<_$_OwnerJsonObject> get copyWith =>
      throw _privateConstructorUsedError;
}
