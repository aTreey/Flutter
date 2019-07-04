
/**
 * 使用动态view生成四个主要页面
 * 
 */

import 'package:flutter/material.dart';
import 'package:app_flutter/custome_router.dart';


class EachView extends StatefulWidget {

  // 内容, 从导航页面传递过来
  final String _title;
  // 构造方法
  EachView(this._title);
  
  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget._title),
            MaterialButton(
              child: Text('正常跳转子页面'),
              // child: Text('跳转动画'),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return SecondPage();
                }));
              },
            ),
            MaterialButton(
              child: Icon(
                Icons.navigate_next,
                color: Colors.pinkAccent,
                size: 64,
              ),
              // child: Text('跳转动画'),
              onPressed: (){
                Navigator.of(context).push(CustomRoute(SecondPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        title: Text('push动画效果'),
        backgroundColor: Colors.deepOrange,
        leading: Container(),
        
        // AppBar 滚动时的融合程度，一般有滚动时默认是4.0，现在我们设置成0.0，就是和也main完全融合了。
        // elevation: 4.0,
        
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.black,
            size: 64.0,
          ),

          onPressed: (){
            Navigator.of(context).pop();
          }
        ),
      ),
    );
  }
}