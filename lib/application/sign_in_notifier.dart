import 'package:flutter/material.dart';
import 'package:flutter_dojo_2022/ui/screens/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*enum SignInStatus {
  authenticated,
  unauthenticated
}*/

final simpleProvider = Provider<bool>((ref)=>true);

final stateProvider = StateProvider<bool>((ref)=>true);

final signInProvider = StateNotifierProvider<SignInNotifier, SignInStatus>((ref){
  return SignInNotifier();
});


class SignInStatus{}

class Authenticated extends SignInStatus{
  final String email;
  final String name;
  final String imageUrl;

  Authenticated(this.email, this.name, this.imageUrl);

}


class Unauthenticated extends SignInStatus{}


class SignInNotifier extends StateNotifier<SignInStatus>{

  //final Ref ref;
  //final Reader read;


  SignInNotifier() : super(Unauthenticated());

  Future<void> signIn(String email, String password) async{

    // Metodo alternativo per validare i valori di input
    /*if(password.length < 8){
      read(passwordErrorProvider.notifier).state = 'ERRORE DAL PROVIDER';
      return;
    }*/

    await Future.delayed(Duration(seconds: 5));
    state = Authenticated(email, 'name', 'imageUrl');
  }


  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 2));
    state = Unauthenticated();
  }

}