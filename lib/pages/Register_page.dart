// ignore_for_file: use_build_context_synchronously

import 'package:ap/CustomWidget/myButton.dart';
import 'package:ap/CustomWidget/myTextFormField.dart';
import 'package:ap/pages/Login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  static String id = '1';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email, password, username;
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
                'Register',
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
                  username = value;
                },
                text: 'user name',
              ),
              const SizedBox(
                height: 10,
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
                title: 'REGISTER',
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            title: Text(
                              'Verify your email',
                              style: TextStyle(
                                color: Colors.amber[400],
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Please verify your email to continue registration',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                MaterialButton(
                                  color: Colors.amber,
                                  onPressed: () async {
                                    await FirebaseAuth
                                        .instance.currentUser!.emailVerified;

                                    // Future.delay(Duration(seconds: 3), () {
                                    //   Navigator.pushNamed(
                                    //       context, LoginPage.id);
                                    // });
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sucess')));
                      Duration(milliseconds: 3);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('email is already exist')));
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account ?',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
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

class mm extends StatelessWidget {
  const mm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SnackBar(content: Text('weak passord'));
  }
}
