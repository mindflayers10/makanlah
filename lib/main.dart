import 'package:flutter/material.dart';
import 'package:makanlah/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MakanLah',
      theme: ThemeData(),
      home: Login(),
    );
  }
}


