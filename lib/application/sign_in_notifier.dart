import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dojo_2022/application/wall_notifier.dart';
import 'package:flutter_dojo_2022/data/dto/dojo_user.dart';
import 'package:flutter_dojo_2022/domain/entities/dojo_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/user_auth_status.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final signInProvider = StateNotifierProvider<AuthNotifier, SignInStatus>((ref) {
  return AuthNotifier(ref.read);
});

final _authStreamProvider = StreamProvider<User?>((ref) async* {
  final stream = FirebaseAuth.instance.userChanges();
  await for (final user in stream) {
    print('authStreamProvider $user');
    yield user;
  }
});

final dojoUserStreamProvider = StreamProvider<SignInStatus>((ref) async* {
  final user = await ref.watch(_authStreamProvider.future);

  if (user != null) {
    final dojoUserDocStream = ref
        .watch(firestoreProvider)
        .collection('users')
        .doc(user.uid)
        .snapshots();

    await for (final doc in dojoUserDocStream) {
      if (doc.data() != null) {
        final dto = DojoUserDTO.fromJson(doc.data()!);
        final dojoUser = dto.toDomain();
        yield Authenticated(dojoUser);
      } else {
        yield Unauthenticated();
      }
    }
  } else {
    yield Unauthenticated();
  }
});

final userIsLoggedProvider = Provider<bool>((ref) {
  print('userIsLoggedProvider CREATE');
  final user = ref.watch(dojoUserStreamProvider).asData?.value ?? Unauthenticated();
  return user is Authenticated;
});

final userEmailProvider = Provider<String?>((ref) {
  print('userEmailProvider CREATE');

  final userStatus = ref.watch(_authStreamProvider).asData?.value;

  if (userStatus != null && userStatus is Authenticated) {
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

  Future<void> signUp(
      String firstName, String lastName, String email, String password) async {
    final userCredential = await read(firebaseAuthProvider)
        .createUserWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      final dojoUser = DojoUser(
        userId: userCredential.user!.uid,
        name: firstName,
        surname: lastName,
        email: email,
        createdOn: DateTime.now(),
      );

      final dto = DojoUserDTO.fromDomain(dojoUser);

      read(firestoreProvider)
          .collection('users')
          .doc(dojoUser.userId)
          .set(dto.toJson());
    }
  }

  Future<void> signOut() async {
    await read(firebaseAuthProvider).signOut();
  }
}
