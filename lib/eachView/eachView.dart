
import 'dart:ui' as prefix0;

/**
 * 使用动态view生成四个主要页面
 * 
 */

import 'package:flutter/material.dart';
import 'package:app_flutter/custome_router.dart';
import 'package:flutter/rendering.dart';


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
            ),

            RaisedButton(
              child: Text('毛玻璃效果'),
              onPressed: (){
                Navigator.of(context).push(CustomRoute(BlurView()));
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

class BlurView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(), // 可扩展的
            child:Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg')
          ),

          Center(
            child: ClipRect( // 裁切长方形
              child: BackdropFilter( // 滤镜
                filter: prefix0.ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0
                ),

                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                    width: 500,
                    height: 700,
                    decoration: BoxDecoration(color: Colors.grey.shade200),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '毛玻璃效果',
                          style: Theme.of(context).textTheme.display3, // 设置比较酷炫的字体
                        ),

                        MaterialButton(
                          child: Text('返回'),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}