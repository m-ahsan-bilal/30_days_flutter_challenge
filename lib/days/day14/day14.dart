import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/my_button.dart';
import 'package:go_router/go_router.dart';

class Day14 extends StatelessWidget {
  const Day14({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Day 14'),
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              title: "Example 1",
              onTap: () {
                context.go('/login');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Flutter Firebase Authentication ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
