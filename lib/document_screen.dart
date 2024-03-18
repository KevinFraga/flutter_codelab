import "package:codelab/block_widget.dart";
import "package:codelab/data.dart";
import "package:flutter/material.dart";

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({required this.document, super.key});

  final Document document;

  @override
  Widget build(BuildContext context) {
    var (title, :modified) = document.getMetadata();
    var blocks = document.getBlocks();

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
            child: Text('Last modified: $modified'),
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
