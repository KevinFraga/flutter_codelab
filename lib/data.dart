import 'dart:convert';

class Document {
  final Map<String, Object?> _json;

  Document() : _json = jsonDecode(documentJson);

  (String, {DateTime modified}) getMetadata() {
    if (_json
        case {
          'metadata': {
            'title': String title,
            'modified': String modified,
          }
        }) {
      return (title, modified: DateTime.parse(modified));
    }

    throw const FormatException('Unexpected JSON');
  }

  List<Block> getBlocks() {
    if (_json
        case {
          'blocks': List blocks,
        }) {
      return <Block>[
        for (var block in blocks) Block.fromJson(block),
      ];
    }

    throw const FormatException('Unexpected JSON format');
  }
}

sealed class Block {
  Block();

  factory Block.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {'type': 'h1', 'text': String text} => HeaderBlock(text),
      {'type': 'p', 'text': String text} => ParagraphBlock(text),
      {'type': 'checkbox', 'text': String text, 'checked': bool checked} =>
        CheckboxBlock(text, checked),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }
}

class HeaderBlock extends Block {
  HeaderBlock(this.text);

  final String text;
}

class ParagraphBlock extends Block {
  ParagraphBlock(this.text);

  final String text;
}

class CheckboxBlock extends Block {
  CheckboxBlock(this.text, this.checked);

  final String text;
  final bool checked;
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": false,
      "text": "Learn Dart 3"
    }
  ]
}
''';
