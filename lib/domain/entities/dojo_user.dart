import 'package:freezed_annotation/freezed_annotation.dart';

part 'dojo_user.freezed.dart';

@freezed
class DojoUser with _$DojoUser {
  const factory DojoUser({
    required String userId,
    required String name,
    required String surname,
    required String email,
    required DateTime createdOn,
  }) = _DojoUser;
}

extension DojoUserX on DojoUser{
  String get fullName => '$name $surname';
}