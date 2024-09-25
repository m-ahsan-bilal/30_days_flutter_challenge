import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DayEight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.go('/');
                },
                icon: const Icon(Icons.arrow_back))
          ],
          title: Text(
            'Day 8',
            style: TextStyle(color: Colors.lightGreen.shade400),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade400,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Displaying Images From The Web ',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Image from the Web'),
              SizedBox(height: 20),
              Image.network(
                'https://img.icons8.com/?size=100&id=pCvIfmctRaY8&format=png&color=000000',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator();
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Text('Failed to load image');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
