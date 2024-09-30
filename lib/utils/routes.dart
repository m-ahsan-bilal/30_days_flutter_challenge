import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%20eleven/day_eleven.dart';
import 'package:flutter_challenge/days/day%20seven/example_1.dart';
import 'package:flutter_challenge/days/day%20seven/example_2.dart';
import 'package:flutter_challenge/days/day%20ten/day_ten.dart';
import 'package:flutter_challenge/days/day%20twelve/day%2013/13eg_1.dart';
import 'package:flutter_challenge/days/day%20twelve/day%2013/day_13.dart';
import 'package:flutter_challenge/days/day%20twelve/day_12.dart';
import 'package:flutter_challenge/days/day%20twelve/example_rovider_1.dart';
import 'package:flutter_challenge/days/day_eight.dart';
import 'package:flutter_challenge/days/day_nine.dart';
import 'package:flutter_challenge/days/day_one.dart';
import 'package:flutter_challenge/days/day%20six/day_six.dart';
import 'package:flutter_challenge/days/day_seven.dart';
import 'package:flutter_challenge/days/day_two.dart';
import 'package:flutter_challenge/home/home.dart';

import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter basicRoutes = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: "/",
  routes: appRoutesList,
  errorBuilder: (context, state) => Center(
    child: Container(
      color: Colors.white,
      child: Text(
        state.error.toString(),
      ),
    ),
  ),
);
List<RouteBase> appRoutesList = [
  GoRoute(
    path: '/',
    name: "/",
    builder: (BuildContext context, GoRouterState state) =>
        const FlutterChallenge(),
  ),
  GoRoute(
    path: '/day_one',
    name: "/day_one",
    builder: (BuildContext context, GoRouterState state) => const DayOne(),
  ),
  GoRoute(
    path: '/day_two',
    name: "/day_two",
    builder: (BuildContext context, GoRouterState state) => const DayTwo(),
  ),
  GoRoute(
    path: '/day_six',
    name: "/day_six",
    builder: (BuildContext context, GoRouterState state) => const DaySix(),
  ),
  GoRoute(
    path: '/day_seven',
    name: "day_seven",
    builder: (BuildContext context, GoRouterState state) => const DaySeven(),
  ),
  GoRoute(
    path: '/day_seven_1',
    name: "day_seven_1",
    builder: (BuildContext context, GoRouterState state) => const Example1(),
  ),
  GoRoute(
    path: '/day_seven_2',
    name: "day_seven_2",
    builder: (BuildContext context, GoRouterState state) => const Example2(),
  ),
  GoRoute(
    path: '/day_eight',
    name: "/day_eight",
    builder: (BuildContext context, GoRouterState state) => DayEight(),
  ),
  GoRoute(
    path: '/day_nine',
    name: "/day_nine",
    builder: (BuildContext context, GoRouterState state) => const DayNine(),
  ),
  GoRoute(
    path: '/day_ten',
    name: "/day_ten",
    builder: (BuildContext context, GoRouterState state) => const DayTen(),
  ),
  GoRoute(
    path: '/day_11',
    name: "/day_11",
    builder: (BuildContext context, GoRouterState state) => const DayEleven(),
  ),
  GoRoute(
    path: '/day_12',
    name: "/day_12",
    builder: (BuildContext context, GoRouterState state) => const DayTwelve(),
  ),
  GoRoute(
    path: '/day_12_1',
    name: "/day_12_1",
    builder: (BuildContext context, GoRouterState state) =>
        const ExampleProvider1(),
  ),
  GoRoute(
    path: '/day_13',
    name: "/day_13",
    builder: (BuildContext context, GoRouterState state) => const Day13(),
  ),
  GoRoute(
    path: '//13eg_1',
    name: "//13eg_1",
    builder: (BuildContext context, GoRouterState state) => const Day13Eg(),
  ),
];
