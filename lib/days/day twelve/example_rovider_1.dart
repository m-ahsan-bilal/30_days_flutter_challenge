import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%20twelve/counter_model.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ExampleProvider1 extends StatefulWidget {
  const ExampleProvider1({super.key});

  @override
  State<ExampleProvider1> createState() => _ExampleProvider1State();
}

class _ExampleProvider1State extends State<ExampleProvider1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Provider Example 1'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // get acces to the model class
            final counter = context.read<CounterModel>();
            // make increment
            counter.increment();
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:'),
              Text(
                value.count.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
