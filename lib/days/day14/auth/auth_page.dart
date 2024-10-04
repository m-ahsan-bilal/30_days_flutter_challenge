import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day14/auth/homepage.dart';
import 'package:flutter_challenge/days/day14/login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapashot) {
            // userr is logged in
            if (snapashot.hasData) {
              return HomePage();
            } else {
              return Login();
            }
            // user is not logged in
          }),
    );
  }
}
