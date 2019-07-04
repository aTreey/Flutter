
import 'package:flutter/material.dart';

import 'pages/community_screen.dart';
import 'pages/idea_screen.dart';
import 'pages/mine_screen.dart';
import 'pages/flutter_study_screen.dart';


/*
 * StatefulWidget ： 具有可变状态(state)的窗口组件
 * 要根据变化状态，调整state 的值
 */

// 继承于 StatefulWidget

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

// 继承于 State
class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  // 定义icon的颜色，因为需要变化
  final _BottomNavigationColor = Colors.blue;

  // 声明当前选中的索引
  int _currentSelectIndex = 0;
  // 声明页面集合
  List<Widget> pages = List();

  // 重写init 方法
  @override
  void initState() {
    // TODO: implement initState
    // 初始化 pages 
    pages
    ..add(FlutterStudyScreen())
    ..add(CommunityScreen())
    ..add(IdeaScreen())
    ..add(MineScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: pages[_currentSelectIndex],
      ),


      bottomNavigationBar: BottomNavigationBar(
        onTap:(int index){
          // 动态设置state 
          setState(() {
             _currentSelectIndex = index;
          });
        },
        
        // 设置当前选中的页面
        currentIndex: _currentSelectIndex,

        type: BottomNavigationBarType.fixed,

        items:[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.laptop_mac,
              color: _BottomNavigationColor,
            ),
            
            title: Text(
              'flutrer',
              style: TextStyle(
                color: _BottomNavigationColor
              ),
            )
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment,
              color: _BottomNavigationColor,
            ),
            
            title: Text(
              '社区',
              style: TextStyle(
                color: _BottomNavigationColor
              ),
            )
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera,
              color: _BottomNavigationColor,
            ),
            
            title: Text(
              '理想ONE',
              style: TextStyle(
                color: _BottomNavigationColor
              ),
            )
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.computer,
              color: _BottomNavigationColor,
            ),
            
            title: Text(
              '我',
              style: TextStyle(
                color: _BottomNavigationColor
              ),
            )
          )
          
        ],
      ),
    );
  }
}
