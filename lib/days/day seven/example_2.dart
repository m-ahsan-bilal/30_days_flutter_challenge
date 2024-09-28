import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%20six/day_six.dart';
import 'package:go_router/go_router.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text(
          'Example 2',
          style: TextStyle(
            color: Colors.lightGreen.shade400,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.go('/day_seven');
              },
              icon: Icon(Icons.arrow_back)),
        ],
      ),
    );
  }
}
