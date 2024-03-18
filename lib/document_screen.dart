import "package:codelab/data.dart";
import "package:flutter/material.dart";

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({required this.document, super.key});

  final Document document;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text('body'),
        ),
      ],
    );
  }
}
