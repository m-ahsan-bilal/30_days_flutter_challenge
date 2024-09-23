import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DayOne extends StatelessWidget {
  const DayOne({super.key});

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
          'Day 1',
          style: TextStyle(color: Colors.lightGreen.shade400),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade400,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: const Column(
            children: [
              Text(
                'This the screen of Day 1',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
