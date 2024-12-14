import 'package:flutter/material.dart';
import 'package:ninja_trips/screens/home.dart';
import 'package:ninja_trips/screens/sandbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ninja Trips',
      home: Home(),
    );
  }
}
