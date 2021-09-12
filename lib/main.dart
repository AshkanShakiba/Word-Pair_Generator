import "package:flutter/material.dart";
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Word-Pair Generator")
          ),
          body: Center(
            child: Text(wordPair.asPascalCase),
          )
        ),
        theme: ThemeData(primaryColor: Colors.green)
    );
  }
}
