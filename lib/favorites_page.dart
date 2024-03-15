import 'package:codelab/my_app_state.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: const Center(
          child: Text('No favorites yet...'),
        ),
      );
    }

    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have ${appState.favorites.length} favorites:'),
          ),
          for (WordPair word in appState.favorites)
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(word.asPascalCase),
              titleAlignment: ListTileTitleAlignment.center,
            ),
        ],
      ),
    );
  }
}
