import 'package:bloc_cubit/main.dart';
import 'package:bloc_cubit/topics/simplecubit/simplecubit.dart';
import 'package:flutter/material.dart';

final routes = <String, Map<String, dynamic>>{
  // "page1": {"name": "Page 1", "view": const Page1()},
  // "page2": {"name": "Page 2", "view": const Page1()}
  "simplecubit": {"name": "Simple Cubit", "view": const SimpleCubit()}
};

final kRoutes = <String, WidgetBuilder>{
  Navigator.defaultRouteName: (context) => MyHomePage(title: 'Bloc & Cubit'),
  for (String routeName in routes.keys)
    routeName: (context) => routes[routeName]!["view"]
};
