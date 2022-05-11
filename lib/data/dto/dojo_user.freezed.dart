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

DojoUserDTO _$DojoUserDTOFromJson(Map<String, dynamic> json) {
  return _DojoUserDTO.fromJson(json);
}

/// @nodoc
mixin _$DojoUserDTO {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @MyDateTimeConverter()
  DateTime get createdOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DojoUserDTOCopyWith<DojoUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DojoUserDTOCopyWith<$Res> {
  factory $DojoUserDTOCopyWith(
          DojoUserDTO value, $Res Function(DojoUserDTO) then) =
      _$DojoUserDTOCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String name,
      String surname,
      String email,
      @MyDateTimeConverter() DateTime createdOn});
}

/// @nodoc
class _$DojoUserDTOCopyWithImpl<$Res> implements $DojoUserDTOCopyWith<$Res> {
  _$DojoUserDTOCopyWithImpl(this._value, this._then);

  final DojoUserDTO _value;
  // ignore: unused_field
  final $Res Function(DojoUserDTO) _then;

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
abstract class _$$_DojoUserDTOCopyWith<$Res>
    implements $DojoUserDTOCopyWith<$Res> {
  factory _$$_DojoUserDTOCopyWith(
          _$_DojoUserDTO value, $Res Function(_$_DojoUserDTO) then) =
      __$$_DojoUserDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String name,
      String surname,
      String email,
      @MyDateTimeConverter() DateTime createdOn});
}

/// @nodoc
class __$$_DojoUserDTOCopyWithImpl<$Res> extends _$DojoUserDTOCopyWithImpl<$Res>
    implements _$$_DojoUserDTOCopyWith<$Res> {
  __$$_DojoUserDTOCopyWithImpl(
      _$_DojoUserDTO _value, $Res Function(_$_DojoUserDTO) _then)
      : super(_value, (v) => _then(v as _$_DojoUserDTO));

  @override
  _$_DojoUserDTO get _value => super._value as _$_DojoUserDTO;

  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? email = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_$_DojoUserDTO(
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
@JsonSerializable()
class _$_DojoUserDTO implements _DojoUserDTO {
  const _$_DojoUserDTO(
      {required this.userId,
      required this.name,
      required this.surname,
      required this.email,
      @MyDateTimeConverter() required this.createdOn});

  factory _$_DojoUserDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DojoUserDTOFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final String surname;
  @override
  final String email;
  @override
  @MyDateTimeConverter()
  final DateTime createdOn;

  @override
  String toString() {
    return 'DojoUserDTO(userId: $userId, name: $name, surname: $surname, email: $email, createdOn: $createdOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DojoUserDTO &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.surname, surname) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.createdOn, createdOn));
  }

  @JsonKey(ignore: true)
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
  _$$_DojoUserDTOCopyWith<_$_DojoUserDTO> get copyWith =>
      __$$_DojoUserDTOCopyWithImpl<_$_DojoUserDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DojoUserDTOToJson(this);
  }
}

abstract class _DojoUserDTO implements DojoUserDTO {
  const factory _DojoUserDTO(
          {required final String userId,
          required final String name,
          required final String surname,
          required final String email,
          @MyDateTimeConverter() required final DateTime createdOn}) =
      _$_DojoUserDTO;

  factory _DojoUserDTO.fromJson(Map<String, dynamic> json) =
      _$_DojoUserDTO.fromJson;

  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get surname => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  @MyDateTimeConverter()
  DateTime get createdOn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DojoUserDTOCopyWith<_$_DojoUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
