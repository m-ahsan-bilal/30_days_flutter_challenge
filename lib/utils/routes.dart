import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day_one.dart';
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
    builder: (BuildContext context, GoRouterState state) => DayOne(),
  ),
  GoRoute(
    path: '/day_two',
    name: "/day_two",
    builder: (BuildContext context, GoRouterState state) => DayTwo(),
  ),
];
