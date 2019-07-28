import 'package:flutter/material.dart';

class IdeaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('理想ONE'),
      ),
      body: Container(
        alignment: Alignment.center,
         child: Text('理想ONE内容'),
      ),
    );
  }
}