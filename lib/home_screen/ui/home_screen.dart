import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
