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
            title: Text("Word-Pair Generator"),
            actions: <Widget>[
              IconButton(
                 icon: Icon(Icons.list),
                onPressed: pushSaved,
              ),
            ],
        ),
        body: buildList()
    );
  }

  pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles=savedWordPairs.map((WordPair wordPair) => ListTile(
            title: Text(
              wordPair.asPascalCase,
              style: TextStyle(
                  fontSize: 16
              ),
            ),
          ));

          final List<Widget> list=ListTile.divideTiles(
              context: context,
              tiles: tiles
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text("Saved Word-Pairs"),
            ),
            body: ListView(children: list),
          );
        }
      )
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
      onTap: () {
        setState(() {
          if(isSaved){
            savedWordPairs.remove(wordPair);
          }
          else {
            savedWordPairs.add(wordPair);
          }
        });
      },
    );
  }
}