import 'package:app_flutter/model/category.dart';
import 'package:flutter/foundation.dart';

class CategoryProvide with ChangeNotifier{
  List<MockCategoryData> categoryList = [];
  getCategoryList(List<MockCategoryData> list){
    categoryList=list;
    notifyListeners();
  }
}