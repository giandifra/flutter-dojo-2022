import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo_2022/sign_up.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obscureText = true;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Invocato solo la prima volta
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              SizedBox(
                height: 16,
              ),
              FlutterLogo(
                size: 70,
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'Welcome Flutter Dojo',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 32,
              ),
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
              SizedBox(
                height: 16,
              ),
              Center(child: Text('oppure')),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: usernameController,
                validator: (input) {
                  if (input == null) return null;
                  if (input.length < 3) {
                    return 'Username almeno di 3 lettere';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                    labelText: 'Username label'),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passwordController,
                validator: (input) {
                  if (input == null) return null;
                  if (input.length < 6) {
                    return 'La password deve essere di almeno 6 caratteri';
                  }
                  return null;
                },
                obscureText: obscureText,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    labelText: 'Password label',
                    suffix: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final username = usernameController.text;
                    final password = passwordController.text;
                    _signIn(username, password);
                  }
                },
                child: Text('Sign In'),
              ),
              SizedBox(
                height: 16,
              ),
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
                          Navigator.of(context).push(
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

  _signIn(String username, String password) {
    print('$username $password');
  }
}
