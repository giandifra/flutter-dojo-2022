class SignInStatus {}

class Authenticated extends SignInStatus {
  final String email;
  final String name;
  final String imageUrl;

  Authenticated(this.email, this.name, this.imageUrl);
}

class Unauthenticated extends SignInStatus {}