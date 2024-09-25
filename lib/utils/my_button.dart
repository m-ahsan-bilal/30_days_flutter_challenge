import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // const MyWidget({super.key});
  final Function()? onTap;

  const MyButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
