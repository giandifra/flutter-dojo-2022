class DojoUser {

  final String userId;
  final String name;
  final String surname;
  final String email;
  final DateTime createdOn;

  DojoUser({
    required this.userId,
    required this.name,
    required this.surname,
    required this.email,
    required this.createdOn,
  });
}

extension DojoUserX on DojoUser{
  String get fullName => '$name $surname';
}