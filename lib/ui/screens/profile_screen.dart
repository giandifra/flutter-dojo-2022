import 'package:flutter/material.dart';
import 'package:flutter_dojo_2022/application/sign_in_notifier.dart';
import 'package:flutter_dojo_2022/ui/screens/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_auth_status.dart';
import '../../domain/entities/dojo_user.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<bool>(userIsLoggedProvider, (previous, next) {
      print('userIsLogged? => $next');
    });

    final signInStatusAsync = ref.watch(dojoUserStreamProvider);

    return signInStatusAsync.when(
      data: (signInStatus) {
        return signInStatus.when(
          authenticated: (dojoUser) {
            return AuthenticatedWidget(
              dojoUser: dojoUser,
            );
          },
          unauthenticated: () {
            return const SignInScreen();
          },
        );
      },
      error: (err, stack) {
        return Scaffold(
            body: Center(
          child: Text(err.toString()),
        ));
      },
      loading: () {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class AuthenticatedWidget extends ConsumerWidget {
  final DojoUser dojoUser;

  const AuthenticatedWidget({Key? key, required this.dojoUser})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Il mio profilo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Email: ${dojoUser.email}'),
          Text('Name: ${dojoUser.fullName} '),
          const SizedBox(height: 16),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final authState = ref.watch(signInProvider);
              if (authState is Authenticated) {
                return Text(dojoUser.fullName);
              }
              return Text('unauthenticated');
            },
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(signInProvider.notifier).editName('Nuovo nome');
              },
              child: Text('Edit name')),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                ref.read(signInProvider.notifier).signOut();
              },
              child: Text('Sign out')),
        ],
      ),
    );
  }
}
