import 'package:flutter/material.dart';
import 'package:aquadoro/pantallacarga.dart';
import 'package:aquadoro/goals_page.dart';
import 'package:aquadoro/aquadoro.dart';
 //flutter run -d web-server

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'pantallaCarga': (BuildContext context) =>PantallaDeCarga(),
        'goalsPage' : (BuildContext context) =>GoalsPage(),
        'aquadoro' : (BuildContext context) =>Aquadoro(),
      },
      initialRoute: 'pantallaCarga',
    );
  }
}