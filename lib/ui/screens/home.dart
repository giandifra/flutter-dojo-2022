import 'package:flutter/material.dart';
import 'package:flutter_dojo_2022/application/sign_in_notifier.dart';
import 'package:flutter_dojo_2022/application/wall_notifier.dart';
import 'package:flutter_dojo_2022/ui/screens/profile_screen.dart';
import 'package:flutter_dojo_2022/ui/widgets/home_wall.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/my_checkbox.dart';

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userIsLogged = ref.watch(userIsLoggedProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacheca'),
        elevation: 8.0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ProfileScreen()));
              },
              icon: Icon(Icons.account_circle))
        ],
      ),
      body: HomeWall(),
      floatingActionButton:userIsLogged ? FloatingActionButton(
        onPressed: () {
          ref.read(wallNotifierProvider.notifier).addPost('Adkadsnk');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ) : null,
    );
  }
}
