import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/days/day%2016/message_api.dart';
import 'package:flutter_challenge/days/day%2018/models/restaurant.dart';
import 'package:flutter_challenge/days/day%2018/themes/theme_provider.dart';
import 'package:flutter_challenge/days/day%2020/counter_bloc.dart';
import 'package:flutter_challenge/days/day%20twelve/counter_model.dart';
import 'package:flutter_challenge/firebase_options.dart';
import 'package:flutter_challenge/utils/routes.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  // FirebaseAnalytics analytics = FirebaseAnalytics();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Restaurant()),
        ChangeNotifierProvider(create: (context) => CounterModel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter 30 Days Challenge',
        // home: FlutterChallenge(),
        routerConfig: basicRoutes,
        theme: Provider.of<ThemeProvider>(context).themeData,
        // home: DayTwo(),
      );
    });
  }
}
