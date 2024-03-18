import 'package:codelab/data.dart';
import 'package:flutter/material.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({
    required this.block,
    super.key,
  });

  final Block block;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle;

    switch (block.type) {
      case 'h1':
        textStyle = Theme.of(context).textTheme.displayMedium;

      case 'p' || 'checkbox':
        textStyle = Theme.of(context).textTheme.bodyMedium;

      case _:
        textStyle = Theme.of(context).textTheme.bodySmall;
    }

    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(
        block.text,
        style: textStyle,
      ),
    );
  }
}
