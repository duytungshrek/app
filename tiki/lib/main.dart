import 'package:flutter/material.dart';
import 'package:tiki/ui/views/home_view.dart';
import './service_locator.dart';

void main() {
  // Register all the models and services before the app starts
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tiki',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.grey,
            textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Garamond',
                bodyColor: Colors.black54,
                displayColor: Colors.white)),
        home: HomeView());
  }
}
