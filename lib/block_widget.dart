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
    return Container(
        margin: const EdgeInsets.all(8),
        child: switch (block) {
          HeaderBlock(:var text) => Text(
              text,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ParagraphBlock(:var text) => Text(text),
          CheckboxBlock(:var text, :var checked) => Row(
              children: [
                Checkbox(value: checked, onChanged: (_) {}),
                Text(text),
              ],
            )
        });
  }
}
