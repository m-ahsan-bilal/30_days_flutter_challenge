import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/days/day%2020/counter_bloc.dart';
import 'package:flutter_challenge/days/day%2020/counter_event.dart';
import 'package:flutter_challenge/days/day%2020/counter_state.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the CounterBloc
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              'Counter: ${state.counter}',
              style: const TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'decrement',
              onPressed: () => counterBloc.add(CounterDecrement()),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              heroTag: 'increment',
              onPressed: () => counterBloc.add(CounterIncrement()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
