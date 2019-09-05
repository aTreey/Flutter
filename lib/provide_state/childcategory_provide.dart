import 'package:app_flutter/model/category.dart';
import 'package:flutter/widgets.dart';

class ChildCategoryItemProvide with ChangeNotifier {
  // 声明泛型变量
  List<BxMallSubDto> categoryItemlist = []; //商品列表
  //大类ID
  String categoryId = '0'; 
  //小类ID 
  String subId ='0'; 
  // 右边顶部子分类索引
  int subCategoyrIndex = 0;

  // 赋值并发送通知
  getCategoryItemlist(List<BxMallSubDto> list) {
    // 每次点击左边大类需要清空子类索引
    subCategoyrIndex = 0;
    BxMallSubDto all = BxMallSubDto();
    all.mallCategoryId = '00';
    all.mallSubId = '00';
    all.comments = 'null';
    all.mallSubName = '全部';
    categoryItemlist=[all];
    categoryItemlist.addAll(list);
    notifyListeners();
  }

  // 增加右边顶部状态变化管理
  
  changeSubCategoryIndex(index){
    subCategoyrIndex=index;
    notifyListeners();
  }
}