import 'dart:ui';
import 'package:flutter/material.dart';
import 'intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.redAccent,
        accentColor: Colors.white,
        buttonColor: Colors.redAccent,
        //backgroundColor: Colors.teal,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.lightBlue.shade700),
          headline6: TextStyle(fontSize: 36.0, fontWeight: FontWeight.normal),
          bodyText1: TextStyle(fontSize: 20.0),
          bodyText2: TextStyle(fontSize: 18.0),

        ),
      ),
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}