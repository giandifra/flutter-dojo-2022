import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_dojo_2022/ui/screens/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/my_textfield.dart';
import 'package:email_validator/email_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formSignUpKey = GlobalKey<FormState>();
  bool obscureText = true;

  final fnController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGN UP'),

      ),
      body: SafeArea(
        child: Form(
          key: _formSignUpKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    FlutterLogo(size: 50),
                    Text('Welcome Flutter Dojo',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 32),
                MyTextField(
                  controller: fnController,
                  hintText: 'First Name',
                  labelText: 'First Name label',
                  validator: (input) {
                    if (input == null) return "Nome non inserito";
                  },
                ),
                const SizedBox(height: 16),
                MyTextField(
                  controller: usernameController,
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
                  controller: emailController,
                  hintText: 'Email',
                  labelText: 'Email label',
                  validator: (input) {
                    print(input);
                    if (input == null) return null;
                    if (!EmailValidator.validate(input)) {
                      return 'Email non valida';
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
                MyTextField(
                  controller: confirmPwdController,
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password label',
                  validator: (input) {
                    if (input == null) return null;
                    if (input.length < 6) {
                      return 'La password deve corrispondere alla precedente';
                    }
                    return null;
                  },
                  obscureText: obscureText,
                  /*suffix: IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Icon(
                      obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    ),),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },),*/
                ),
                const SizedBox(height: 32),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    print('BUILD UI SIGN UN BUTTON');
                    final isLoading = ref.watch(isLoadingProvider);

                    return ElevatedButton(
                      onPressed: () async {
                        if (_formSignUpKey.currentState?.validate() ?? false) {
                          final username = usernameController.text;
                          final password = passwordController.text;

                          //Mostriamo il loader
                          ref.read(isLoadingProvider.notifier).state = true;

                          // Eseguiamo il sign in
                          final result = await _signUp(username, password);

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
                          : Text('Sign Up'),
                    );
                  },
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: 'Hai già un account? ',
                    children: [
                      TextSpan(
                        text: 'Accedi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Voglio accedere');
                            Navigator.pop(context);
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );*/
                          },
                      ),
                    ],
                  ),
                ),
                /*ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
            },
            child: Text('Indietro'))*/

              ],
        ),
      ),
      ),
    );
  }

  Future<bool> _signUp(String username, String password) async {
    print('$username $password');
    await Future.delayed(const Duration(seconds: 5));
    return false;
  }

}
