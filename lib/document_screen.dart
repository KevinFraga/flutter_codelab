import "package:codelab/data.dart";
import "package:flutter/material.dart";

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({required this.document, super.key});

  final Document document;

  @override
  Widget build(BuildContext context) {
    var metadata = document.getMetadata();

    return Column(
      children: [
        Center(
          child: Text(
            metadata.$1,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Center(
          child: Text('Last modified: ${metadata.modified}'),
        ),
      ],
    );
  }
}
