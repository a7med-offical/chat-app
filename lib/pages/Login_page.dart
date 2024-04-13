// ignore_for_file: avoid_print

import 'package:ap/CustomWidget/myButton.dart';
import 'package:ap/CustomWidget/myTextFormField.dart';
import 'package:ap/pages/Register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
  });
  static String id = '2';
  String? email, password;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'images/images.png',
                height: 130,
              ),
              const Text(
                'chat App',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  email = value;
                },
                text: 'email',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  password = value;
                },
                text: 'password',
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                  title: 'LOGIN',
                  onTap: () async {
                    print('hello world');
                    if (formkey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        print('Suess');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'you don\' have an account ?',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
