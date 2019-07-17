import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


// 每一个TabController中的内容页面

class KeepAlivePage extends StatefulWidget {
  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

// AutomaticKeepAliveClientMixin 保持状态
class _KeepAlivePageState extends State<KeepAlivePage> with AutomaticKeepAliveClientMixin {

  int _count = 0;

  // 重写 wantKeepAlive 方法，默认未false，
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("点击按扭"),
            Text('$_count',style: Theme.of(context).textTheme.display3),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _countFunction,
        tooltip: '保持状态',
        child: Icon(Icons.add),
      ),
    );
  }

  void _countFunction() {
    setState(() {
      _count++;
    });
  }
}