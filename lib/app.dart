import 'package:flutter/material.dart';
import 'package:task_app/pages/index.dart';
import 'package:task_app/utils/index.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: brightness,
        primaryColor: primaryColor,
        accentColor: accentColor,
      ),
      home: TaskList(),
    );
  }
}
