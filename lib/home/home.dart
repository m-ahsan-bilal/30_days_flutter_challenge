import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/routes.dart';
import 'package:flutter_challenge/utils/sized_boxes.dart';
import 'package:go_router/go_router.dart';

class FlutterChallenge extends StatefulWidget {
  const FlutterChallenge({super.key});

  @override
  State<FlutterChallenge> createState() => _FlutterChallengeState();
}

class _FlutterChallengeState extends State<FlutterChallenge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(100),
                ),
                onPressed: () {
                  context.go("/day_one");
                },
                child: const Text(
                  "Day 1",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.go('/day_two');
                },
                child: const Text(
                  "Day 2",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
