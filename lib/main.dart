import 'package:flutter/material.dart';
import 'pages/loading_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX data Demo',
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}