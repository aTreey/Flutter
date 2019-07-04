
import 'package:flutter/material.dart';

class MineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我'),
      ),
      body: Container(
        alignment: Alignment.center,
         child: Text('我--内容'),
      ),
    );
  }
}