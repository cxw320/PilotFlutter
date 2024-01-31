import 'package:flutter/material.dart';
import 'package:pilot/Components/Main/app_root.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRoot = AppRoot();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: appRoot.router().login(),
    );
  }
}
