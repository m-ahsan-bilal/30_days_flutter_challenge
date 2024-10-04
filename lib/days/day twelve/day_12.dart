import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/my_button.dart';
import 'package:go_router/go_router.dart';

class DayTwelve extends StatelessWidget {
  const DayTwelve({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Day 12'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            MyButton(
              title: "Example 1",
              onTap: () {
                context.go('/day_12_1');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const MyButton(
              title: "Example 2",
              // onTap: () {
              //   context.go('/day_12_1');
              // },
            ),
          ],
        ),
      ),
    );
  }
}
