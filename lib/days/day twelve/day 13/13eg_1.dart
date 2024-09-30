import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Day13Eg extends StatelessWidget {
  const Day13Eg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Example 1'),
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
    );
  }
}
