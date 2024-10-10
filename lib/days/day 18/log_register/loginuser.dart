import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day14/auth/auth_page.dart';

import 'package:flutter_challenge/utils/my_button.dart';
import 'package:flutter_challenge/utils/my_text_field.dart';
import 'package:flutter_challenge/utils/square_tile.dart';
import 'package:go_router/go_router.dart';

class LoginUser extends StatefulWidget {
  final void Function()? onTap;

  const LoginUser({super.key, required this.onTap});
  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
// obscure text
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
// text aditing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // login method
  void login() {
/*
 we will do here the authentication 




*/
  }

  // Future<void> signUserIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: emailController.text.trim(),
  //     password: passwordController.text.trim(),
  //   );
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/day_18');
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Login Page',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Icon(
                    Icons.lock_open,
                    size: 140,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "E COMMERCE APP",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 15),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    focusNode: emailFocus,
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }

                      if (!regex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      // Move focus to the next field when Enter is pressed
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // password textfield
                  MyTextField(
                    focusNode: passwordFocus,
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      // close keyboard
                      FocusScope.of(context).unfocus();
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        _togglePasswordVisibility();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 30),
                  MyButton(
                    onTap: () {
                      context.go('/home_dash');
                      // if (_formKey.currentState!.validate()) {
                      //   String email = emailController.text.trim();
                      //   String password = passwordController.text.trim();

                      //   debugPrint('Email: $email, Password: $password');
                      //   login;
                      //   // signUserIn();
                      //   // const AuthPage();
                      // }
                    },
                    title: "Sign In",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                        ),
                      ),
                      Text(
                        ' Or With ',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(imagePath: "assets/images/google.png"),
                      SizedBox(
                        width: 30,
                      ),
                      SquareTile(imagePath: "assets/images/facebook.png"),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not A Member?',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () => context.go('/register_user'),
                        child: Text(
                          'Register Now!',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
