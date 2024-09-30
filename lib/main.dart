import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%20twelve/counter_model.dart';
import 'package:flutter_challenge/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CounterModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   routerDelegate: basicRoutes.routerDelegate,
    //   routeInformationParser: basicRoutes.routeInformationParser,
    //   title: 'Flutter Challenge',
    //   theme: ThemeData(primarySwatch: Colors.blue),
    // );
    return MaterialApp.router(
      title: 'Flutter 30 Days Challenge',
      // home: FlutterChallenge(),
      routerConfig: basicRoutes,
      // home: DayTwo(),
    );
  }
}
