import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/day_button.dart';
import 'package:go_router/go_router.dart';

class DaySeven extends StatefulWidget {
  const DaySeven({super.key});

  @override
  State<DaySeven> createState() => _DaySevenState();
}

class _DaySevenState extends State<DaySeven> {
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
            'Day 7',
            style: TextStyle(color: Colors.lightGreen.shade400),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DayButton(
                title: 'Example 1',
                onPressed: () {
                  context.go('/day_seven_1');
                }),
            DayButton(
                title: 'Example 2 ',
                onPressed: () {
                  context.go('/day_seven_2');
                })
          ],
        ));
  }
}
