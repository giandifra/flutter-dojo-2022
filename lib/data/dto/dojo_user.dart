import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/dojo_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dojo_user.freezed.dart';

part 'dojo_user.g.dart';

@freezed
class DojoUserDTO with _$DojoUserDTO {
  const factory DojoUserDTO({
    required String userId,
    required String name,
    required String surname,
    required String email,
    @MyDateTimeConverter() required DateTime createdOn,
  }) = _DojoUserDTO;

  factory DojoUserDTO.fromJson(Map<String, dynamic> json) =>
      _$DojoUserDTOFromJson(json);

  factory DojoUserDTO.fromDomain(DojoUser user) {
    return DojoUserDTO(
      userId: user.userId,
      name: user.name,
      email: user.email,
      surname: user.surname,
      createdOn: user.createdOn,
    );
  }
}

class MyDateTimeConverter implements JsonConverter<DateTime, Timestamp> {
  const MyDateTimeConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

/*class DojoUserDTO {
  final String userId;
  final String name;
  final String surname;
  final String email;
  final DateTime createdOn;

  DojoUserDTO({
    required this.userId,
    required this.name,
    required this.surname,
    required this.email,
    required this.createdOn,
  });

  factory DojoUserDTO.fromJson(Map<String, dynamic> json) {
    return DojoUserDTO(
      userId: json['userId'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      createdOn: json['createdOn'].toDate(),
    );
  }

  factory DojoUserDTO.fromDomain(DojoUser user) {
    return DojoUserDTO(
      userId: user.userId,
      name: user.name,
      email: user.email,
      surname: user.surname,
      createdOn: user.createdOn,
    );
  }

  toJson() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'surname': surname,
      'email': email,
      'createdOn': createdOn
    };
  }
}*/

extension DojoUserDTOX on DojoUserDTO {
  DojoUser toDomain() {
    return DojoUser(
      userId: userId,
      name: name,
      surname: surname,
      email: email,
      createdOn: createdOn,
    );
  }
}
