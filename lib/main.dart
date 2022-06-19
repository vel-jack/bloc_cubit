import 'package:bloc_cubit/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Cubit', debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: kRoutes,
      // home: const MyHomePage(title: 'Bloc & Cubit'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final List<String> routeNames = routes.keys.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${routes[routeNames[index]]!["name"]}'),
            onTap: () {
              Navigator.pushNamed(context, routeNames[index],
                  arguments: routes[routeNames[index]]!["name"]);
            },
          );
        },
      ),
    );
  }
}
