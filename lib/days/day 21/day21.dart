import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%2016/day_16.dart';
import 'package:flutter_challenge/utils/my_button.dart';
import 'package:go_router/go_router.dart';

class Day21 extends StatelessWidget {
  const Day21({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => context.go('/day_21'),
              icon: Icon(Icons.arrow_back)),
          title: Text('Day21'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
                onTap: () => context.go("/responsive_1"), title: "Example 1"),
            SizedBox(
              height: 30,
            ),
            MyButton(
                onTap: () => context.go("/responsive_2"), title: "Example 2"),
            SizedBox(
              height: 30,
            ),
            MyButton(
                onTap: () => context.go("/responsive_3"), title: "Example 3"),
          ],
        ));
  }
}
