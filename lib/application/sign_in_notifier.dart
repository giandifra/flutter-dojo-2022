import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/user_auth_status.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final signInProvider = StateNotifierProvider<AuthNotifier, SignInStatus>((ref) {
  return AuthNotifier(ref.read);
});

final authStreamProvider = StreamProvider<SignInStatus>((ref) async* {
  final stream = FirebaseAuth.instance.authStateChanges();
  await for (final user in stream) {
    print('authStreamProvider $user');
    if (user != null) {
      yield Authenticated(
        user.email ?? 'Email',
        user.displayName ?? 'Display name is null',
        user.photoURL ?? '',
      );
    } else {
      yield Unauthenticated();
    }
  }
});

final userIsLoggedProvider = Provider<bool>((ref){
  print('userIsLoggedProvider CREATE');
  final userStatus = ref.watch(authStreamProvider);
  return true;
});


final userEmailProvider = Provider<String?>((ref){
  print('userEmailProvider CREATE');

  final userStatus = ref.watch(authStreamProvider).asData?.value;

  if(userStatus != null && userStatus is Authenticated){
    return userStatus.email;
  }
  return null;
});


class AuthNotifier extends StateNotifier<SignInStatus> {
  //Preferiamo passare l oggetto Reader (ref.read) per evitare di ascoltare con ref.watch
  //final Ref ref;
  final Reader read;

  AuthNotifier(this.read) : super(Unauthenticated());

  Future<void> signIn(String email, String password) async {
    // Metodo alternativo per validare i valori di input
    /*if(password.length < 8){
      read(passwordErrorProvider.notifier).state = 'ERRORE DAL PROVIDER';
      return;
    }*/

    await read(firebaseAuthProvider)
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp(String email, String password) async {
    await read(firebaseAuthProvider)
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await read(firebaseAuthProvider).signOut();
  }
}
