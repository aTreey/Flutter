import 'package:app_flutter/model/category.dart';
import 'package:flutter/widgets.dart';

class CategoryItemState with ChangeNotifier {  
  // 声明泛型变量
  List<BxMallSubDto> categoryItemlist = [];

  // 赋值并发送通知
  getCategoryItemlist(List<BxMallSubDto> list) {
    BxMallSubDto all = BxMallSubDto();
    all.mallCategoryId = '00';
    all.mallSubId = '00';
    all.comments = 'null';
    all.mallSubName = '全部';
    categoryItemlist=[all];
    categoryItemlist.addAll(list);
    notifyListeners();
  }

}