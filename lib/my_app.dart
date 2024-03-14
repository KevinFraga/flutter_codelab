import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:codelab/my_app_state.dart';
import 'package:codelab/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Codelab',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        ),
        home: HomePage(),
      ),
    );
  }
}
