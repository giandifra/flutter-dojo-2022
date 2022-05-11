// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dojo_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DojoUserDTO _$$_DojoUserDTOFromJson(Map<String, dynamic> json) =>
    _$_DojoUserDTO(
      userId: json['userId'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      createdOn:
          const MyDateTimeConverter().fromJson(json['createdOn'] as Timestamp),
    );

Map<String, dynamic> _$$_DojoUserDTOToJson(_$_DojoUserDTO instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'createdOn': const MyDateTimeConverter().toJson(instance.createdOn),
    };
