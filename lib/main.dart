import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(PPUFeedApp());
}

class PPUFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPU Feed App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
