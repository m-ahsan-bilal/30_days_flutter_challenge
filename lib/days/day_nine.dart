import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DayNine extends StatelessWidget {
  const DayNine({Key? key}) : super(key: key);

  // Simulate an asynchronous data fetch
  Future<String> fetchData() async {
    // Simulating a network delay

    // Future<List>

    await Future.delayed(const Duration(seconds: 3));
    return "Data loaded successfully!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Day 9',
          style: TextStyle(color: Colors.lightGreen.shade400),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            'FutureBuilder Handling',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: FutureBuilder<String>(
              future: fetchData(), // The future function to be awaited
              builder: (context, snapshot) {
                // Check for different states of the Future
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While the future is still loading
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // If the future completed with an error
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  // If the future completed successfully
                  return Text(snapshot.data ?? "No data");
                } else {
                  // Handle any other potential states
                  return const Text("Something went wrong!");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
