import 'dart:convert';

import 'package:app_flutter/config/serviceUrl.dart';
import 'package:app_flutter/model/category.dart';
import 'package:app_flutter/service/service_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatefulWidget {
  
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  int pageSize = 6;
  List categoryData = [];

  @override
  void initState() {
    
    _getCategoryData();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            CategoryListWidget(list: categoryData),
            
          ],
        ),          
      )
    );
  }

  // 请求类别数据
  void _getCategoryData() async{
    var parameters = {'pageSize': pageSize};
    requestCategoryData(parameters).then((val){
      List<Map> data=((val['data']['list']) as List).cast();
      print('data === $data');
      setState(() {
        _fakeCategoryData();
      });
    });
  }

  
  void _fakeCategoryData() {
    var jsonData = json.decode(fakeJasonData);
    FakeCategoryListModel list = FakeCategoryListModel.fromJson(jsonData);
    list.data.forEach((item) => print(item.mallCategoryName));
    categoryData = list.data;
  }
}


// 分类列表
class CategoryListWidget extends StatefulWidget {
  List<FakeCategoryData> list = [];
  
  CategoryListWidget({this.list});

  @override
  _CategoryListWidgetState createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(width: 1.0, color: Colors.black12)
        )
      ),
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index){
          return _categoryInWell(index);
        }
      ),
    );
  }
  
  Widget _categoryInWell(int index){
    return InkWell(
      onTap: (){

      },
      
      child: Padding(
        padding: EdgeInsets.all(0),
          child: Container(
            padding: EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            height: ScreenUtil().setHeight(80),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.black12, width:  1)
              )
            ),
            child: Text(
              widget.list[index].mallCategoryName,
              textAlign: TextAlign.left, 
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: ScreenUtil().setSp(26))
            ),
        ),
      )
    );
  }
}


// 右边顶部分类

class CategoryTopSegmentWidget extends StatefulWidget {
  @override
  _CategoryTopSegmentWidgetState createState() => _CategoryTopSegmentWidgetState();
}

class _CategoryTopSegmentWidgetState extends State<CategoryTopSegmentWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}