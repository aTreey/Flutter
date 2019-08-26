
import 'package:app_flutter/model/categoryGoodsList.dart';
import 'package:flutter/cupertino.dart';

class CategoryGoodsListProvide with ChangeNotifier{
  // 声明一个list，需要改变的数据为分类对应的 右边 列表，所以 list 范型为 CategoryGoodsListModel 
  List<CategoryGoodsListModel> goodsList = [];
  
  // 声明修改数据的函数
  getGoodsList(List<CategoryGoodsListModel> list){
    goodsList=list;
    notifyListeners();
  }
}