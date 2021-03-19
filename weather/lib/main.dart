import 'package:flutter/material.dart';
import 'package:weather/ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherFlut',
      debugShowCheckedModeBanner: false,//Quitar banner de debug
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

