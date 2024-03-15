import 'package:codelab/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:codelab/generator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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

      default:
        throw UnimplementedError('Unimplemented');
    }

    return LayoutBuilder(builder: (context, constrains) {
      return Scaffold(
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
                ],
                selectedIndex: selected,
                onDestinationSelected: (value) {
                  setState(() {
                    selected = value;
                  });
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
