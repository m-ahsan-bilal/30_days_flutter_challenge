import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/day_button.dart';

import 'package:go_router/go_router.dart';

class FlutterChallenge extends StatefulWidget {
  const FlutterChallenge({super.key});

  @override
  State<FlutterChallenge> createState() => _FlutterChallengeState();
}

class _FlutterChallengeState extends State<FlutterChallenge> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '30 Days Of Flutter',
          style: TextStyle(
              color: Colors.lightGreen.shade500,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // backgroundColor: Colors.grey[100],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
          ),
          child: Column(
            children: [
              DayButton(
                  title: 'Day 1',
                  onPressed: () {
                    context.go('/day_one');
                  }),
              DayButton(
                  title: 'Day 2',
                  onPressed: () {
                    context.go('/day_two');
                  }),
              DayButton(
                  title: 'Day 3',
                  onPressed: () {
                    context.go('/day_three');
                  }),
              DayButton(
                  title: 'Day 4',
                  onPressed: () {
                    context.go('/day_four');
                  }),
              DayButton(
                  title: 'Day 5',
                  onPressed: () {
                    context.go('/day_five');
                  }),
              DayButton(
                  title: 'Day 6',
                  onPressed: () {
                    context.go('/day_six');
                  }),
              DayButton(
                  title: 'Day 7',
                  onPressed: () {
                    context.go('/day_seven');
                  }),
              DayButton(
                  title: 'Day 7',
                  onPressed: () {
                    context.go('/day_eight');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
