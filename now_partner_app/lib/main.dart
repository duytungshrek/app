import 'package:flutter/material.dart';
import 'package:now_partner/ui/views/home_view.dart';
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
        title: 'Now Partner',
        theme: ThemeData(
            backgroundColor: Colors.grey,
            textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Roboto',
                bodyColor: Colors.black,
                displayColor: Colors.white)),
        home: HomeView());
  }
}
