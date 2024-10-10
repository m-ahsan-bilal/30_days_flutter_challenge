import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%2016/day_16.dart';
import 'package:flutter_challenge/days/day%2017/day17.dart';
import 'package:flutter_challenge/days/day%2018/auth/login_or_register.dart';
import 'package:flutter_challenge/days/day%2018/cart.dart';
import 'package:flutter_challenge/days/day%2018/dashboard.dart';
import 'package:flutter_challenge/days/day%2018/day_18.dart';

import 'package:flutter_challenge/days/day%2018/log_register/loginuser.dart';
import 'package:flutter_challenge/days/day%2018/log_register/register_user.dart';
import 'package:flutter_challenge/days/day%2018/settings.dart';

import 'package:flutter_challenge/days/day%2018/user_profile.dart';
import 'package:flutter_challenge/days/day%2020/counter_page.dart';
import 'package:flutter_challenge/days/day%2021/day21.dart';
import 'package:flutter_challenge/days/day%2021/examples/flex_example.dart';
import 'package:flutter_challenge/days/day%2021/examples/profile_responsive_eg.dart';
import 'package:flutter_challenge/days/day%2021/examples/responsive_dashboard.dart';
import 'package:flutter_challenge/days/day%2022/chat_mini.dart';
import 'package:flutter_challenge/days/day%20eleven/day_eleven.dart';
import 'package:flutter_challenge/days/day%20seven/example_1.dart';
import 'package:flutter_challenge/days/day%20seven/example_2.dart';
import 'package:flutter_challenge/days/day%20ten/day_ten.dart';
import 'package:flutter_challenge/days/day%20twelve/day%2013/13eg_1.dart';
import 'package:flutter_challenge/days/day%20twelve/day%2013/day_13.dart';
import 'package:flutter_challenge/days/day%20twelve/day_12.dart';
import 'package:flutter_challenge/days/day%20twelve/example_rovider_1.dart';
import 'package:flutter_challenge/days/day14/auth/auth_page.dart';
import 'package:flutter_challenge/days/day14/auth/homepage.dart';
import 'package:flutter_challenge/days/day14/day14.dart';
import 'package:flutter_challenge/days/day14/login.dart';
import 'package:flutter_challenge/days/day14/register.dart';
import 'package:flutter_challenge/days/day15/day15.dart';
import 'package:flutter_challenge/days/day19.dart/day19.dart';
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
  // initialLocation: "/auth",
  // initialLocation: '/login_user',
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
    builder: (BuildContext context, GoRouterState state) => const DayEight(),
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
    path: '/13eg_1',
    name: "/13eg_1",
    builder: (BuildContext context, GoRouterState state) => Day13Eg(),
  ),
  GoRoute(
    path: '/day_14',
    name: "/day_14",
    builder: (BuildContext context, GoRouterState state) => const Day14(),
  ),
  GoRoute(
    path: '/login',
    name: "/login",
    builder: (BuildContext context, GoRouterState state) => Login(),
  ),
  GoRoute(
    path: '/register',
    name: "/register",
    builder: (BuildContext context, GoRouterState state) => const Register(),
  ),
  GoRoute(
    path: '/auth',
    name: "/auth",
    builder: (BuildContext context, GoRouterState state) => const AuthPage(),
  ),
  GoRoute(
    path: '/home_page',
    name: "/home_page",
    builder: (BuildContext context, GoRouterState state) => HomePage(),
  ),
  GoRoute(
    path: '/day_15',
    name: "/day_15",
    builder: (BuildContext context, GoRouterState state) => const Day15(),
  ),
  GoRoute(
    path: '/day_16',
    name: "/day_16",
    builder: (BuildContext context, GoRouterState state) =>
        const NoificationPage(),
  ),
  GoRoute(
    path: '/day_17',
    name: "/day_17",
    builder: (BuildContext context, GoRouterState state) => const Crud(),
  ),
  GoRoute(
    path: '/day_18',
    name: "/day_18",
    builder: (BuildContext context, GoRouterState state) => const Day18(),
  ),
  GoRoute(
    path: '/home_dash',
    name: "/home_dash",
    builder: (BuildContext context, GoRouterState state) => HomeDash(),
  ),
  GoRoute(
    path: '/cart_view',
    name: "/cart_view",
    builder: (BuildContext context, GoRouterState state) => const Cart(),
  ),
  GoRoute(
    path: '/user_view',
    name: "/user_view",
    builder: (BuildContext context, GoRouterState state) => const UserProfile(),
  ),
  GoRoute(
    path: '/login_user',
    name: "/login_user",
    builder: (BuildContext context, GoRouterState state) => LoginUser(
      onTap: () {},
    ),
  ),
  GoRoute(
    path: '/register_user',
    name: "/register_user",
    builder: (BuildContext context, GoRouterState state) => RegisterUser(),
  ),
  GoRoute(
    path: '/login_register',
    name: "/login_register",
    builder: (BuildContext context, GoRouterState state) => LoginOrRegister(),
  ),
  GoRoute(
    path: '/settings',
    name: "settings",
    builder: (BuildContext context, GoRouterState state) => SettingsPage(),
  ),
  // GoRoute(
  //   path: '/food_page',
  //   name: "food_page",
  //   builder: (BuildContext context, GoRouterState state) => const FoodPage(food: food),
  // ),
  GoRoute(
    path: '/day_19',
    name: "day_19",
    builder: (BuildContext context, GoRouterState state) => const LoginUser19(),
  ),
  GoRoute(
    path: '/day_20 ',
    name: "day_20",
    builder: (BuildContext context, GoRouterState state) => CounterPage(),
  ),
  GoRoute(
    path: '/responsive_1',
    name: "responsive_1",
    builder: (BuildContext context, GoRouterState state) =>
        ResponsiveDashboard(),
  ),
  GoRoute(
    path: '/responsive_2',
    name: "responsive_2",
    builder: (BuildContext context, GoRouterState state) => FlexExample(),
  ),
  GoRoute(
    path: '/responsive_3',
    name: "responsive_3",
    builder: (BuildContext context, GoRouterState state) =>
        ResponsiveProfilePage(),
  ),
  GoRoute(
    path: '/day_21 ',
    name: "day_21",
    builder: (BuildContext context, GoRouterState state) => Day21(),
  ),
  GoRoute(
    path: '/day_22 ',
    name: "day_22",
    builder: (BuildContext context, GoRouterState state) => ChatScreen(),
  ),
];
