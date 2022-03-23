import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo_2022/ui/screens/sign_up.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../widgets/my_textfield.dart';

final isLoadingProvider = StateProvider<bool>((Ref ref) {
  return false;
});

final errorProvider = StateProvider<String?>((Ref ref) {
  return null;
});

final usernameControllerProvider = Provider.autoDispose<TextEditingController>((Ref ref) {
  print('usernameControllerProvider CREATE');

  final t = TextEditingController();

  ref.onDispose(() {
    print('usernameControllerProvider DISPOSE');
    t.dispose();
  });

  return t;
});


class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  bool obscureText = true;

  //final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Invocato solo la prima volta
  }

  @override
  void dispose() {
    //usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD UI SIGN IN');

    final userNameController = ref.watch(usernameControllerProvider);

    ref.listen<String?>(errorProvider, (previous, next) {
      print('previous: $previous');
      print('next: $next');
      if (next != null) {
        showDialog(
            context: context,
            builder: (c) {
              return AlertDialog(
                content: Text(next),
              );
            });
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SizedBox(height: 16),
              const FlutterLogo(size: 70),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Welcome Flutter Dojo',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32),
              SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.Apple,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.GitHub,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              const Center(child: Text('oppure')),
              const SizedBox(height: 16),
              MyTextField(
                controller: userNameController,
                hintText: 'Username',
                labelText: 'Username label',
                validator: (input) {
                  if (input == null) return null;
                  if (input.length < 3) {
                    return 'Username almeno di 3 lettere';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                labelText: 'Password label',
                validator: (input) {
                  if (input == null) return null;
                  if (input.length < 6) {
                    return 'La password deve essere di almeno 6 caratteri';
                  }
                  return null;
                },
                obscureText: obscureText,
              ),
              const SizedBox(height: 16),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  print('BUILD UI SIGN IN BUTTON');
                  final isLoading = ref.watch(isLoadingProvider);

                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        final username = userNameController.text;
                        final password = passwordController.text;

                        //Mostriamo il loader
                        ref.read(isLoadingProvider.notifier).state = true;

                        // Eseguiamo il sign in
                        final result = await _signIn(username, password);

                        //Rimuoviamo il loader
                        ref.read(isLoadingProvider.notifier).state = false;

                        //Se errore durante sign in mostriamo popup di errore
                        if (!result) {
                          ref.read(errorProvider.notifier).state =
                              'Sign in fallito';
                        }
                      }
                    },
                    child: isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          )
                        : Text('Sign In'),
                  );
                },
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  text: 'Non sei registrato? ',
                  children: [
                    TextSpan(
                      text: 'Registrati',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Mi voglio registrare');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _signIn(String username, String password) async {
    print('$username $password');
    await Future.delayed(const Duration(seconds: 5));
    return false;
  }
}
