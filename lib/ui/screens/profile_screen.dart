import 'package:flutter/material.dart';
import 'package:flutter_dojo_2022/application/sign_in_notifier.dart';
import 'package:flutter_dojo_2022/ui/screens/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_auth_status.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    ref.listen<bool>(userIsLoggedProvider, (previous, next) {
      print('userIsLogged? => $next');
    });

    final signInStatusAsync = ref.watch(authStreamProvider);

    return signInStatusAsync.when(
      data: (signInStatus){
        if (signInStatus is Unauthenticated) {
          return const SignInScreen();
        } else if (signInStatus is Authenticated) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Il mio profilo'),
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('Email: ${signInStatus.email}'),
                Text('Name: ${signInStatus.name}'),
                ElevatedButton(
                    onPressed: () {
                      ref.read(signInProvider.notifier).signOut();
                    },
                    child: Text('Sign out')),
              ],
            ),
          );
        }

        return Center(
          child: Text('ERRORE'),
        );
      },
      error: (err, stack){
        return Center(child: Text(err.toString()),);
      },
      loading: (){
        return Center(child: CircularProgressIndicator());
      },
    );


  }
}
