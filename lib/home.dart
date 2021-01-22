import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String username;
  HomePage({this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('hello :)'+username),
    );
  }
}
