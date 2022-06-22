import 'package:bloc_cubit/main.dart';
import 'package:bloc_cubit/topics/cubitcart/cubit_cart.dart';
import 'package:bloc_cubit/topics/cubitobserver/counter_view.dart';
import 'package:bloc_cubit/topics/infinitelist/posts/view/posts.dart';
import 'package:bloc_cubit/topics/simplecubit/simplecubit.dart';
import 'package:bloc_cubit/topics/timerapp/view/timer_view.dart';
import 'package:flutter/material.dart';

final routes = <String, Map<String, dynamic>>{
  // "": {"name": "", "view": const }
  "simplecubit": {"name": "Simple Cubit", "view": const SimpleCubit()},
  "cubitcart": {"name": "Cubit Cart", "view": const CubitCart()},
  "cubitobserver": {
    "name": "Cubit Observer",
    "view": const ObserverCounterView()
  },
  "bloctimer": {"name": "BLoC Timer", "view": const TimerViewPage()},
  "infinitelist": {"name": "Infinite Posts", "view": const PostPage()}
};

final kRoutes = <String, WidgetBuilder>{
  Navigator.defaultRouteName: (context) => MyHomePage(title: 'Bloc & Cubit'),
  for (String routeName in routes.keys)
    routeName: (context) => routes[routeName]!["view"]
};
