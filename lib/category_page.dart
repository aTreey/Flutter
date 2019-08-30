import 'dart:convert';

import 'package:app_flutter/config/serviceUrl.dart';
import 'package:app_flutter/model/category.dart';
import 'package:app_flutter/model/categoryGoodsList.dart';
import 'package:app_flutter/provide_state/category_goodList_provide.dart';
import 'package:app_flutter/provide_state/category_provide.dart';
import 'package:app_flutter/service/service_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

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
            CategoryListWidget(),
            Column(
              children: <Widget>[
                CategoryTopSegmentWidget(),
                CategoryItemListWidget()
              ],
            )
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
    });
  }
}


// 分类列表
class CategoryListWidget extends StatefulWidget {  
  @override
  _CategoryListWidgetState createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {

  List<FakeCategoryData> list;
  
  int selectedIndex = 0;
  @override
  void initState() {
    _fakeCategoryData();
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
        itemCount: list.length,
        itemBuilder: (context, index){
          return _categoryInWell(index);
        }
      ),
    );
  }
  
  Widget _categoryInWell(int index){
    bool isSelectd=false;
    isSelectd = (index == selectedIndex) ? true : false;
    return InkWell(
      onTap: (){
        // 修改状态
        setState(() {
          selectedIndex=index;
        });

        // 修改状态，切换顶部分类数据
        var categoryItemList = list[index].bxMallSubDto;
        Provide.value<CategoryItemProvide>(context).getCategoryItemlist(categoryItemList);
        
        // 请求商品列表数据，可选参数传递参数时必须加形参
        _getGoodsList(type: index.toString());
      },
      
      child: Padding(
        padding: EdgeInsets.all(0),
          child: Container(
            padding: EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            height: ScreenUtil().setHeight(80),
            decoration: BoxDecoration(
              color: isSelectd ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.black12, width:  1)
              )
            ),
            child: Text(
              list[index].mallCategoryName,
              textAlign: TextAlign.left, 
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: ScreenUtil().setSp(26))
            ),
        ),
      )
    );
  }

  void _fakeCategoryData() {
    var jsonData = json.decode(fakeJasonData);
    FakeCategoryListModel model = FakeCategoryListModel.fromJson(jsonData);
    model.data.forEach((item) => print(item.mallCategoryName));
    list = model.data;
    // TODO: 设置第一次进来后的数据
    // Provide.value<CategoryItemState>(context).getCategoryItemlist(list[0].bxMallSubDto);
  }

  void _getCategoryData() {
    
  }
  
  void _getGoodsList({String type}){
    getGoodsListData(type).then((val){
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(val);
      print(goodsList);
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);
    });
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
  //   return Container(
  //     child: Container(
  //       height: ScreenUtil().setHeight(80),
  //       width: ScreenUtil().setWidth(570),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         border: Border(
  //           bottom: BorderSide(
  //             width: 1.0,
  //             color: Colors.black12
  //           )
  //         )
  //       ),
  //       child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: .length,
  //         itemBuilder: (context, index){
  //           return _segementItem(list[index]);
  //         },
  //       ),
        
  //     ),
  //   );

    // TODO: 使用 Provide 状态管理后

    return Provide<CategoryItemProvide>(
      builder: (context, child, category){
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: Colors.black12
              )
            )
          ),

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.categoryItemlist.length,
            itemBuilder: (context, index){
              return _segementItem(category.categoryItemlist[index]);
            },
          ),
        );
      },
    );
  }

  Widget _segementItem(BxMallSubDto item){
    return InkWell(
      onTap: (){
        
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          item.mallSubName,
          style: TextStyle(
            color: Colors.black87,
            fontSize: ScreenUtil().setSp(28)
          )
        ),
      ),
    );
  }
}

// 列表
class CategoryItemListWidget extends StatefulWidget {
  @override
  _CategoryItemListWidgetState createState() => _CategoryItemListWidgetState();
}

class _CategoryItemListWidgetState extends State<CategoryItemListWidget> {

  List<CategoryGoodsDataModel> goodsList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 使用provider 
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, data){
        return Container(
          width: ScreenUtil().setWidth(570),
          height: ScreenUtil().setHeight(980),
          child: ListView.builder(
            itemCount: data.goodsList.length,
            itemBuilder: (context, index){
              return _goodListWidget(data.goodsList, index);
            }
          )       
        );
      },
    );
  }

  Widget  _goodListWidget(List newList, int index){
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.black12, width: 1)
          )
        ),
        child: Row(
          children: <Widget>[
            _goodsItemImage(newList, index),
            Column(
              children: <Widget>[
                _goodsName(newList, index),
                _goodsPrice(newList, index),
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _goodsItemImage(newList, index){
    return Container(
      width: ScreenUtil().setWidth(180),
      child: Image.network(newList[index].image),
    );
  }

  Widget _goodsName(newList, index){
    return Container(
      width: ScreenUtil().setWidth(370),
      padding: EdgeInsets.all(5),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
        ),
      ),
    );
  }

  Widget _goodsPrice(newList, index){
    return Container(
      margin: EdgeInsets.only(top:20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            '价格：¥${newList[index].presentPrice}',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: ScreenUtil().setSp(30)
            ),
          ),

          Text(
            '¥ ${newList[index].oriPrice}',
            style: TextStyle(
              color:  Colors.black26,
              fontSize: ScreenUtil().setSp(28),
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }
}