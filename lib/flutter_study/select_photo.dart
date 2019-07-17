import 'package:flutter/material.dart';

/*
 * 相册选择控件
 * 1. 使用warp 布局
 * 2. 使用手势
 */
class SelectPhotoWidget extends StatefulWidget {
  @override
  _SelectPhotoWidgetState createState() => _SelectPhotoWidgetState();
}

class _SelectPhotoWidgetState extends State<SelectPhotoWidget> {

  List<Widget> list;
  
  @override
  void initState() {
    
    super.initState();
    list = List<Widget>();
    list..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽高
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('照片选择器'),
      ),

      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: width,
            color: Colors.cyan,

            child: Wrap(
              children: list,
              spacing: 15,
              // alignment: WrapAlignment.spaceBetween,
              // alignment: WrapAlignment.center
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              runSpacing: 15.0,
            ),
          ),
        ),
      ),
    );
  }

  // 自定义➕号按钮

  Widget buildAddButton(){
    // 返回手势
    return GestureDetector(
      onTap: (){
        if (list.length<9) {
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },

      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.white,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}