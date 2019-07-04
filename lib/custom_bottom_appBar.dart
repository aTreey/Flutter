import 'package:flutter/material.dart';
import 'eachView/eachView.dart';

/*
 * 自定义底部按钮
 */


class CustomBottomAppBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自定义底部按钮',
      theme: ThemeData(
        // 设置 FAB 按钮的颜色
        primarySwatch: Colors.green
      ),
      home: CustomBottomAppBar(),
    );
  }
}

class CustomBottomAppBar extends StatefulWidget {
  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {

  // 定义数组
  List<Widget> _eachViews;
  // 选中的页面索引
  int _index=0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eachViews=List();
    
    // 添加
    _eachViews
    ..add(EachView('安卓手机'))
    ..add(EachView('iPhone 手机'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // 设置默认选中的页面
      body: _eachViews[_index],

      // 设置浮动按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 设置浮动的按钮
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('FloatingActionButton');
          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          //   return EachView('Navigator.push--新的页面');
          // }));


          // 打开新页面
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return EachView('Navigator.of新的页面');
          }));
        },
        // 设置长按文字
        tooltip: '长按时才会出现',
        // 按钮中的➕
        child: Icon(
          Icons.add,
          color: Colors.white
        ),
      ),
      
      // 底部导航栏设置为工具栏，使用更加灵活
      bottomNavigationBar: BottomAppBar(
        // 颜色
        color: Colors.lightBlue,
        // 设置要和FAB融合的形状为在矩形中有个圆形切口
        shape: CircularNotchedRectangle(),
        // 左右两边按钮布局
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.phone_android),
              color: Colors.white,
              onPressed: (){
                print('select phone_android');
                  setState(() {
                    _index=0;
                  }); 
              },
            ),

            IconButton(
              icon: Icon(Icons.phone_iphone),
              color: Colors.white,
              onPressed: (){
                print('select phone_iphone');
                setState(() {
                  _index=1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}