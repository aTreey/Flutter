import 'package:flutter/material.dart';

class ToolTipDemo  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Tooltip(
          message: '轻量提示控件',
          child: Icon(Icons.all_inclusive),
        ),
      ),
    );
  }
}