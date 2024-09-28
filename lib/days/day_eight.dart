import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DayEight extends StatelessWidget {
  const DayEight({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(Icons.arrow_back)),
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
              const Text(
                'Displaying Images From The Web ',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Image from the Web'),
              const SizedBox(height: 20),
              Image.network(
                'https://img.icons8.com/?size=100&id=pCvIfmctRaY8&format=png&color=000000',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Failed to load image');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
