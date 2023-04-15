import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Start or join a meeting",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Image.asset("asset/images/onboarding.jpg"),
            ),
            CustomButton(
              text: 'Login',
              onPressed: () async {
                log("worked");
                bool res = await authMethods.signInWithGoogle(context);
                log("done");
                if (res) {
                  Navigator.pushNamed(context, "/home");
                } else {
                  log("something went wrong");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
