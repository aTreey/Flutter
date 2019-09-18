import 'package:app_flutter/model/recommend.dart';
import 'package:flutter/foundation.dart';

class CommunityRecommendProvide with ChangeNotifier {
  List<RecommendModelDataResults> recommendList = [];
  
  // 获取推荐列时
  getRecommendList(List<RecommendModelDataResults> list){
    recommendList = list;
    notifyListeners();
  }
  
}