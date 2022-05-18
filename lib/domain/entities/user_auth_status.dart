import 'package:flutter_dojo_2022/domain/entities/dojo_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_auth_status.freezed.dart';

@freezed
class SignInStatus with _$SignInStatus {
  const factory SignInStatus.authenticated(DojoUser user) = Authenticated;
  const factory SignInStatus.unauthenticated() = Unauthenticated;
}