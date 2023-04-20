import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:fitness_gym_app/shared/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  String? email;

  Future resetPassword() async {
    setState(() {
      showSpinner = true;
    });
    try {
      final reset = await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email!.trim());
      setState(() {
        showSpinner = false;
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: blueColor,
          elevation: 5,
          duration: const Duration(seconds: 3),
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                  const Text("Reset your Password", style: kTextStyleHeaders),
                  Text(
                    "Enter your mail reset password link will be sent to your email",
                    style: kTextStyleSmall.copyWith(
                        color: Colors.grey, fontSize: 15),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 40, right: 40, top: 30),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
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
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    text: 'Reset',
                    onPressed: () {
                      formKey.currentState?.validate();
                      email == null ? null : resetPassword();
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
