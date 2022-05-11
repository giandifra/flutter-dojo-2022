import 'package:flutter_dojo_2022/domain/entities/dojo_user.dart';

class SignInStatus {}

class Authenticated extends SignInStatus {

  final DojoUser dojoUser;

  Authenticated(this.dojoUser);
}

class Unauthenticated extends SignInStatus {}