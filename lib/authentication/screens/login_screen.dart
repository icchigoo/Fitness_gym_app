// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_gym_app/authentication/screens/register_screen.dart';
import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:fitness_gym_app/shared/widgets/custom_button.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/home_screen.dart';
import '../../features/reset_password/screens/reset_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late String email;
  bool visiblePassword = true;
  late String password;
  bool showSpinner = false;
  Future signIn() async {
    setState(() {
      showSpinner = true;
    });
    try {
      final signInUser = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      setState(() {
        showSpinner = false;
      });
      if (signInUser != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: blueColor,
          elevation: 5,
          content: Text(
            e.message.toString(),
            style: kTextStyleLarge,
          ),
        ),
      );
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: blueColor,
        ),
        inAsyncCall: showSpinner,
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text("Welcome back!", style: kTextStyleHeaders),
                  Text(
                    "Please sign in to your account",
                    style: kTextStyleSmall.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 40, right: 40, top: 30),
                    child: TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "Email",
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.white,
                          )),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (visiblePassword == true) {
                                  visiblePassword = false;
                                } else {
                                  visiblePassword = true;
                                }
                              });
                            },
                            icon: visiblePassword == true
                                ? const Icon(CupertinoIcons.eye_fill,
                                    color: Colors.white)
                                : const Icon(CupertinoIcons.eye_slash_fill,
                                    color: Colors.white),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          )),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Text(
                            "forget password?",
                            style: kTextStyleSmall.copyWith(color: Colors.grey),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ResetPasswordScreen(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () {
                      final validateForm = formKey.currentState!.validate();
                      if (validateForm) {
                        signIn();
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account?", style: kTextStyleSmall),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: kTextStyleSmall.copyWith(
                              fontWeight: FontWeight.bold, color: orangeColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
