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

class Block {
  Block(this.type, this.text);

  final String type;
  final String text;

  factory Block.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'type': var type,
          'text': var text,
        }) {
      return Block(type, text);
    }

    throw const FormatException('Unexpected JSON format');
  }
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
