import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%2016/message_api.dart';
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

  runApp(ChangeNotifierProvider(
    create: (context) => CounterModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late FirebaseMessaging messaging;

  // void initState() {
  //   super.initState();
  //   messaging = FirebaseMessaging.instance;
  //   // request perimission for iOS
  //   FirebaseMessaging.instance.requestPermission();
  //   // handle the notification when the app is in the foreground
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print(
  //         'receive messaging when app is in the foreground : ${message.notification?.title}');
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print(
  //         'Notification clicked when app in background: ${message.notification?.title}');
  //   });
  //   messaging.getToken().then((token) {
  //     print(" FCM Token:$token");
  //   });
  // }

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter 30 Days Challenge',
      // home: FlutterChallenge(),
      routerConfig: basicRoutes,
      // home: DayTwo(),
    );
  }
}
