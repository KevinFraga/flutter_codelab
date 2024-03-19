import "package:codelab/block_widget.dart";
import "package:codelab/data.dart";
import "package:flutter/material.dart";

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({required this.document, super.key});

  final Document document;

  String formatDate(DateTime date) {
    var today = DateTime.now();
    var diff = date.difference(today);

    return switch (diff) {
      Duration(inDays: 0) => 'today',
      Duration(inDays: 1) => 'tomorrow',
      Duration(inDays: -1) => 'yesterday',
      Duration(inDays: var days) when days > 7 => '${days ~/ 7} weeks from now',
      Duration(inDays: var days) when days < -7 =>
        '${days.abs() ~/ 7} weeks ago',
      Duration(inDays: var days, isNegative: true) => '${days.abs()} days ago',
      Duration(inDays: var days) => '$days days from now',
    };
  }

  @override
  Widget build(BuildContext context) {
    var (title, :modified) = document.getMetadata();
    var blocks = document.getBlocks();
    var format = formatDate(modified);

    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Center(
            child: Text('Last modified: $format'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context, index) {
                return BlockWidget(block: blocks[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
