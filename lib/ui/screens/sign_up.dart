import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_dojo_2022/application/sign_in_notifier.dart';
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

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text('Sign up - Flutter Dojo',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 32),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                    ),
                    text: 'Hai già un account? ',
                    children: [
                      TextSpan(
                        text: 'Accedi',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Voglio accedere');
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>SignInScreen()));
                            //Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 64,
                  thickness: 1,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.orange,
                ),
                MyTextField(
                  controller: firstNameController,
                  hintText: 'First Name',
                  labelText: 'First Name label',
                  validator: (input) {
                    if (input!.isEmpty) return "Nome non inserito";
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                MyTextField(
                  controller: lastNameController,
                  hintText: 'Last name',
                  labelText: 'Last name label',
                  validator: (input) {
                    if (input!.length < 3) {
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
                    if (input == null) return null;
                    if (!EmailValidator.validate(input)) {
                      return 'Email non valida';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  labelText: 'Password label',
                  validator: (input) {
                    if (input!.length < 6) {
                      return 'La password deve essere di almeno 6 caratteri';
                    }
                    return null;
                  },
                  obscureText: obscureText,
                  suffix: IconButton(
                    onPressed: () => setState(() {
                      obscureText = !obscureText;
                    }),
                    icon: Icon(!obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                const SizedBox(height: 16),
                MyTextField(
                  controller: confirmPwdController,
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password label',
                  validator: (input) {
                    if (input! != passwordController.text) {
                      return 'La password non corrisponde';
                    }
                    return null;
                  },
                  obscureText: obscureText,
                ),
                const SizedBox(height: 16),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    print('BUILD UI SIGN UP BUTTON');
                    final isLoading = ref.watch(isLoadingProvider);

                    return ElevatedButton(
                      onPressed: () async {
                        if (_formSignUpKey.currentState?.validate() ?? false) {
                          final firstName = firstNameController.text;
                          final lastName = lastNameController.text;
                          final email = emailController.text;
                          final password = passwordController.text;

                          //Mostriamo il loader
                          ref.read(isLoadingProvider.notifier).state = true;

                          // Eseguiamo il sign in
                          final result = await _signUp(firstName, lastName, email, password, ref);

                          //Rimuoviamo il loader
                          ref.read(isLoadingProvider.notifier).state = false;

                          //Se errore durante sign in mostriamo popup di errore
                          if (!result) {
                            ref.read(errorProvider.notifier).state =
                            'Sign up fallito';
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
                          : const Text('Sign Up'),
                    );
                  },
                ),

              ],
          ),
        ),
      ),
    );
  }

  Future<bool> _signUp(String firstName, String lastName, String email, String password, WidgetRef ref) async {
    print('$email $password');
    try{
      await ref.read(signInProvider.notifier).signUp(firstName, lastName, email, password);
      return true;
    }catch(ex){
      return false;
    }
  }

}
