import 'package:codelab/big_card.dart';
import 'package:codelab/my_app_state.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Center(
        child: ListView(
          children: [
            Text('Favoritos: '),
            for (WordPair word in appState.favorites) BigCard(pair: word),
          ],
        ),
      ),
    );
  }
}
