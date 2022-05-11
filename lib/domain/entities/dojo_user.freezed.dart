// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dojo_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DojoUser {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  DateTime get createdOn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DojoUserCopyWith<DojoUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DojoUserCopyWith<$Res> {
  factory $DojoUserCopyWith(DojoUser value, $Res Function(DojoUser) then) =
      _$DojoUserCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String name,
      String surname,
      String email,
      DateTime createdOn});
}

/// @nodoc
class _$DojoUserCopyWithImpl<$Res> implements $DojoUserCopyWith<$Res> {
  _$DojoUserCopyWithImpl(this._value, this._then);

  final DojoUser _value;
  // ignore: unused_field
  final $Res Function(DojoUser) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? email = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_DojoUserCopyWith<$Res> implements $DojoUserCopyWith<$Res> {
  factory _$$_DojoUserCopyWith(
          _$_DojoUser value, $Res Function(_$_DojoUser) then) =
      __$$_DojoUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String name,
      String surname,
      String email,
      DateTime createdOn});
}

/// @nodoc
class __$$_DojoUserCopyWithImpl<$Res> extends _$DojoUserCopyWithImpl<$Res>
    implements _$$_DojoUserCopyWith<$Res> {
  __$$_DojoUserCopyWithImpl(
      _$_DojoUser _value, $Res Function(_$_DojoUser) _then)
      : super(_value, (v) => _then(v as _$_DojoUser));

  @override
  _$_DojoUser get _value => super._value as _$_DojoUser;

  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? email = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_$_DojoUser(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DojoUser implements _DojoUser {
  const _$_DojoUser(
      {required this.userId,
      required this.name,
      required this.surname,
      required this.email,
      required this.createdOn});

  @override
  final String userId;
  @override
  final String name;
  @override
  final String surname;
  @override
  final String email;
  @override
  final DateTime createdOn;

  @override
  String toString() {
    return 'DojoUser(userId: $userId, name: $name, surname: $surname, email: $email, createdOn: $createdOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DojoUser &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.surname, surname) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.createdOn, createdOn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(surname),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(createdOn));

  @JsonKey(ignore: true)
  @override
  _$$_DojoUserCopyWith<_$_DojoUser> get copyWith =>
      __$$_DojoUserCopyWithImpl<_$_DojoUser>(this, _$identity);
}

abstract class _DojoUser implements DojoUser {
  const factory _DojoUser(
      {required final String userId,
      required final String name,
      required final String surname,
      required final String email,
      required final DateTime createdOn}) = _$_DojoUser;

  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get surname => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  DateTime get createdOn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DojoUserCopyWith<_$_DojoUser> get copyWith =>
      throw _privateConstructorUsedError;
}
