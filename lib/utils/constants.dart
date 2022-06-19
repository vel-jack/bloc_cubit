import 'package:bloc_cubit/main.dart';
import 'package:bloc_cubit/topics/cubitcart/cubit_cart.dart';
import 'package:bloc_cubit/topics/simplecubit/simplecubit.dart';
import 'package:flutter/material.dart';

final routes = <String, Map<String, dynamic>>{
  // "": {"name": "", "view": const }
  "simplecubit": {"name": "Simple Cubit", "view": const SimpleCubit()},
  "cubitcart": {"name": "Cubit Cart", "view": const CubitCart()}
};

final kRoutes = <String, WidgetBuilder>{
  Navigator.defaultRouteName: (context) => MyHomePage(title: 'Bloc & Cubit'),
  for (String routeName in routes.keys)
    routeName: (context) => routes[routeName]!["view"]
};
