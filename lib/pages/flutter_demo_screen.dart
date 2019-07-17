import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './flutter_keepalive_screen.dart';

// 定义左右可切换的 FlutterDemoScreen 
/*
  继承可变组件
 */

class FlutterDemoScreen extends StatefulWidget {
  @override
  _FlutterDemoScreenState createState() => _FlutterDemoScreenState();
}

/// 使用with关键字解决多重继承
/// 
class _FlutterDemoScreenState extends State<FlutterDemoScreen> with SingleTickerProviderStateMixin {
  
  TabController _controller;

  // 为了保持状态，需重写initState 方法 和销毁方法
  @override
  void initState() {
    super.initState();
    // 传入this 表示讲该类传递给了 组件 TabController
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segement View'),
        // 设置底部组建件
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Text('推荐'),
            Text('关注'),
            Text('问答'),
            Text('导购'),

            // Tab(icon: Icon(Icons.trip_origin)),
            // Tab(icon: Icon(Icons.directions_car)),
            // Tab(icon: Icon(Icons.directions_bus)),
            // Tab(icon: Icon(Icons.directions_transit)),
          ],
        ),
      ),

      // 和前面TabBar 一一对应
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          // Text('111'),
          // Text('222'),
          // Text('333'),
          // Text('444'),
          KeepAlivePage(),
          KeepAlivePage(),
          KeepAlivePage(),
          KeepAlivePage()
        ],
      ),
    );
  }

  Widget _setupTabPage() {
    return Container(
      child: Column(
        children: <Widget>[
            RaisedButton(
                child: Text('测试1'),
                onPressed: (){
                  
                },
              ),
    
              MaterialButton(
                child: Text('测试2'),
                onPressed: (){
                  
                },
              ),
    
              RaisedButton(
                child: Text('测试3'),
                onPressed: (){
                  
                },
              ),
    
              MaterialButton(
                child: Text('测试4'),
                onPressed: (){
                  
                },
              )
        ],
      ),
    );
  }
}