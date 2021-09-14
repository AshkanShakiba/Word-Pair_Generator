import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Words extends StatefulWidget {
  @override
  WordsState createState() {
    return WordsState();
  }

}

class WordsState extends State<Words> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Word-Pair Generator")
        ),
        body: buildList()
    );
  }

  final wordPairs=<WordPair>[];
  final savedWordPairs=Set<WordPair>();

  Widget buildList() {
    return ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, item){
          if(item.isOdd) {
            return Divider();
          }
          var index=item~/2;
          if(index>=wordPairs.length){
            wordPairs.addAll(generateWordPairs().take(11));
          }
          return buildRow(wordPairs[index]);
        }
    );
  }

  Widget buildRow(WordPair wordPair){
    final isSaved=savedWordPairs.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: TextStyle(
            fontSize: 16
        ),
      ),
      trailing: Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null
      ),
    );
  }
}