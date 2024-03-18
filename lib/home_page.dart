import 'package:codelab/data.dart';
import 'package:codelab/document_screen.dart';
import 'package:codelab/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:codelab/generator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.title, super.key});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selected) {
      case 0:
        page = const GeneratorPage();
        break;

      case 1:
        page = const FavoritePage();
        break;

      case 2:
        page = DocumentScreen(document: Document());
        break;

      default:
        throw UnimplementedError('Unimplemented');
    }

    return LayoutBuilder(builder: (context, constrains) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        ),
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constrains.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.edit_document),
                    label: Text('Documents'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.logout),
                    label: Text('Logout'),
                  ),
                ],
                selectedIndex: selected,
                onDestinationSelected: (value) {
                  if (value == 3) {
                    Navigator.of(context).pop();
                  } else {
                    setState(() {
                      selected = value;
                    });
                  }
                },
              ),
            ),
            Expanded(
              child: page,
            )
          ],
        ),
      );
    });
  }
}
