import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%2016/day_16.dart';
import 'package:go_router/go_router.dart';

class FlexExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex Example'),
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2, // Take twice the space
            child: Container(color: Colors.red, height: 100),
          ),
          Expanded(
            flex: 1, // Take the remaining space
            child: Container(color: Colors.yellow, height: 100),
          ),
        ],
      ),
    );
  }
}
