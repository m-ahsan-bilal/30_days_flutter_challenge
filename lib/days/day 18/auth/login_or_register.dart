import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%2018/log_register/loginuser.dart';
import 'package:flutter_challenge/days/day%2018/log_register/register_user.dart';
import 'package:flutter_challenge/days/day14/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginUser(onTap: togglePages);
    } else {
      return const RegisterUser();
    }
  }
}
