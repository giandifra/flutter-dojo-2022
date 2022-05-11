import '../../domain/entities/dojo_user.dart';

class DojoUserDTO {
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
}

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
