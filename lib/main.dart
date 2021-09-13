import 'package:flutter/material.dart';
import 'Words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Words(),
        theme: ThemeData(primaryColor: Colors.green)
    );
  }
}