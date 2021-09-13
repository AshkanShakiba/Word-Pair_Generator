import "package:flutter/material.dart";
import 'package:english_words/english_words.dart';

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

class Words extends StatefulWidget {
  @override
  WordsState createState() {
    return WordsState();
  }

}

class WordsState extends State<Words> {
  Widget buildList() {
    return ListView(
      padding: EdgeInsets.all(8),
      children: [
        Container(
          height: 50,
          color: Colors.amberAccent,
          child: Center(
            child: Text("AAA"),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber,
          child: Center(
            child: Text("BBB"),
          ),
        ),
        Container(
          height: 50,
          color: Colors.orange,
          child: Center(
            child: Text("CCC"),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Word-Pair Generator")
      ),
      body: buildList()
    );
  }

}
