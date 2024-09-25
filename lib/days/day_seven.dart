import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DaySeven extends StatelessWidget {
  const DaySeven({super.key});

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
          Text(
            "Day 8",
            style: TextStyle(
                color: Colors.lightGreen.shade400,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
