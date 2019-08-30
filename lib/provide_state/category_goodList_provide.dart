
import 'package:app_flutter/model/categoryGoodsList.dart';
import 'package:flutter/cupertino.dart';

class CategoryGoodsListProvide with ChangeNotifier{
  // 声明一个list，需要改变的数据为分类对应的 右边 列表，所以 list 范型为 CategoryGoodsListModel 
  List<CategoryGoodsDataModel> goodsList = [];
  
  // 声明修改数据的函数, 点击大类时更换商品列表
  getGoodsList(List<CategoryGoodsDataModel> list){
    goodsList=list;
    notifyListeners();
  }
}