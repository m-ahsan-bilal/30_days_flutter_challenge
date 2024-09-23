import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/my_button.dart';
import 'package:flutter_challenge/utils/my_text_field.dart';
import 'package:flutter_challenge/utils/square_tile.dart';
import 'package:go_router/go_router.dart';

class DayTwo extends StatefulWidget {
  const DayTwo({super.key});

  @override
  State<DayTwo> createState() => _DayOneState();
}

class _DayOneState extends State<DayTwo> {
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

  void signUserIn() {
    // TODO: implement signUserIn
  }
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
        actions: [
          IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: Text(
          'Day 2',
          style: TextStyle(
            color: Colors.lightGreen.shade300,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
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
                  const Icon(
                    Icons.lock,
                    size: 140,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome back! you've been missed",
                    style: TextStyle(color: Colors.grey[700], fontSize: 15),
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
                    style: TextStyle(color: Colors.grey[600]),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 30),
                  MyButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();

                        // Implement login logic
                        debugPrint('Email: $email, Password: $password');
                      }
                    },
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
                        ' Or Continue With ',
                        style: TextStyle(color: Colors.grey[500]),
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
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Register Now!',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
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
